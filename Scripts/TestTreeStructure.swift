#!/usr/bin/env swift

import Foundation

// This script tests the tree structure by loading real template data
// and demonstrating how to traverse it for NSOutlineView

// Note: In actual implementation, this would import XcodeTemplateKit
// For now, we'll just demonstrate the concept

print("🌳 Template Tree Structure Test")
print("================================")
print("")

// Load the JSON
let jsonPath = "/tmp/all-templates.json"
guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
    print("Error: Could not load template data from \(jsonPath)")
    print("")
    print("Run this first:")
    print("  swift Scripts/TemplateOptionsExtractor.swift /tmp/all-templates.json")
    exit(1)
}

print("✓ Loaded template data from \(jsonPath)")
print("")

// Parse JSON
struct TemplateInventory: Codable {
    let generatedAt: String
    let templates: [TemplateMetadata]
    let totalTemplates: Int
    let totalCombinations: Int
}

struct TemplateMetadata: Codable {
    let name: String
    let path: String
    let kind: String
    let identifier: String?
    let ancestors: [String]?
    let options: [TemplateOption]
    let totalCombinations: Int
}

struct TemplateOption: Codable {
    let name: String
    let type: String
    let identifier: String
    let defaultValue: String
    let choices: [String]?
}

let decoder = JSONDecoder()
guard let inventory = try? decoder.decode(TemplateInventory.self, from: jsonData) else {
    print("Error: Could not decode JSON")
    exit(1)
}

print("📊 Template Statistics:")
print("  Total templates: \(inventory.totalTemplates)")
print("  Total combinations: \(inventory.totalCombinations)")
print("")

// Group by kind
var kindCounts: [String: Int] = [:]
var templatesByKind: [String: [TemplateMetadata]] = [:]

for template in inventory.templates {
    let kind = template.kind
    kindCounts[kind, default: 0] += 1
    templatesByKind[kind, default: []].append(template)
}

print("📋 Template Kinds Found:")
for (kind, count) in kindCounts.sorted(by: { $0.key < $1.key }) {
    print("  \(kind): \(count)")
}
print("")

// Show tree structure for first few templates
print("🌲 Sample Tree Structure (first 3 kinds):")
print("")

let sortedKinds = Array(templatesByKind.keys.sorted().prefix(3))

for kind in sortedKinds {
    print("├─ Kind: \(kind)")

    let templates = templatesByKind[kind] ?? []
    for (templateIndex, template) in templates.enumerated() {
        let isLastTemplate = templateIndex == templates.count - 1
        let templateConnector = isLastTemplate ? "└─" : "├─"

        print("│  \(templateConnector) Template: \(template.name)")

        // Properties
        print("│  │  ├─ Section: Properties")
        print("│  │  │  ├─ Name: \(template.name)")
        print("│  │  │  ├─ Kind: \(template.kind)")
        if let identifier = template.identifier {
            print("│  │  │  ├─ Identifier: \(identifier)")
        }
        if let ancestors = template.ancestors, !ancestors.isEmpty {
            print("│  │  │  └─ Ancestors:")
            for (ancestorIndex, ancestor) in ancestors.enumerated() {
                let isLast = ancestorIndex == ancestors.count - 1
                let ancestorConnector = isLast ? "└─" : "├─"
                print("│  │  │     \(ancestorConnector) \(ancestor)")
            }
        }

        // Options
        if !template.options.isEmpty {
            print("│  │  ├─ Section: Options (\(template.options.count))")
            for (optionIndex, option) in template.options.enumerated() {
                let isLastOption = optionIndex == template.options.count - 1
                let optionConnector = isLastOption ? "└─" : "├─"

                print("│  │  │  \(optionConnector) Option: \(option.name)")
                print("│  │  │     ├─ Type: \(option.type)")
                print("│  │  │     ├─ Identifier: \(option.identifier)")
                print("│  │  │     ├─ Default: \(option.defaultValue)")

                if let choices = option.choices, !choices.isEmpty {
                    print("│  │  │     └─ Choices:")
                    for (choiceIndex, choice) in choices.enumerated() {
                        let isLastChoice = choiceIndex == choices.count - 1
                        let choiceConnector = isLastChoice ? "└─" : "├─"
                        print("│  │  │        \(choiceConnector) \(choice)")
                    }
                }
            }
        } else {
            print("│  │  ├─ Section: Options (none)")
        }

        // Variables
        print("│  │  └─ Section: Variables")
        print("│  │     └─ (To be populated from template parsing)")

        if !isLastTemplate {
            print("│  │")
        }
    }
    print("")
}

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("")
print("💡 This tree structure can be directly bound to NSOutlineView")
print("")
print("Next steps:")
print("1. Build XcodeTemplateKit with the new tree types")
print("2. Create AppKit app with NSOutlineView")
print("3. Implement NSOutlineViewDataSource using the tree nodes")
print("4. Add variable extraction from actual template files")
print("")
