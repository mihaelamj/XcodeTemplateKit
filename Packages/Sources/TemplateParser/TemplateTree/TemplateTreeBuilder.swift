//
//  TemplateTreeBuilder.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation

/// Builds a hierarchical tree structure from template metadata.
///
/// Converts template metadata JSON (from `TemplateOptionsExtractor`) into a tree
/// structure suitable for display in NSOutlineView.
///
/// ## Example
/// ```swift
/// // Load template metadata JSON
/// let jsonData = try Data(contentsOf: URL(fileURLWithPath: "all-templates.json"))
///
/// // Build tree
/// let treeRoot = try TemplateTreeBuilder.buildTree(from: jsonData)
///
/// // Navigate tree
/// switch treeRoot {
/// case .root(let rootNode):
///     for category in rootNode.categories {
///         print("Category: \(category.displayName)")
///         for kind in category.kinds {
///             print("  Kind: \(kind.displayName)")
///             for template in kind.templates {
///                 print("    Template: \(template.name)")
///                 if let ancestors = template.sections.first(where: { $0.type == .properties })?
///                     .items.first(where: { node in
///                         if case .property(let prop) = node, prop.key == "Ancestors" {
///                             return true
///                         }
///                         return false
///                     }) {
///                     print("      Inherits from base templates")
///                 }
///             }
///         }
///     }
/// }
/// ```
public enum TemplateTreeBuilder {
    /// Build a complete tree from template inventory JSON.
    ///
    /// - Parameter jsonData: JSON data from `TemplateOptionsExtractor` output
    /// - Returns: Root node of the template tree
    /// - Throws: Decoding errors if JSON is invalid
    public static func buildTree(from jsonData: Data) throws -> TemplateTreeNode {
        let decoder = JSONDecoder()
        let inventory = try decoder.decode(TemplateInventory.self, from: jsonData)
        return buildTree(from: inventory)
    }

    /// Build a complete tree from template inventory.
    ///
    /// Organizes templates into a hierarchy:
    /// - Groups by category (Project Templates, Package Templates)
    /// - Groups by kind (App, Game, Framework, etc.)
    /// - Includes template properties, options, and variables
    /// - Shows ancestor (parent) templates for inheritance
    ///
    /// - Parameter inventory: Parsed template inventory
    /// - Returns: Root node of the template tree
    public static func buildTree(from inventory: TemplateInventory) -> TemplateTreeNode {
        // Group templates by category, then by kind
        var categorizedTemplates: [TemplateCategory: [TemplateKind: [TemplateMetadata]]] = [:]

        for template in inventory.templates {
            let kind = template.kind

            let category = kind.category

            if categorizedTemplates[category] == nil {
                categorizedTemplates[category] = [:]
            }

            if categorizedTemplates[category]?[kind] == nil {
                categorizedTemplates[category]?[kind] = []
            }

            categorizedTemplates[category]?[kind]?.append(template)
        }

        // Build category nodes
        let categoryNodes: [TemplateCategoryNode] = categorizedTemplates
            .sorted { $0.key.rawValue < $1.key.rawValue }
            .map { category, kindTemplates in
                let kindNodes: [TemplateKindNode] = kindTemplates
                    .sorted { $0.key.displayName < $1.key.displayName }
                    .map { kind, templates in
                        let templateNodes = templates
                            .sorted { $0.name < $1.name }
                            .map { buildTemplateNode(from: $0) }

                        return TemplateKindNode(
                            id: "kind-\(kind.rawValue)",
                            kind: kind,
                            templates: templateNodes
                        )
                    }

                return TemplateCategoryNode(
                    id: "category-\(category.rawValue)",
                    category: category,
                    kinds: kindNodes
                )
            }

        let root = RootNode(categories: categoryNodes)
        return .root(root)
    }

    // MARK: - Private Helpers

