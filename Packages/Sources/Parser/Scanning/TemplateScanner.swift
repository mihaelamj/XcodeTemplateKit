import Foundation
import TemplateModels

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
    public func scanAllTemplates() -> Inventory {
        var templates: [Metadata] = []
        var seenPaths = Set<String>()

        for root in templateRoots where fileManager.fileExists(atPath: root) {
            templates.append(contentsOf: scanTemplates(atRoot: root, seenPaths: &seenPaths))
        }

        // Calculate total combinations
        let totalCombinations = templates.reduce(0) { $0 + $1.totalCombinations }

        return Inventory(
            generatedAt: ISO8601DateFormatter().string(from: Date()),
            templates: templates,
            totalTemplates: templates.count,
            totalCombinations: totalCombinations
        )
    }

    private func scanTemplates(atRoot root: String, seenPaths: inout Set<String>) -> [Metadata] {
        var templates: [Metadata] = []

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

    // swiftlint:disable:next function_body_length
    private func parseTemplate(at path: String, templateType: String) -> Metadata? {
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
        let kind = Kind(rawValue: kindString)

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
        let defaultCompletionName = plist["DefaultCompletionName"] as? String
        let icon = plist["Icon"] as? String
        let mainTemplateFile = plist["MainTemplateFile"] as? String
        let templateName = plist["Name"] as? String
        let nameOfInitialFileForEditor = plist["NameOfInitialFileForEditor"] as? String
        let summary = plist["Summary"] as? String

        // Extract enum fields
        let buildableType = (plist["BuildableType"] as? String).flatMap { BuildableType(rawValue: $0) }
        let hiddenFromChooser = plist["HiddenFromChooser"] as? Bool
        let hiddenFromLibrary = plist["HiddenFromLibrary"] as? Bool
        let image = (plist["Image"] as? String).flatMap { ImageSourceType(rawValue: $0) }
        let packageType = (plist["PackageType"] as? String).flatMap { PackageType(rawValue: $0) }
        let project = (plist["Project"] as? String).flatMap { ProjectConfiguration(rawValue: $0) }

        // Extract boolean fields
        let concrete = plist["Concrete"] as? Bool
        let localizedByDefault = plist["LocalizedByDefault"] as? Bool
        let projectOnly = plist["ProjectOnly"] as? Bool
        let supportsSwiftPackage = plist["SupportsSwiftPackage"] as? Bool
        let suppressTopLevelGroup = plist["SuppressTopLevelGroup"] as? Bool
        let targetOnly = plist["TargetOnly"] as? Bool

        // Extract integer fields
        let sortOrder = plist["SortOrder"] as? Int

        // Extract array fields
        let allowedTypesStrings = plist["AllowedTypes"] as? [String]
        let allowedTypes = allowedTypesStrings?.map { UniformTypeIdentifier(rawValue: $0) }
        let nodes = plist["Nodes"] as? [String]
        let platformsStrings = plist["Platforms"] as? [String]
        let platforms = platformsStrings?.map { Platform(rawValue: $0) }
        let title = plist["Title"] as? String

        // Extract complex dictionary fields
        let components = parseComponents(plist["Components"])
        let targets = parseTargets(plist["Targets"])
        let definitions = parseDefinitions(plist["Definitions"])
        let optionConstraints = parseOptionConstraints(plist["OptionConstraints"])

        return Metadata(
            name: name,
            path: path,
            kind: kind,
            ancestors: ancestors?.compactMap { Kind(rawValue: $0) },
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
            allowedTypes: allowedTypes,
            nodes: nodes,
            platforms: platforms,
            title: title,
            components: components,
            targets: targets,
            definitions: definitions,
            optionConstraints: optionConstraints,
            rawContent: rawContent,
            rawContentType: contentType
        )
    }

    /// Serialize a plist value to Data for storage.
    private func serializeToData(_ value: Any?) -> Data? {
        guard let value else { return nil }
        return try? PropertyListSerialization.data(fromPropertyList: value, format: .binary, options: 0)
    }

    /// Parse Components field from plist array.
    private func parseComponents(_ value: Any?) -> Components? {
        guard let componentsArray = value as? [[String: Any]], !componentsArray.isEmpty else {
            return nil
        }

        // Convert to proper format for Components decoding
        guard let data = try? PropertyListSerialization.data(fromPropertyList: componentsArray, format: .binary, options: 0),
              let components = try? PropertyListDecoder().decode(Components.self, from: data) else {
            return nil
        }

        return components
    }

    /// Parse Targets field from plist array.
    private func parseTargets(_ value: Any?) -> Targets? {
        guard let targetsArray = value as? [[String: Any]], !targetsArray.isEmpty else {
            return nil
        }

        // Convert to proper format for Targets decoding
        guard let data = try? PropertyListSerialization.data(fromPropertyList: targetsArray, format: .binary, options: 0),
              let targets = try? PropertyListDecoder().decode(Targets.self, from: data) else {
            return nil
        }

        return targets
    }

    /// Parse OptionConstraints field from plist array.
    private func parseOptionConstraints(_ value: Any?) -> OptionConstraints? {
        guard let constraintsArray = value as? [[String: Any]], !constraintsArray.isEmpty else {
            return nil
        }

        // Convert to proper format for OptionConstraints decoding
        guard let data = try? PropertyListSerialization.data(fromPropertyList: constraintsArray, format: .binary, options: 0),
              let constraints = try? PropertyListDecoder().decode(OptionConstraints.self, from: data) else {
            return nil
        }

        return constraints
    }

    /// Parse Definitions field from plist dictionary.
    private func parseDefinitions(_ value: Any?) -> Definitions? {
        guard let definitionsDict = value as? [String: Any], !definitionsDict.isEmpty else {
            return nil
        }

        var definitions: [String: DefinitionValue] = [:]

        for (key, value) in definitionsDict {
            // Check if it's a string (code snippet) or dictionary (file definition)
            if let stringValue = value as? String {
                definitions[key] = .string(stringValue)
            } else if let dictValue = value as? [String: Any] {
                // Convert to proper format for FileDefinition decoding
                if let data = try? PropertyListSerialization.data(fromPropertyList: dictValue, format: .binary, options: 0),
                   let fileDefinition = try? PropertyListDecoder().decode(FileDefinition.self, from: data) {
                    definitions[key] = .file(fileDefinition)
                }
            }
        }

        return definitions.isEmpty ? nil : Definitions(definitions: definitions)
    }

    private func extractOptions(from plist: [String: Any]) -> [Option] {
        var options: [Option] = []

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

            // Parse RequiredOptionsForValues
            let requiredOptionsForValues = optionDict["RequiredOptionsForValues"] as? [String: [String: String]]

            // Parse Units
            var units: [String: OptionUnit]?
            if let unitsDict = optionDict["Units"] as? [String: Any] {
                var parsedUnits: [String: OptionUnit] = [:]
                for (key, value) in unitsDict {
                    if let unitDict = value as? [String: Any] {
                        // Convert to data and decode using PropertyListDecoder
                        if let data = try? PropertyListSerialization.data(fromPropertyList: unitDict, format: .binary, options: 0),
                           let unit = try? PropertyListDecoder().decode(OptionUnit.self, from: data) {
                            parsedUnits[key] = unit
                        }
                    }
                }
                units = parsedUnits.isEmpty ? nil : parsedUnits
            }

            options.append(Option(
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
                valueTitles: valueTitles,
                requiredOptionsForValues: requiredOptionsForValues,
                units: units
            ))
        }

        return options
    }

    private func calculateCombinations(for options: [Option]) -> Int {
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
