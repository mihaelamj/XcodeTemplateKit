#!/usr/bin/env swift

import Foundation

/*
Template Decision Tree Visualizer

PURPOSE:
Create visual tree diagrams showing:
1. Template selection
2. Options at each step (with dependencies)
3. Variables that get filled
4. Final output

EXAMPLE OUTPUT:
```
Multiplatform App Template
│
├─ Option 1: Interface
│  ├─ SwiftUI
│  │  ├─ Option 2: Storage
│  │  │  ├─ None
│  │  │  │  ├─ Option 3: Include Tests
│  │  │  │  │  ├─ Yes
│  │  │  │  │  │  └─ Variables:
│  │  │  │  │  │     ├─ Project Name
│  │  │  │  │  │     ├─ Organization
│  │  │  │  │  │     └─ Bundle ID
│  │  │  │  │  │     → OUTPUT: MyApp.xcodeproj + Tests
│  │  │  │  │  └─ No
│  │  │  │  │     └─ Variables:
│  │  │  │  │        └─ ...
│  │  │  │  │        → OUTPUT: MyApp.xcodeproj (no tests)
│  │  │  ├─ Core Data
│  │  │  │  └─ (same options tree...)
│  │  │  └─ SwiftData
│  │  │     └─ (same options tree...)
│  └─ UIKit
│     └─ (similar tree with UIKit-specific options...)
│
└─ Total Combinations: 12
```

USAGE:
    swift TemplateTreeVisualizer.swift [template-name] [output-file]
*/

struct OptionNode {
    let name: String
    let identifier: String
    let type: String
    let choices: [String]
    var dependencies: [String] = []  // Shows up only if these conditions met
}

struct VariableNode {
    let name: String
    let placeholder: String
    let required: Bool
}

struct TemplateTree {
    let templateName: String
    let templateKind: String
    let options: [OptionNode]
    let variables: [VariableNode]

    func visualize() -> String {
        var output = ""

        output += "╔═══════════════════════════════════════════════════════\n"
        output += "║ \(templateName)\n"
        output += "║ Kind: \(templateKind)\n"
        output += "╚═══════════════════════════════════════════════════════\n"
        output += "\n"

        if !options.isEmpty {
            output += "📋 DECISION TREE:\n"
            output += visualizeOptions(indent: 0)
            output += "\n"
        }

        output += "📝 VARIABLES (always required):\n"
        for variable in variables {
            let req = variable.required ? "✓" : "optional"
            output += "  • \(variable.name) [\(variable.placeholder)] (\(req))\n"
        }

        output += "\n"
        output += "📊 TOTAL COMBINATIONS: \(calculateCombinations())\n"

        return output
    }

    func visualizeOptions(indent: Int) -> String {
        guard !options.isEmpty else {
            return ""
        }

        var output = ""
        let indentStr = String(repeating: "  ", count: indent)

        for (index, option) in options.enumerated() {
            let isLast = index == options.count - 1
            let connector = isLast ? "└─" : "├─"

            output += "\(indentStr)\(connector) Option \(index + 1): \(option.name) (\(option.type))\n"

            // Show choices
            for (choiceIndex, choice) in option.choices.enumerated() {
                let choiceLast = choiceIndex == option.choices.count - 1
                let choiceConnector = choiceLast ? "└─" : "├─"
                let nextIndent = indent + (isLast ? 1 : 2)

                output += "\(indentStr)  \(choiceConnector) \(choice)\n"

                // If last choice, show what happens next
                if choiceIndex == option.choices.count - 1 {
                    if index < options.count - 1 {
                        // More options follow
                        output += visualizeNextOptions(from: index + 1, indent: nextIndent + 1)
                    } else {
                        // End of options, show output
                        output += "\(String(repeating: "  ", count: nextIndent + 1))→ Fill variables → Generate project\n"
                    }
                }
            }
        }

        return output
    }

    func visualizeNextOptions(from: Int, indent: Int) -> String {
        // Recursively show remaining options
        guard from < options.count else {
            return ""
        }

        var output = ""
        let indentStr = String(repeating: "  ", count: indent)
        let option = options[from]

        output += "\(indentStr)├─ Then: \(option.name)\n"

        for choice in option.choices {
            output += "\(indentStr)│  • \(choice)\n"
        }

        return output
    }

    func calculateCombinations() -> Int {
        guard !options.isEmpty else { return 1 }

        return options.reduce(1) { total, option in
            total * option.choices.count
        }
    }
}

// MARK: - Example Templates

func exampleMultiplatformApp() -> TemplateTree {
    let options = [
        OptionNode(
            name: "Interface",
            identifier: "interface",
            type: "popup",
            choices: ["SwiftUI", "UIKit"]
        ),
        OptionNode(
            name: "Storage",
            identifier: "storage",
            type: "popup",
            choices: ["None", "Core Data", "SwiftData"]
        ),
        OptionNode(
            name: "Include Tests",
            identifier: "includeTests",
            type: "checkbox",
            choices: ["Yes", "No"]
        ),
        OptionNode(
            name: "Include UI Tests",
            identifier: "includeUITests",
            type: "checkbox",
            choices: ["Yes", "No"]
        ),
    ]

    let variables = [
        VariableNode(name: "Product Name", placeholder: "___PROJECTNAME___", required: true),
        VariableNode(name: "Organization Name", placeholder: "___ORGANIZATIONNAME___", required: true),
        VariableNode(name: "Organization Identifier", placeholder: "___ORGANIZATIONIDENTIFIER___", required: true),
    ]

    return TemplateTree(
        templateName: "Multiplatform App",
        templateKind: "com.apple.dt.unit.multiPlatform.app",
        options: options,
        variables: variables
    )
}

func exampleSwiftUIView() -> TemplateTree {
    let options = [
        OptionNode(
            name: "Include Preview",
            identifier: "includePreview",
            type: "checkbox",
            choices: ["Yes", "No"]
        ),
    ]

    let variables = [
        VariableNode(name: "File Name", placeholder: "___FILEBASENAME___", required: true),
    ]

    return TemplateTree(
        templateName: "SwiftUI View",
        templateKind: "com.apple.dt.unit.swiftUIView",
        options: options,
        variables: variables
    )
}

func exampleSwiftFile() -> TemplateTree {
    let options: [OptionNode] = []  // No options, just create file

    let variables = [
        VariableNode(name: "File Name", placeholder: "___FILEBASENAME___", required: true),
    ]

    return TemplateTree(
        templateName: "Swift File",
        templateKind: "com.apple.dt.unit.swiftSource",
        options: options,
        variables: variables
    )
}

// MARK: - Main

func main() {
    print("🌳 Xcode Template Decision Trees")
    print("=================================")
    print("")

    let templates = [
        exampleMultiplatformApp(),
        exampleSwiftUIView(),
        exampleSwiftFile(),
    ]

    for template in templates {
        print(template.visualize())
        print("")
        print(String(repeating: "─", count: 60))
        print("")
    }

    print("💡 This shows the decision flow for each template")
    print("")
    print("Next steps:")
    print("1. Extract REAL option data from actual TemplateInfo.plist files")
    print("2. Generate trees for ALL 146 templates")
    print("3. Use trees to drive automated generation")
}

main()