    // swiftlint:disable:next function_body_length
    private static func buildTemplateNode(from metadata: TemplateMetadata) -> TemplateNode {
        var sections: [SectionNode] = []

        // Properties section
        var propertyItems: [TemplateTreeNode] = [
            .property(PropertyNode(
                id: "\(metadata.path)-property-name",
                key: "Name",
                value: metadata.name
            )),
            .property(PropertyNode(
                id: "\(metadata.path)-property-path",
                key: "Path",
                value: metadata.path
            )),
            .property(PropertyNode(
                id: "\(metadata.path)-property-kind",
                key: "Kind",
                value: metadata.kind.displayName
            )),
        ]

        propertyItems.append(.property(PropertyNode(
            id: "\(metadata.path)-property-identifier",
            key: "Identifier",
            value: metadata.identifier
        )))

        if let ancestors = metadata.ancestors, !ancestors.isEmpty {
            propertyItems.append(.property(PropertyNode(
                id: "\(metadata.path)-property-ancestors",
                key: "Ancestors",
                value: ancestors.map(\.displayName).joined(separator: ", ")
            )))
        }

        sections.append(SectionNode(
            id: "\(metadata.path)-section-properties",
            type: .properties,
            items: propertyItems
        ))

        // Options section
        if !metadata.options.isEmpty {
            let optionItems = metadata.options.map { option -> TemplateTreeNode in
                buildOptionNode(from: option, parentPath: metadata.path)
            }

            sections.append(SectionNode(
                id: "\(metadata.path)-section-options",
                type: .options,
                items: optionItems
            ))
        }

        // Variables section (would be populated from actual template parsing)
        // For now, we don't have variable data in the JSON
        sections.append(SectionNode(
            id: "\(metadata.path)-section-variables",
            type: .variables,
            items: []
        ))

        return TemplateNode(
            id: metadata.path,
            name: metadata.name,
            path: metadata.path,
            kind: metadata.kind,
            sections: sections
        )
    }

    private static func buildOptionNode(from option: TemplateOptionJSON, parentPath: String) -> TemplateTreeNode {
        let optionType = OptionType(rawValue: option.type) ?? .text

        let details: [DetailNode] = [
            DetailNode(
                id: "\(parentPath)-option-\(option.identifier)-detail-type",
                key: "Type",
                value: optionType.displayName
            ),
            DetailNode(
                id: "\(parentPath)-option-\(option.identifier)-detail-identifier",
                key: "Identifier",
                value: option.identifier
            ),
            DetailNode(
                id: "\(parentPath)-option-\(option.identifier)-detail-default",
                key: "Default",
                value: option.defaultValue
            ),
        ]

        var choicesNode: ChoicesNode?
        if let choices = option.choices, !choices.isEmpty {
            let choiceNodes = choices.enumerated().map { index, choice in
                ChoiceNode(
                    id: "\(parentPath)-option-\(option.identifier)-choice-\(index)",
                    name: choice,
                    identifier: nil
                )
            }
            choicesNode = ChoicesNode(
                id: "\(parentPath)-option-\(option.identifier)-choices",
                choices: choiceNodes
            )
        }

        let optionNode = OptionNode(
            id: "\(parentPath)-option-\(option.identifier)",
            name: option.name,
            identifier: option.identifier,
            type: optionType,
            defaultValue: option.defaultValue,
            details: details,
            choices: choicesNode
        )

        return .option(optionNode)
    }
}

// MARK: - JSON Codable Types

/// Template inventory from `TemplateOptionsExtractor` output.
///
/// Contains all discovered templates with their metadata.
///
/// ## Example JSON
/// ```json
/// {
///   "generatedAt": "2025-11-17T16:38:34Z",
///   "totalTemplates": 88,
///   "totalCombinations": 176,
///   "templates": [...]
/// }
/// ```
public struct TemplateInventory: Codable, Sendable {
    public let generatedAt: String
    public let templates: [TemplateMetadata]
    public let totalTemplates: Int
    public let totalCombinations: Int

    public init(
        generatedAt: String,
        templates: [TemplateMetadata],
        totalTemplates: Int,
        totalCombinations: Int
    ) {
        self.generatedAt = generatedAt
        self.templates = templates
        self.totalTemplates = totalTemplates
        self.totalCombinations = totalCombinations
    }
}

