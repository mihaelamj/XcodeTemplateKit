//
//  Node.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree {
    /// Hierarchical data structure for displaying Xcode templates in an NSOutlineView.
    ///
    /// The tree structure is:
    /// ```
    /// Root: All Templates
    /// ├─ Template Category: Project Templates
    /// │  ├─ Template Kind: App (com.apple.dt.unit.multiPlatform.app)
    /// │  │  ├─ Template: Multiplatform App
    /// │  │  │  ├─ Section: Properties
    /// │  │  │  │  ├─ Property: Name = "Multiplatform App"
    /// │  │  │  │  ├─ Property: Kind = "com.apple.dt.unit.multiPlatform.app"
    /// │  │  │  │  └─ Property: Combinations = 12
    /// │  │  │  ├─ Section: Options
    /// │  │  │  │  ├─ Option: Interface
    /// │  │  │  │  │  ├─ Detail: Type = popup
    /// │  │  │  │  │  ├─ Detail: Default = SwiftUI
    /// │  │  │  │  │  └─ Choices
    /// │  │  │  │  │     ├─ Choice: SwiftUI
    /// │  │  │  │  │     └─ Choice: UIKit
    /// │  │  │  │  └─ Option: Storage
    /// │  │  │  │     └─ ...
    /// │  │  │  └─ Section: Variables
    /// │  │  │     ├─ Variable: Product Name
    /// │  │  │     │  ├─ Detail: Placeholder = ___PROJECTNAME___
    /// │  │  │     │  └─ Detail: Required = true
    /// │  │  │     └─ Variable: Organization
    /// │  │  │        └─ ...
    /// ```

    public enum Node: Hashable, Identifiable {
        case root(Root)
        case category(Category)
        case kind(TemplateKind)
        case template(Template)
        case section(Section)
        case property(Property)
        case option(Option)
        case optionDetail(Detail)
        case choices(Choices)
        case choice(Choice)
        case variable(Variable)
        case variableDetail(Detail)

        public var id: String {
            switch self {
            case .root(let node): return node.id
            case .category(let node): return node.id
            case .kind(let node): return node.id
            case .template(let node): return node.id
            case .section(let node): return node.id
            case .property(let node): return node.id
            case .option(let node): return node.id
            case .optionDetail(let node): return node.id
            case .choices(let node): return node.id
            case .choice(let node): return node.id
            case .variable(let node): return node.id
            case .variableDetail(let node): return node.id
            }
        }

        public var displayName: String {
            switch self {
            case .root(let node): return node.title
            case .category(let node): return node.displayName
            case .kind(let node): return node.displayName
            case .template(let node): return node.name
            case .section(let node): return node.displayName
            case .property(let node): return "\(node.key): \(node.value)"
            case .option(let node): return node.name
            case .optionDetail(let node): return "\(node.key): \(node.value)"
            case .choices: return "Choices"
            case .choice(let node): return node.name
            case .variable(let node): return node.name
            case .variableDetail(let node): return "\(node.key): \(node.value)"
            }
        }

        public var children: [Node] {
            switch self {
            case .root(let node): return node.categories.map { .category($0) }
            case .category(let node): return node.kinds.map { .kind($0) }
            case .kind(let node): return node.templates.map { .template($0) }
            case .template(let node): return node.sections.map { .section($0) }
            case .section(let node): return node.items
            case .property: return []
            case .option(let node):
                var items: [Node] = node.details.map { .optionDetail($0) }
                if let choicesNode = node.choices {
                    items.append(.choices(choicesNode))
                }
                return items
            case .optionDetail: return []
            case .choices(let node): return node.choices.map { .choice($0) }
            case .choice: return []
            case .variable(let node): return node.details.map { .variableDetail($0) }
            case .variableDetail: return []
            }
        }

        public var isLeaf: Bool {
            children.isEmpty
        }
    }
}
