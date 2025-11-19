import Foundation

/// Scans Xcode templates and captures complete plist data
public class TemplateScanner {
    // TODO: Make Xcode path configurable/selectable by user in future
    // For now, hardcoded to standard Xcode.app location
    private let xcodeTemplatesPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates"
    private let fileManager = FileManager.default
    private lazy var templateRoots: [String] = // Only scan main Xcode.app bundle, not platform-specific templates
        [xcodeTemplatesPath]

    public init() {}

    /// Scan all Xcode templates and return complete inventory
    public func scanAllTemplates() -> TemplateInventory {
        var templates: [TemplateMetadata] = []
        var seenPaths = Set<String>()

        for root in templateRoots where fileManager.fileExists(atPath: root) {
            templates.append(contentsOf: scanTemplates(atRoot: root, seenPaths: &seenPaths))
        }

        // Calculate total combinations
        let totalCombinations = templates.reduce(0) { $0 + $1.totalCombinations }

        return TemplateInventory(
            generatedAt: ISO8601DateFormatter().string(from: Date()),
            templates: templates,
            totalTemplates: templates.count,
            totalCombinations: totalCombinations
        )
    }

    private func scanTemplates(atRoot root: String, seenPaths: inout Set<String>) -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        guard let enumerator = fileManager.enumerator(atPath: root) else {
            return templates
        }

        for case let file as String in enumerator where file.hasSuffix("TemplateInfo.plist") {
            let templateRelativePath = (file as NSString).deletingLastPathComponent
            let fullPath = "\(root)/\(templateRelativePath)"
            if seenPaths.insert(fullPath).inserted,
               let metadata = parseTemplate(at: fullPath, templateType: determineTemplateType(path: fullPath)) {
                templates.append(metadata)
            }
        }