/// Metadata for a single template from JSON.
///
/// Extracted from a `.xctemplate` bundle's `TemplateInfo.plist`.
///
/// ## Example JSON
/// ```json
/// {
///   "name": "iOS Safari Extension App",
///   "path": "/Applications/Xcode.app/.../iOS Safari Extension App.xctemplate",
///   "kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
///   "identifier": "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS",
///   "ancestors": [
///     "com.apple.dt.unit.applicationBase",
///     "com.apple.dt.unit.iosBase",
///     "com.apple.dt.unit.languageChoice.app.iOS",
///     "com.apple.dt.unit.appLifecycle.iOS"
///   ],
///   "options": [...],
///   "totalCombinations": 1
/// }
/// ```
///
/// - Note: `ancestors` contains template identifier strings that reference parent templates.
///   These are resolved later using `ProjectTemplateParser.loadWithAncestors()`.
public struct TemplateMetadata: Codable, Identifiable, Hashable, Sendable {
    public let id: String // Use path as unique ID
    public let name: String
    public let path: String
    public let kind: TemplateKind
    public let ancestors: [TemplateKind]?
    public let options: [TemplateOptionJSON]
    public let totalCombinations: Int
    public let fileStructure: [FileNode]?

    /// Detailed description of what this template creates.
    ///
    /// Example: "This template creates a multi-platform SwiftUI application."
    /// Appears in 69 of 146 templates.
    public let description: String?

    // MARK: - Simple String Fields

    /// Target association specification ID. Appears in 5 templates.
    public let associatedTargetSpecification: String?

    /// Build phase type for file templates. Appears in 16 templates.
    public let buildableType: String?

    /// Default filename for the created file. Appears in 69 templates.
    public let defaultCompletionName: String?

    /// UI visibility flag. Appears in 9 templates.
    public let hiddenFromChooser: String?

    /// Library visibility flag. Appears in 9 templates.
    public let hiddenFromLibrary: String?

    /// Icon filename for template. Appears in 5 templates.
    public let icon: String?

    /// Image asset name. Appears in 59 templates.
    public let image: String?

    /// Primary template file path. Appears in 47 templates.
    public let mainTemplateFile: String?

    /// Display name override. Appears in 9 templates.
    public let templateName: String?

    /// Initial file to open in editor. Appears in 8 templates.
    public let nameOfInitialFileForEditor: String?

    /// Swift Package type. Appears in 5 templates.
    public let packageType: String?

    /// Project configuration. Appears in 10 templates.
    public let project: String?

    /// Template summary text. Prevalence unknown.
    public let summary: String?

    // MARK: - Boolean Fields

    /// Whether template is concrete (not abstract). Appears in 17 templates.
    public let concrete: Bool?

    /// Whether template is localized by default. Appears in 2 templates.
    public let localizedByDefault: Bool?

    /// Whether template is project-only. Appears in 1 template.
    public let projectOnly: Bool?

    /// Whether template supports Swift Package. Appears in 25 templates.
    public let supportsSwiftPackage: Bool?

    /// Whether to suppress top-level group. Appears in 3 templates.
    public let suppressTopLevelGroup: Bool?

    /// Whether template is target-only. Appears in 7 templates.
    public let targetOnly: Bool?

    // MARK: - Integer Fields

    /// UI sort order. Appears in 41 templates.
    public let sortOrder: Int?

    /// Original raw content from TemplateInfo.plist.
    ///
    /// Contains the raw text as it appears on disk,
    /// preserving the original formatting and comments.
    public let rawContent: String?

    /// The format type of the raw content.
    ///
    /// Can be "xml", "json", or "openstep" (ASCII plist format).
    public let rawContentType: String?

    /// Template identifier derived from kind.
    public var identifier: String {
        kind.rawValue
    }

