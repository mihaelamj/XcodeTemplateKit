//
//  TemplateTreeNode.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation
import TemplateModels

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

public enum TemplateTreeNode: Hashable, Identifiable {
    case root(RootNode)
    case category(TemplateCategoryNode)
    case kind(TemplateKindNode)
    case template(TemplateNode)
    case section(SectionNode)
    case property(PropertyNode)
    case option(OptionNode)
    case optionDetail(DetailNode)
    case choices(ChoicesNode)
    case choice(ChoiceNode)
    case variable(VariableNode)
    case variableDetail(DetailNode)

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

    public var children: [TemplateTreeNode] {
        switch self {
        case .root(let node): return node.categories.map { .category($0) }
        case .category(let node): return node.kinds.map { .kind($0) }
        case .kind(let node): return node.templates.map { .template($0) }
        case .template(let node): return node.sections.map { .section($0) }
        case .section(let node): return node.items
        case .property: return []
        case .option(let node):
            var items: [TemplateTreeNode] = node.details.map { .optionDetail($0) }
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

// MARK: - Node Types

/// Root node of the template tree.
///
/// The root contains all template categories (Project Templates, Package Templates, etc.).
///
/// ## Example
/// ```swift
/// let root = RootNode(categories: [
///     TemplateCategoryNode(
///         id: "category-Project Templates",
///         category: .projectTemplates,
///         kinds: [...]
///     )
/// ])
/// ```
public struct RootNode: Hashable, Identifiable {
    public let id: String
    public let title: String
    public let categories: [TemplateCategoryNode]

    public init(
        id: String = "root",
        title: String = "All Xcode Templates",
        categories: [TemplateCategoryNode]
    ) {
        self.id = id
        self.title = title
        self.categories = categories
    }
}

/// Template category grouping (Project Templates, Package Templates).
///
/// Groups template kinds by their high-level category.
///
/// ## Example
/// ```swift
/// let categoryNode = TemplateCategoryNode(
///     id: "category-projectTemplates",
///     category: .projectTemplates,
///     kinds: [
///         TemplateKindNode(
///             id: "kind-com.apple.dt.unit.multiPlatform.app",
///             kind: .app,
///             templates: [...]
///         )
///     ]
/// )
/// ```
public struct TemplateCategoryNode: Hashable, Identifiable {
    public let id: String
    public let category: TemplateCategory
    public let kinds: [TemplateKindNode]

    public var displayName: String {
        category.displayName
    }

    public init(
        id: String,
        category: TemplateCategory,
        kinds: [TemplateKindNode]
    ) {
        self.id = id
        self.category = category
        self.kinds = kinds
    }
}

/// Template kind node (e.g., App, Game, Framework).
///
/// Groups all templates of a specific kind. Each kind can have multiple template instances.
///
/// ## Example
/// ```swift
/// let kindNode = TemplateKindNode(
///     id: "kind-com.apple.dt.unit.multiPlatform.app",
///     kind: .app,
///     templates: [
///         TemplateNode(
///             id: "/path/to/App.xctemplate",
///             name: "App",
///             path: "/Applications/Xcode.app/.../App.xctemplate",
///             kind: .app,
///             identifier: "com.apple.dt.unit.multiPlatform.app",
///             sections: [...]
///         )
///     ]
/// )
/// ```
public struct TemplateKindNode: Hashable, Identifiable {
    public let id: String
    public let kind: TemplateKind
    public let templates: [TemplateNode]

    public var displayName: String {
        kind.displayName
    }

    public init(
        id: String,
        kind: TemplateKind,
        templates: [TemplateNode]
    ) {
        self.id = id
        self.kind = kind
        self.templates = templates
    }
}

/// Individual template instance.
///
/// Represents a single `.xctemplate` bundle with its properties, options, and variables.
/// Contains ancestor references for template inheritance.
///
/// ## Example
/// ```swift
/// let templateNode = TemplateNode(
///     id: "/path/to/App.xctemplate",
///     name: "iOS Safari Extension App",
///     path: "/Applications/Xcode.app/.../iOS Safari Extension App.xctemplate",
///     kind: .iosSafariExtensionApp,
///     identifier: "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS",
///     sections: [
///         SectionNode(
///             id: "properties",
///             type: .properties,
///             items: [
///                 .property(PropertyNode(
///                     id: "property-ancestors",
///                     key: "Ancestors",
///                     value: "com.apple.dt.unit.applicationBase, com.apple.dt.unit.iosBase"
///                 ))
///             ]
///         )
///     ]
/// )
/// ```
///
/// - Note: Ancestors are stored as comma-separated identifier strings that reference
///   other templates by their identifier. These are resolved later using
///   `ProjectTemplateParser.loadWithAncestors()`.
public struct TemplateNode: Hashable, Identifiable {
    public let id: String
    public let name: String
    public let path: String
    public let kind: TemplateKind
    public let sections: [SectionNode]

    /// Template identifier derived from the kind.
    public var identifier: String {
        kind.rawValue
    }

    public init(
        id: String,
        name: String,
        path: String,
        kind: TemplateKind,
        sections: [SectionNode]
    ) {
        self.id = id
        self.name = name
        self.path = path
        self.kind = kind
        self.sections = sections
    }
}

/// Section within a template (Properties, Options, or Variables).
///
/// Organizes template data into logical sections for display.
///
/// ## Example
/// ```swift
/// let propertiesSection = SectionNode(
///     id: "section-properties",
///     type: .properties,
///     items: [
///         .property(PropertyNode(id: "prop-name", key: "Name", value: "App")),
///         .property(PropertyNode(id: "prop-kind", key: "Kind", value: "Xcode.Xcode3.ProjectTemplateUnitKind")),
///         .property(PropertyNode(id: "prop-ancestors", key: "Ancestors", value: "com.apple.dt.unit.base"))
///     ]
/// )
///
/// let optionsSection = SectionNode(
///     id: "section-options",
///     type: .options,
///     items: [
///         .option(OptionNode(
///             id: "option-interface",
///             name: "Interface",
///             identifier: "interfaceChoice",
///             type: .popup,
///             defaultValue: "SwiftUI",
///             details: [...],
///             choices: ChoicesNode(choices: [
///                 ChoiceNode(id: "choice-swiftui", name: "SwiftUI", identifier: nil),
///                 ChoiceNode(id: "choice-uikit", name: "UIKit", identifier: nil)
///             ])
///         ))
///     ]
/// )
/// ```
public struct SectionNode: Hashable, Identifiable {
    public enum SectionType: String, Hashable {
        case properties
        case options
        case variables
    }

    public let id: String
    public let type: SectionType
    public let items: [TemplateTreeNode]

    public var displayName: String {
        switch type {
        case .properties: return "Properties"
        case .options: return "Options"
        case .variables: return "Variables"
        }
    }

    public init(
        id: String,
        type: SectionType,
        items: [TemplateTreeNode]
    ) {
        self.id = id
        self.type = type
        self.items = items
    }
}

/// Property key-value pair.
///
/// Displays metadata about a template such as name, path, kind, identifier, and ancestors.
///
/// ## Example
/// ```swift
/// let nameProperty = PropertyNode(
///     id: "property-name",
///     key: "Name",
///     value: "Multiplatform App"
/// )
///
/// let ancestorsProperty = PropertyNode(
///     id: "property-ancestors",
///     key: "Ancestors",
///     value: "com.apple.dt.unit.applicationBase, com.apple.dt.unit.iosBase, com.apple.dt.unit.languageChoice.app.iOS"
/// )
/// ```
public struct PropertyNode: Hashable, Identifiable {
    public let id: String
    public let key: String
    public let value: String

    public init(
        id: String,
        key: String,
        value: String
    ) {
        self.id = id
        self.key = key
        self.value = value
    }
}

/// Template option that user can configure.
///
/// Represents a configurable option from TemplateInfo.plist Options array.
/// Options can be popup menus, checkboxes, radio buttons, text fields, or static values.
///
/// ## Example
/// ```swift
/// let interfaceOption = OptionNode(
///     id: "option-interface",
///     name: "Interface",
///     identifier: "interfaceChoice",
///     type: .popup,
///     defaultValue: "SwiftUI",
///     details: [
///         DetailNode(id: "detail-type", key: "Type", value: "Popup"),
///         DetailNode(id: "detail-identifier", key: "Identifier", value: "interfaceChoice"),
///         DetailNode(id: "detail-default", key: "Default", value: "SwiftUI")
///     ],
///     choices: ChoicesNode(
///         id: "choices-interface",
///         choices: [
///             ChoiceNode(id: "choice-swiftui", name: "SwiftUI", identifier: nil),
///             ChoiceNode(id: "choice-uikit", name: "UIKit", identifier: nil)
///         ]
///     )
/// )
///
/// let testsOption = OptionNode(
///     id: "option-tests",
///     name: "Include Tests",
///     identifier: "includeTests",
///     type: .checkbox,
///     defaultValue: "true",
///     details: [...],
///     choices: nil  // Checkboxes don't have choices
/// )
/// ```
public struct OptionNode: Hashable, Identifiable {
    public let id: String
    public let name: String
    public let identifier: String
    public let type: OptionType
    public let defaultValue: String
    public let details: [DetailNode]
    public let choices: ChoicesNode?

    public init(
        id: String,
        name: String,
        identifier: String,
        type: OptionType,
        defaultValue: String,
        details: [DetailNode],
        choices: ChoicesNode?
    ) {
        self.id = id
        self.name = name
        self.identifier = identifier
        self.type = type
        self.defaultValue = defaultValue
        self.details = details
        self.choices = choices
    }
}

/// Detail information about an option or variable.
///
/// Displays metadata like type, identifier, default value, placeholder, etc.
///
/// ## Example
/// ```swift
/// let typeDetail = DetailNode(
///     id: "detail-type",
///     key: "Type",
///     value: "Popup"
/// )
///
/// let defaultDetail = DetailNode(
///     id: "detail-default",
///     key: "Default",
///     value: "SwiftUI"
/// )
/// ```
public struct DetailNode: Hashable, Identifiable {
    public let id: String
    public let key: String
    public let value: String

    public init(
        id: String,
        key: String,
        value: String
    ) {
        self.id = id
        self.key = key
        self.value = value
    }
}

/// Container for option choices.
///
/// Groups all possible values for a popup or radio button option.
///
/// ## Example
/// ```swift
/// let interfaceChoices = ChoicesNode(
///     id: "choices-interface",
///     choices: [
///         ChoiceNode(id: "choice-1", name: "SwiftUI", identifier: nil),
///         ChoiceNode(id: "choice-2", name: "UIKit", identifier: nil)
///     ]
/// )
///
/// let storageChoices = ChoicesNode(
///     id: "choices-storage",
///     choices: [
///         ChoiceNode(id: "choice-none", name: "None", identifier: nil),
///         ChoiceNode(id: "choice-coredata", name: "Core Data", identifier: nil),
///         ChoiceNode(id: "choice-swiftdata", name: "SwiftData", identifier: nil)
///     ]
/// )
/// ```
public struct ChoicesNode: Hashable, Identifiable {
    public let id: String
    public let choices: [ChoiceNode]

    public init(
        id: String,
        choices: [ChoiceNode]
    ) {
        self.id = id
        self.choices = choices
    }
}

/// Individual choice within an option.
///
/// Represents one selectable value for a popup or radio button.
///
/// ## Example
/// ```swift
/// let swiftUIChoice = ChoiceNode(
///     id: "choice-swiftui",
///     name: "SwiftUI",
///     identifier: nil
/// )
///
/// let coreDataChoice = ChoiceNode(
///     id: "choice-coredata",
///     name: "Core Data",
///     identifier: "coredata"
/// )
/// ```
public struct ChoiceNode: Hashable, Identifiable {
    public let id: String
    public let name: String
    public let identifier: String?

    public init(
        id: String,
        name: String,
        identifier: String?
    ) {
        self.id = id
        self.name = name
        self.identifier = identifier
    }
}

/// Template variable that gets filled in during project creation.
///
/// Variables are placeholders like `___PROJECTNAME___`, `___ORGANIZATIONNAME___`, etc.
/// that get replaced with user input when creating a project.
///
/// ## Example
/// ```swift
/// let projectNameVar = VariableNode(
///     id: "var-projectname",
///     name: "Product Name",
///     placeholder: "___PROJECTNAME___",
///     required: true,
///     details: [
///         DetailNode(id: "detail-placeholder", key: "Placeholder", value: "___PROJECTNAME___"),
///         DetailNode(id: "detail-required", key: "Required", value: "true")
///     ]
/// )
///
/// let orgNameVar = VariableNode(
///     id: "var-orgname",
///     name: "Organization Name",
///     placeholder: "___ORGANIZATIONNAME___",
///     required: true,
///     details: [...]
/// )
///
/// let bundleIdVar = VariableNode(
///     id: "var-bundleid",
///     name: "Bundle Identifier",
///     placeholder: "___VARIABLE_bundleIdentifierPrefix:bundleIdentifier___.___VARIABLE_productName:RFC1034Identifier___",
///     required: true,
///     details: [
///         DetailNode(id: "detail-transformation", key: "Transformations", value: "bundleIdentifier, RFC1034Identifier")
///     ]
/// )
/// ```
///
/// - Note: Variables can have transformations applied (`:identifier`, `:RFC1034Identifier`, `:bundleIdentifier`, etc.)
public struct VariableNode: Hashable, Identifiable {
    public let id: String
    public let name: String
    public let placeholder: String
    public let required: Bool
    public let details: [DetailNode]

    public init(
        id: String,
        name: String,
        placeholder: String,
        required: Bool,
        details: [DetailNode]
    ) {
        self.id = id
        self.name = name
        self.placeholder = placeholder
        self.required = required
        self.details = details
    }
}
