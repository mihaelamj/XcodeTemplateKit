#!/usr/bin/env swift

import Foundation

/*
Template Options Extractor

PURPOSE:
Parse ALL TemplateInfo.plist files to extract what options each template has.
This tells us what we need to automate in the UI.

OUTPUT:
JSON file with all templates and their options:
{
  "templates": [
    {
      "name": "Multiplatform App",
      "path": "/Applications/Xcode.app/.../App.xctemplate",
      "kind": "com.apple.dt.unit.multiPlatform.app",
      "options": [
        {
          "name": "interface",
          "type": "popup",
          "identifier": "interfaceChoice",
          "default": "SwiftUI",
          "choices": ["SwiftUI", "UIKit"]
        },
        {
          "name": "storage",
          "type": "popup",
          "identifier": "storageChoice",
          "default": "None",
          "choices": ["None", "Core Data", "SwiftData"]
        },
        {
          "name": "includeTests",
          "type": "checkbox",
          "identifier": "includeTests",
          "default": true
        }
      ],
      "totalCombinations": 12  // 2 × 3 × 2
    }
  ]
}

USAGE:
    swift TemplateOptionsExtractor.swift [output-file]

EXAMPLE:
    swift TemplateOptionsExtractor.swift template-options.json
*/

struct TemplateOption: Codable {
    let name: String
    let type: String  // "popup", "checkbox", "radio", "text"
    let identifier: String
    let defaultValue: String
    let choices: [String]?  // For popup/radio
}

struct TemplateMetadata: Codable {
    let name: String
    let path: String
    let kind: String
    let identifier: String?
    let options: [TemplateOption]
    let totalCombinations: Int
}

struct TemplateInventory: Codable {
    let generatedAt: String
    let templates: [TemplateMetadata]
    let totalTemplates: Int
    let totalCombinations: Int
}

class TemplateOptionsScanner {
    let xcodeTemplatesPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates"
    let fileManager = FileManager.default

    func scanAllTemplates() -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        let fileTemplatesPath = "\(xcodeTemplatesPath)/File Templates"
        let projectTemplatesPath = "\(xcodeTemplatesPath)/Project Templates"

        templates.append(contentsOf: scanDirectory(projectTemplatesPath))  // Focus on projects first

        return templates
    }

    func scanDirectory(_ path: String) -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        guard let enumerator = fileManager.enumerator(atPath: path) else {
            return templates
        }

        for case let file as String in enumerator {
            if file.hasSuffix(".xctemplate"), !file.contains("Base.xctemplate") {
                let fullPath = "\(path)/\(file)"
                if let metadata = parseTemplate(at: fullPath) {
                    templates.append(metadata)
                }
            }
        }

        return templates
    }

    func parseTemplate(at path: String) -> TemplateMetadata? {
        let plistPath = "\(path)/TemplateInfo.plist"

        guard fileManager.fileExists(atPath: plistPath) else {
            return nil
        }

        let name = URL(fileURLWithPath: path).deletingPathExtension().lastPathComponent

        guard let plistData = try? Data(contentsOf: URL(fileURLWithPath: plistPath)),
              let plist = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: Any] else {
            return nil
        }

        let kind = plist["Kind"] as? String ?? "unknown"
        let identifier = plist["Identifier"] as? String

        // Extract options from plist
        let options = extractOptions(from: plist)

        // Calculate total combinations
        let combinations = calculateCombinations(for: options)

        return TemplateMetadata(
            name: name,
            path: path,
            kind: kind,
            identifier: identifier,
            options: options,
            totalCombinations: combinations
        )
    }

    func extractOptions(from plist: [String: Any]) -> [TemplateOption] {
        var options: [TemplateOption] = []

        // Check for Options array
        if let optionsArray = plist["Options"] as? [[String: Any]] {
            for optionDict in optionsArray {
                if let option = parseOption(from: optionDict) {
                    options.append(option)
                }
            }
        }

        return options
    }

    func parseOption(from dict: [String: Any]) -> TemplateOption? {
        guard let identifier = dict["Identifier"] as? String,
              let name = dict["Name"] as? String else {
            return nil
        }

        let type = dict["Type"] as? String ?? "text"
        let defaultValue = dict["Default"] as? String ?? ""

        // For popup menus
        var choices: [String]? = nil
        if let units = dict["Units"] as? [[String: Any]] {
            choices = units.compactMap { $0["Name"] as? String }
        }

        return TemplateOption(
            name: name,
            type: type,
            identifier: identifier,
            defaultValue: defaultValue,
            choices: choices
        )
    }

    func calculateCombinations(for options: [TemplateOption]) -> Int {
        guard !options.isEmpty else { return 1 }

        return options.reduce(1) { total, option in
            let optionCount: Int
            switch option.type {
            case "popup":
                optionCount = option.choices?.count ?? 2
            case "checkbox":
                optionCount = 2  // true/false
            default:
                optionCount = 1
            }
            return total * optionCount
        }
    }
}

// MARK: - Main

func main() {
    print("🔍 Scanning Xcode Templates for Options")
    print("========================================")
    print("")

    let scanner = TemplateOptionsScanner()
    let templates = scanner.scanAllTemplates()

    print("✓ Found \(templates.count) templates")

    let totalCombinations = templates.reduce(0) { $0 + $1.totalCombinations }
    print("✓ Total option combinations: \(totalCombinations)")
    print("")

    // Show summary
    print("Templates with options:")
    for template in templates where !template.options.isEmpty {
        print("  • \(template.name)")
        print("    Options: \(template.options.count)")
        print("    Combinations: \(template.totalCombinations)")
        for option in template.options {
            let choicesDesc = option.choices?.joined(separator: ", ") ?? "N/A"
            print("      - \(option.name) (\(option.type)): \(choicesDesc)")
        }
        print("")
    }

    // Create inventory
    let inventory = TemplateInventory(
        generatedAt: ISO8601DateFormatter().string(from: Date()),
        templates: templates,
        totalTemplates: templates.count,
        totalCombinations: totalCombinations
    )

    // Write to JSON
    let outputPath = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "template-options.json"

    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let jsonData = try encoder.encode(inventory)

        try jsonData.write(to: URL(fileURLWithPath: outputPath))

        print("✓ Saved to: \(outputPath)")
        print("")
        print("Next step: Use this JSON to drive automated generation!")

    } catch {
        print("❌ Error writing JSON: \(error)")
        exit(1)
    }
}

main()