    /// Initialize with parsed values
    public init(
        name: String,
        path: String,
        kind: TemplateKind,
        ancestors: [TemplateKind]? = nil,
        options: [TemplateOptionJSON] = [],
        totalCombinations: Int = 1,
        fileStructure: [FileNode]? = nil,
        description: String? = nil,
        associatedTargetSpecification: String? = nil,
        buildableType: String? = nil,
        defaultCompletionName: String? = nil,
        hiddenFromChooser: String? = nil,
        hiddenFromLibrary: String? = nil,
        icon: String? = nil,
        image: String? = nil,
        mainTemplateFile: String? = nil,
        templateName: String? = nil,
        nameOfInitialFileForEditor: String? = nil,
        packageType: String? = nil,
        project: String? = nil,
        summary: String? = nil,
        concrete: Bool? = nil,
        localizedByDefault: Bool? = nil,
        projectOnly: Bool? = nil,
        supportsSwiftPackage: Bool? = nil,
        suppressTopLevelGroup: Bool? = nil,
        targetOnly: Bool? = nil,
        sortOrder: Int? = nil,
        rawContent: String? = nil,
        rawContentType: String? = nil
    ) {
        self.name = name
        self.path = path
        self.kind = kind
        self.ancestors = ancestors
        self.options = options
        self.totalCombinations = totalCombinations
        self.fileStructure = fileStructure
        self.description = description
        self.associatedTargetSpecification = associatedTargetSpecification
        self.buildableType = buildableType
        self.defaultCompletionName = defaultCompletionName
        self.hiddenFromChooser = hiddenFromChooser
        self.hiddenFromLibrary = hiddenFromLibrary
        self.icon = icon
        self.image = image
        self.mainTemplateFile = mainTemplateFile
        self.templateName = templateName
        self.nameOfInitialFileForEditor = nameOfInitialFileForEditor
        self.packageType = packageType
        self.project = project
        self.summary = summary
        self.concrete = concrete
        self.localizedByDefault = localizedByDefault
        self.projectOnly = projectOnly
        self.supportsSwiftPackage = supportsSwiftPackage
        self.suppressTopLevelGroup = suppressTopLevelGroup
        self.targetOnly = targetOnly
        self.sortOrder = sortOrder
        self.rawContent = rawContent
        self.rawContentType = rawContentType
        id = path
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)

        // Try "path" first, fall back to "source_path"
        if let pathValue = try? container.decode(String.self, forKey: .path) {
            path = pathValue
        } else {
            path = try container.decode(String.self, forKey: .sourcePath)
        }

