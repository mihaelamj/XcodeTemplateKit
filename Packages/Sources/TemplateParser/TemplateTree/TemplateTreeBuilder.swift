//
//  TemplateTreeBuilder.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation
import TemplateModels

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
