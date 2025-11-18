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
        case rawContent = "raw_content"
        case rawContentType = "raw_content_type"
    }
}

/// Template option from JSON (internal type).
///
/// Renamed from `TemplateOption` to avoid collision with existing parser type.
///
/// ## Example JSON
/// ```json
/// {
///   "name": "Interface",
///   "type": "popup",
///   "identifier": "interfaceChoice",
///   "defaultValue": "SwiftUI",
///   "choices": ["SwiftUI", "UIKit"]
/// }
/// ```
public struct TemplateOptionJSON: Codable, Hashable, Sendable {
    public let name: String
    public let type: String
    public let identifier: String
    public let defaultValue: String
    public let choices: [String]?
}