        kind = try container.decode(TemplateKind.self, forKey: .kind)
        ancestors = try container.decodeIfPresent([TemplateKind].self, forKey: .ancestors)
        options = try container.decodeIfPresent([TemplateOptionJSON].self, forKey: .options) ?? []
        totalCombinations = try container.decodeIfPresent(Int.self, forKey: .totalCombinations) ?? 1
        fileStructure = try container.decodeIfPresent([FileNode].self, forKey: .fileStructure)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        associatedTargetSpecification = try container.decodeIfPresent(String.self, forKey: .associatedTargetSpecification)
        buildableType = try container.decodeIfPresent(String.self, forKey: .buildableType)
        defaultCompletionName = try container.decodeIfPresent(String.self, forKey: .defaultCompletionName)
        hiddenFromChooser = try container.decodeIfPresent(String.self, forKey: .hiddenFromChooser)
        hiddenFromLibrary = try container.decodeIfPresent(String.self, forKey: .hiddenFromLibrary)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        mainTemplateFile = try container.decodeIfPresent(String.self, forKey: .mainTemplateFile)
        templateName = try container.decodeIfPresent(String.self, forKey: .templateName)
        nameOfInitialFileForEditor = try container.decodeIfPresent(String.self, forKey: .nameOfInitialFileForEditor)
        packageType = try container.decodeIfPresent(String.self, forKey: .packageType)
        project = try container.decodeIfPresent(String.self, forKey: .project)
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        concrete = try container.decodeIfPresent(Bool.self, forKey: .concrete)
        localizedByDefault = try container.decodeIfPresent(Bool.self, forKey: .localizedByDefault)
        projectOnly = try container.decodeIfPresent(Bool.self, forKey: .projectOnly)
        supportsSwiftPackage = try container.decodeIfPresent(Bool.self, forKey: .supportsSwiftPackage)
        suppressTopLevelGroup = try container.decodeIfPresent(Bool.self, forKey: .suppressTopLevelGroup)
        targetOnly = try container.decodeIfPresent(Bool.self, forKey: .targetOnly)
        sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder)
        rawContent = try container.decodeIfPresent(String.self, forKey: .rawContent)
        rawContentType = try container.decodeIfPresent(String.self, forKey: .rawContentType)
        id = path // Use path as unique ID
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(path, forKey: .path)
        try container.encode(kind, forKey: .kind)
        try container.encodeIfPresent(ancestors, forKey: .ancestors)
        try container.encode(options, forKey: .options)
        try container.encode(totalCombinations, forKey: .totalCombinations)
        try container.encodeIfPresent(fileStructure, forKey: .fileStructure)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(associatedTargetSpecification, forKey: .associatedTargetSpecification)
        try container.encodeIfPresent(buildableType, forKey: .buildableType)
        try container.encodeIfPresent(defaultCompletionName, forKey: .defaultCompletionName)
        try container.encodeIfPresent(hiddenFromChooser, forKey: .hiddenFromChooser)
        try container.encodeIfPresent(hiddenFromLibrary, forKey: .hiddenFromLibrary)
        try container.encodeIfPresent(icon, forKey: .icon)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(mainTemplateFile, forKey: .mainTemplateFile)
        try container.encodeIfPresent(templateName, forKey: .templateName)
        try container.encodeIfPresent(nameOfInitialFileForEditor, forKey: .nameOfInitialFileForEditor)
        try container.encodeIfPresent(packageType, forKey: .packageType)
        try container.encodeIfPresent(project, forKey: .project)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(concrete, forKey: .concrete)
        try container.encodeIfPresent(localizedByDefault, forKey: .localizedByDefault)
        try container.encodeIfPresent(projectOnly, forKey: .projectOnly)
        try container.encodeIfPresent(supportsSwiftPackage, forKey: .supportsSwiftPackage)
        try container.encodeIfPresent(suppressTopLevelGroup, forKey: .suppressTopLevelGroup)
        try container.encodeIfPresent(targetOnly, forKey: .targetOnly)
        try container.encodeIfPresent(sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(rawContent, forKey: .rawContent)
        try container.encodeIfPresent(rawContentType, forKey: .rawContentType)
    }

    enum CodingKeys: String, CodingKey {
        case name
        case path
        case sourcePath = "source_path"
        case kind = "identifier" // Decode from "identifier" field - the unique template identifier
        case ancestors
        case options
        case totalCombinations
        case fileStructure = "file_structure"
        case description
        case associatedTargetSpecification
        case buildableType
        case defaultCompletionName
        case hiddenFromChooser
        case hiddenFromLibrary
        case icon
        case image
        case mainTemplateFile
        case templateName
        case nameOfInitialFileForEditor
        case packageType
        case project
        case summary
        case concrete
        case localizedByDefault
        case projectOnly
        case supportsSwiftPackage
        case suppressTopLevelGroup
        case targetOnly
        case sortOrder
        case rawContent = "raw_content"
        case rawContentType = "raw_content_type"
    }
}

/// Component in an option unit (e.g., test targets to be created).
///
/// Example: When selecting "Swift Testing", it creates unit and UI test targets.
public struct TemplateOptionComponent: Codable, Hashable, Sendable {
    public let identifier: String
    public let name: String

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
    }
}

/// Unit value for an option (e.g., "Swift" or "Objective-C" for language choice).
///
/// Units can contain complex nested structures like Components, Definitions, and Targets.
/// For now, we only decode Components. Definitions and Targets will be added later.
public struct TemplateOptionUnit: Codable, Hashable, Sendable {
    public let components: [TemplateOptionComponent]?

    enum CodingKeys: String, CodingKey {
        case components = "Components"
    }
}

