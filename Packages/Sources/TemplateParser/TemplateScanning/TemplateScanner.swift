import Foundation

/// Scans Xcode templates and captures complete plist data
public class TemplateScanner {
    private let xcodeTemplatesPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates"
    private let fileManager = FileManager.default

    public init() {}

    /// Scan all Xcode templates and return complete inventory
    public func scanAllTemplates() -> TemplateInventory {
        var templates: [TemplateMetadata] = []

        let fileTemplatesPath = "\(xcodeTemplatesPath)/File Templates"
        let projectTemplatesPath = "\(xcodeTemplatesPath)/Project Templates"

        templates.append(contentsOf: scanDirectory(projectTemplatesPath, type: "Project"))
        templates.append(contentsOf: scanDirectory(fileTemplatesPath, type: "File"))

        // Check for package templates
        if let packagePath = findPackageTemplatesPath() {
            templates.append(contentsOf: scanDirectory(packagePath, type: "Package"))
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

    private func findPackageTemplatesPath() -> String? {
        let possiblePaths = [
            "\(xcodeTemplatesPath)/Package Templates",
            "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Package Templates",
        ]

        for path in possiblePaths where fileManager.fileExists(atPath: path) {
            return path
        }

        return nil
    }

    private func scanDirectory(_ path: String, type: String) -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        guard let enumerator = fileManager.enumerator(atPath: path) else {
            return templates
        }

        for case let file as String in enumerator where file.hasSuffix(".xctemplate") {
            let fullPath = "\(path)/\(file)"
            if let metadata = parseTemplate(at: fullPath, type: type) {
                templates.append(metadata)
            }
        }

        return templates
    }

    private func parseTemplate(at path: String, type: String) -> TemplateMetadata? {
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

        // Extract standard fields
        // Note: "Identifier" contains the unique template kind (e.g., "com.apple.dt.unit.app")
        // "Kind" is just the template type category (e.g., "Xcode.Xcode3.ProjectTemplateUnitKind")
        guard let kindString = plist["Identifier"] as? String else {
            return nil // Skip templates without Identifier field
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

        return TemplateMetadata(
            name: name,
            path: path,
            kind: kind,
            ancestors: ancestors?.compactMap { TemplateKind(rawValue: $0) },
            options: options,
            totalCombinations: combinations,
            fileStructure: fileStructure.isEmpty ? nil : fileStructure,
            rawContent: rawContent,
            rawContentType: contentType
        )
    }

    private func extractCategory(from path: String) -> String {
        let components = path.components(separatedBy: "/")
        if let templatesIndex = components.lastIndex(where: { $0.contains("Templates") }) {
            let categoryComponents = components[(templatesIndex + 1)...]
                .filter { !$0.hasSuffix(".xctemplate") }
            return categoryComponents.joined(separator: " > ")
        }
        return "Unknown"
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

            let type = optionDict["Type"] as? String ?? "text"
            let defaultValue = optionDict["Default"] as? String ?? ""

            var choices: [String]?
            if let units = optionDict["Units"] as? [[String: Any]] {
                choices = units.compactMap { $0["Identifier"] as? String }
            }

            options.append(TemplateOptionJSON(
                name: name,
                type: type,
                identifier: identifier,
                defaultValue: defaultValue,
                choices: choices
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
                isDirectory: isDir.boolValue,
                children: children
            ))
        }

        return nodes
    }
}