        return templates
    }

    private func determineTemplateType(path: String) -> String {
        if path.contains("/Project Templates/") {
            return "Project"
        } else if path.contains("/File Templates/") {
            return "File"
        } else if path.contains("/Package Templates/") {
            return "Package"
        } else {
            return "Unknown"
        }
    }

    private func parseTemplate(at path: String, templateType: String) -> TemplateMetadata? {
        let plistPath = "\(path)/TemplateInfo.plist"

        guard fileManager.fileExists(atPath: plistPath) else {
            return nil
        }

        let name = URL(fileURLWithPath: path).deletingPathExtension().lastPathComponent

        // Read raw plist content for display
        let rawContent = try? String(contentsOfFile: plistPath, encoding: .utf8)

        // Detect plist format type
        let contentType: String?
        if let content = rawContent {
            if content.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("<?xml") {
                contentType = "xml"
            } else if content.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("{") {
                contentType = "json"
            } else {
                contentType = "openstep"
            }
        } else {
            contentType = nil
        }

        guard let plistData = try? Data(contentsOf: URL(fileURLWithPath: plistPath)),
              let plist = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: Any] else {
            return nil
        }

        // Extract template identifier from plist
        // IMPORTANT: Xcode uses different field names for different template types:
        //
        // Project/Package Templates (88 templates):
        //   - Have "Identifier" field (e.g., "com.apple.dt.unit.app")
        //   - Also have "Kind" field for category (e.g., "Xcode.Xcode3.ProjectTemplateUnitKind")
        //
        // File Templates (58 templates):
        //   - Only have "Kind" field (e.g., "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind")
        //   - No "Identifier" field present
        //
        // Total: 146 templates in Xcode.app bundle
        //
        // Strategy: Use "Identifier" if available (Project/Package), otherwise use "Kind" (File)
        let kindString: String
        if let identifier = plist["Identifier"] as? String {
            kindString = identifier
        } else if let kind = plist["Kind"] as? String {
            kindString = kind
        } else {
            return nil // Skip templates without Identifier or Kind field
        }

        // Parse template kind - unknown kinds are preserved as .unknown(String)
        let kind = TemplateKind(rawValue: kindString)

        let ancestors = plist["Ancestors"] as? [String]

        // Extract options
        let options = extractOptions(from: plist)

        // Calculate combinations
        let combinations = calculateCombinations(for: options)

        // Build file structure
        let fileStructure = buildFileStructure(at: path, relativeTo: path)

        // Extract all string fields
        let description = plist["Description"] as? String
        let associatedTargetSpecification = plist["AssociatedTargetSpecification"] as? String
        let buildableType = plist["BuildableType"] as? String
        let defaultCompletionName = plist["DefaultCompletionName"] as? String
        let hiddenFromChooser = plist["HiddenFromChooser"] as? String
        let hiddenFromLibrary = plist["HiddenFromLibrary"] as? String
        let icon = plist["Icon"] as? String
        let image = plist["Image"] as? String
        let mainTemplateFile = plist["MainTemplateFile"] as? String
        let templateName = plist["Name"] as? String
        let nameOfInitialFileForEditor = plist["NameOfInitialFileForEditor"] as? String
        let packageType = plist["PackageType"] as? String
        let project = plist["Project"] as? String
        let summary = plist["Summary"] as? String

        // Extract boolean fields
        let concrete = plist["Concrete"] as? Bool
        let localizedByDefault = plist["LocalizedByDefault"] as? Bool
        let projectOnly = plist["ProjectOnly"] as? Bool
        let supportsSwiftPackage = plist["SupportsSwiftPackage"] as? Bool
        let suppressTopLevelGroup = plist["SuppressTopLevelGroup"] as? Bool
        let targetOnly = plist["TargetOnly"] as? Bool

        // Extract integer fields
        let sortOrder = plist["SortOrder"] as? Int

        return TemplateMetadata(
            name: name,
            path: path,
            kind: kind,
            ancestors: ancestors?.compactMap { TemplateKind(rawValue: $0) },
            options: options,
            totalCombinations: combinations,
            fileStructure: fileStructure.isEmpty ? nil : fileStructure,
            description: description,
            associatedTargetSpecification: associatedTargetSpecification,
            buildableType: buildableType,
            defaultCompletionName: defaultCompletionName,
            hiddenFromChooser: hiddenFromChooser,
            hiddenFromLibrary: hiddenFromLibrary,
            icon: icon,
            image: image,
            mainTemplateFile: mainTemplateFile,
            templateName: templateName,
            nameOfInitialFileForEditor: nameOfInitialFileForEditor,
            packageType: packageType,
            project: project,
            summary: summary,
            concrete: concrete,
            localizedByDefault: localizedByDefault,
            projectOnly: projectOnly,
            supportsSwiftPackage: supportsSwiftPackage,
            suppressTopLevelGroup: suppressTopLevelGroup,
            targetOnly: targetOnly,
            sortOrder: sortOrder,
            rawContent: rawContent,
            rawContentType: contentType
        )
    }

    private func extractOptions(from plist: [String: Any]) -> [TemplateOptionJSON] {
        var options: [TemplateOptionJSON] = []

        guard let optionsArray = plist["Options"] as? [[String: Any]] else {
            return options
        }

        for optionDict in optionsArray {
            guard let identifier = optionDict["Identifier"] as? String,
                  let name = optionDict["Name"] as? String else {
                continue
            }

            let type = optionDict["Type"] as? String
            let defaultValue = optionDict["Default"] as? String
            let description = optionDict["Description"] as? String
            let override = optionDict["Override"] as? String
            let notPersisted = optionDict["NotPersisted"] as? Bool
            let required = optionDict["Required"] as? Bool
            let emptyReplacement = optionDict["EmptyReplacement"] as? String
            let sortOrder = optionDict["SortOrder"] as? Int
            let values = optionDict["Values"] as? [String]
            let valueTitles = optionDict["ValueTitles"] as? [String]

            // TODO: Parse RequiredOptionsForValues and Units properly

            options.append(TemplateOptionJSON(
                identifier: identifier,
                name: name,
                type: type ?? "text",
                defaultValue: defaultValue ?? "",
                description: description,
                override: override,
                notPersisted: notPersisted,
                required: required,
                emptyReplacement: emptyReplacement,
                sortOrder: sortOrder,
                values: values,
                valueTitles: valueTitles
            ))
        }

        return options
    }

    private func calculateCombinations(for options: [TemplateOptionJSON]) -> Int {
        guard !options.isEmpty else { return 1 }

        return options.reduce(1) { total, option in
            if let choices = option.choices {
                return total * max(choices.count, 1)
            } else if option.type == "checkbox" {
                return total * 2
            } else {
                return total
            }
        }
    }

    private func buildFileStructure(at path: String, relativeTo basePath: String) -> [FileNode] {
        var nodes: [FileNode] = []

        guard let contents = try? fileManager.contentsOfDirectory(atPath: path) else {
            return nodes
        }

        for item in contents.sorted() {
            // Skip hidden files and TemplateInfo.plist
            if item.hasPrefix(".") || item == "TemplateInfo.plist" {
                continue
            }

            let fullPath = "\(path)/\(item)"
            let relativePath = fullPath.replacingOccurrences(of: "\(basePath)/", with: "")

            var isDir: ObjCBool = false
            fileManager.fileExists(atPath: fullPath, isDirectory: &isDir)

            let children: [FileNode]?
            if isDir.boolValue {
                children = buildFileStructure(at: fullPath, relativeTo: basePath)
            } else {
                children = nil
            }

            nodes.append(FileNode(
                name: item,
                path: relativePath,
                absolutePath: fullPath,
                isDirectory: isDir.boolValue,
                children: children
            ))
        }

        return nodes
    }
}
