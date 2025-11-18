#!/usr/bin/env swift

import Foundation

/*
Complete Template Plist Scanner

PURPOSE:
Scan ALL Xcode templates and capture COMPLETE TemplateInfo.plist data.
This includes all standard fields AND any custom fields.

OUTPUT:
JSON file with complete template data including raw plist values.

USAGE:
    swift CompletePlistScanner.swift [output-file]

EXAMPLE:
    swift CompletePlistScanner.swift /tmp/all-templates.json
*/

// MARK: - Models

struct TemplateOption: Codable {
    let name: String
    let type: String
    let identifier: String
    let defaultValue: String
    let choices: [String]?
}

struct FileNode: Codable {
    let name: String
    let path: String
    let isDirectory: Bool
    let children: [FileNode]?
}

struct TemplateMetadata: Codable {
    let name: String
    let path: String
    let identifier: String  // Using Kind as identifier
    let type: String  // "File", "Project", or "Package"
    let category: String
    let description: String?
    let summary: String?
    let ancestors: [String]?
    let options: [TemplateOption]
    let totalCombinations: Int
    let fileStructure: [FileNode]?

    // Complete plist data
    let rawPlistData: [String: AnyCodable]

    enum CodingKeys: String, CodingKey {
        case name, path, identifier, type, category
        case description, summary, ancestors, options
        case totalCombinations
        case fileStructure = "file_structure"
        case rawPlistData = "raw_plist"
    }
}

struct TemplateInventory: Codable {
    let generatedAt: String
    let templates: [TemplateMetadata]
    let totalTemplates: Int
    let totalCombinations: Int
}

// MARK: - AnyCodable for dynamic plist data

struct AnyCodable: Codable {
    let value: Any

    init(_ value: Any) {
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let bool = try? container.decode(Bool.self) {
            value = bool
        } else if let int = try? container.decode(Int.self) {
            value = int
        } else if let double = try? container.decode(Double.self) {
            value = double
        } else if let string = try? container.decode(String.self) {
            value = string
        } else if let array = try? container.decode([AnyCodable].self) {
            value = array.map { $0.value }
        } else if let dict = try? container.decode([String: AnyCodable].self) {
            value = dict.mapValues { $0.value }
        } else {
            value = NSNull()
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch value {
        case let bool as Bool:
            try container.encode(bool)
        case let int as Int:
            try container.encode(int)
        case let double as Double:
            try container.encode(double)
        case let string as String:
            try container.encode(string)
        case let array as [Any]:
            try container.encode(array.map { AnyCodable($0) })
        case let dict as [String: Any]:
            try container.encode(dict.mapValues { AnyCodable($0) })
        case is NSNull:
            try container.encodeNil()
        default:
            try container.encode(String(describing: value))
        }
    }
}

// MARK: - Scanner

class CompletePlistScanner {
    let xcodeTemplatesPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates"
    let fileManager = FileManager.default

    func scanAllTemplates() -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        print("🔍 Scanning Xcode templates...")

        let fileTemplatesPath = "\(xcodeTemplatesPath)/File Templates"
        let projectTemplatesPath = "\(xcodeTemplatesPath)/Project Templates"

        templates.append(contentsOf: scanDirectory(projectTemplatesPath, type: "Project"))
        templates.append(contentsOf: scanDirectory(fileTemplatesPath, type: "File"))

        // Check for package templates
        if let packagePath = findPackageTemplatesPath() {
            templates.append(contentsOf: scanDirectory(packagePath, type: "Package"))
        }

        return templates
    }

    private func findPackageTemplatesPath() -> String? {
        let possiblePaths = [
            "\(xcodeTemplatesPath)/Package Templates",
            "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Package Templates"
        ]

        for path in possiblePaths {
            if fileManager.fileExists(atPath: path) {
                return path
            }
        }

        return nil
    }

    private func scanDirectory(_ path: String, type: String) -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        guard let enumerator = fileManager.enumerator(atPath: path) else {
            return templates
        }

        for case let file as String in enumerator {
            if file.hasSuffix(".xctemplate") {
                let fullPath = "\(path)/\(file)"
                if let metadata = parseTemplate(at: fullPath, type: type) {
                    templates.append(metadata)
                }
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
        let category = extractCategory(from: path)

        guard let plistData = try? Data(contentsOf: URL(fileURLWithPath: plistPath)),
              let plist = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: Any] else {
            return nil
        }

        // Extract standard fields
        let kind = plist["Kind"] as? String ?? "unknown"
        let identifier = plist["Identifier"] as? String
        let description = plist["Description"] as? String
        let summary = plist["Summary"] as? String
        let ancestors = plist["Ancestors"] as? [String]

        // Extract options
        let options = extractOptions(from: plist)

        // Calculate combinations
        let combinations = calculateCombinations(for: options)

        // Build file structure
        let fileStructure = buildFileStructure(at: path, relativeTo: path)

        // Convert entire plist to AnyCodable
        let rawPlist = plist.mapValues { AnyCodable($0) }

        return TemplateMetadata(
            name: name,
            path: path,
            identifier: kind,
            type: type,
            category: category,
            description: description,
            summary: summary,
            ancestors: ancestors,
            options: options,
            totalCombinations: combinations,
            fileStructure: fileStructure.isEmpty ? nil : fileStructure,
            rawPlistData: rawPlist
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

    private func extractOptions(from plist: [String: Any]) -> [TemplateOption] {
        var options: [TemplateOption] = []

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

            options.append(TemplateOption(
                name: name,
                type: type,
                identifier: identifier,
                defaultValue: defaultValue,
                choices: choices
            ))
        }

        return options
    }

    private func calculateCombinations(for options: [TemplateOption]) -> Int {
        guard !options.isEmpty else { return 1 }

        return options.reduce(1) { total, option in
            if let choices = option.choices {
                return total * max(choices.count, 1)
            } else if option.type == "checkbox" {
                return total * 2  // true or false
            } else {
                return total  // text fields don't multiply combinations
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

// MARK: - Main

func main() {
    print("🎯 Complete Xcode Template Plist Scanner")
    print("==========================================\n")

    // Determine output path
    let outputPath: String
    if CommandLine.arguments.count > 1 {
        outputPath = CommandLine.arguments[1]
    } else {
        outputPath = "/tmp/all-templates.json"
    }

    let scanner = CompletePlistScanner()
    let templates = scanner.scanAllTemplates()

    print("✅ Found \(templates.count) templates\n")

    // Group by type
    let fileTemplates = templates.filter { $0.type == "File" }
    let projectTemplates = templates.filter { $0.type == "Project" }
    let packageTemplates = templates.filter { $0.type == "Package" }

    print("📋 Breakdown:")
    print("  📄 File Templates: \(fileTemplates.count)")
    print("  📦 Project Templates: \(projectTemplates.count)")
    print("  📦 Package Templates: \(packageTemplates.count)")

    // Calculate total combinations
    let totalCombinations = templates.reduce(0) { $0 + $1.totalCombinations }

    // Create inventory
    let inventory = TemplateInventory(
        generatedAt: ISO8601DateFormatter().string(from: Date()),
        templates: templates,
        totalTemplates: templates.count,
        totalCombinations: totalCombinations
    )

    // Write JSON
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let jsonData = try encoder.encode(inventory)

        try jsonData.write(to: URL(fileURLWithPath: outputPath))

        print("\n✨ Success!")
        print("📁 Output: \(outputPath)")
        print("📊 Total Combinations: \(totalCombinations)")
    } catch {
        print("\n❌ Error: \(error.localizedDescription)")
        exit(1)
    }
}

main()