/// Template option from JSON (internal type).
///
/// Renamed from `TemplateOption` to avoid collision with existing parser type.
///
/// ## Example JSON
/// ```json
/// {
///   "name": "Testing System:",
///   "type": "popup",
///   "identifier": "testingSystem",
///   "defaultValue": "None",
///   "values": ["None", "XCTest", "Swift Testing"],
///   "valueTitles": ["None", "XCTest for Unit and UI Tests", "Swift Testing with XCTest UI Tests"],
///   "units": { ... }
/// }
/// ```
public struct TemplateOptionJSON: Codable, Hashable, Sendable {
    public let identifier: String
    public let name: String
    public let type: String
    public let defaultValue: String
    public let description: String?
    public let override: String?
    public let notPersisted: Bool?
    public let required: Bool?
    public let emptyReplacement: String?
    public let sortOrder: Int?
    public let values: [String]?
    public let valueTitles: [String]?
    public let requiredOptionsForValues: [String: [String: String]]?
    public let units: [String: TemplateOptionUnit]?

    // Legacy field for backward compatibility
    public var choices: [String]? {
        values
    }

    public init(
        identifier: String,
        name: String = "",
        type: String = "text",
        defaultValue: String = "",
        description: String? = nil,
        override: String? = nil,
        notPersisted: Bool? = nil,
        required: Bool? = nil,
        emptyReplacement: String? = nil,
        sortOrder: Int? = nil,
        values: [String]? = nil,
        valueTitles: [String]? = nil,
        requiredOptionsForValues: [String: [String: String]]? = nil,
        units: [String: TemplateOptionUnit]? = nil
    ) {
        self.identifier = identifier
        self.name = name
        self.type = type
        self.defaultValue = defaultValue
        self.description = description
        self.override = override
        self.notPersisted = notPersisted
        self.required = required
        self.emptyReplacement = emptyReplacement
        self.sortOrder = sortOrder
        self.values = values
        self.valueTitles = valueTitles
        self.requiredOptionsForValues = requiredOptionsForValues
        self.units = units
    }

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case type = "Type"
        case defaultValue = "Default"
        case description = "Description"
        case override = "Override"
        case notPersisted = "NotPersisted"
        case required = "Required"
        case emptyReplacement = "EmptyReplacement"
        case sortOrder = "SortOrder"
        case values = "Values"
        case valueTitles = "ValueTitles"
        case requiredOptionsForValues = "RequiredOptionsForValues"
        case units = "Units"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(String.self, forKey: .identifier)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? "text"
        defaultValue = try container.decodeIfPresent(String.self, forKey: .defaultValue) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description)
        override = try container.decodeIfPresent(String.self, forKey: .override)
        notPersisted = try container.decodeIfPresent(Bool.self, forKey: .notPersisted)
        required = try container.decodeIfPresent(Bool.self, forKey: .required)
        emptyReplacement = try container.decodeIfPresent(String.self, forKey: .emptyReplacement)
        sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder)
        values = try container.decodeIfPresent([String].self, forKey: .values)
        valueTitles = try container.decodeIfPresent([String].self, forKey: .valueTitles)
        requiredOptionsForValues = try container.decodeIfPresent([String: [String: String]].self, forKey: .requiredOptionsForValues)
        units = try container.decodeIfPresent([String: TemplateOptionUnit].self, forKey: .units)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(identifier, forKey: .identifier)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(defaultValue, forKey: .defaultValue)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(override, forKey: .override)
        try container.encodeIfPresent(notPersisted, forKey: .notPersisted)
        try container.encodeIfPresent(required, forKey: .required)
        try container.encodeIfPresent(emptyReplacement, forKey: .emptyReplacement)
        try container.encodeIfPresent(sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(values, forKey: .values)
        try container.encodeIfPresent(valueTitles, forKey: .valueTitles)
        try container.encodeIfPresent(requiredOptionsForValues, forKey: .requiredOptionsForValues)
        try container.encodeIfPresent(units, forKey: .units)
    }
}
