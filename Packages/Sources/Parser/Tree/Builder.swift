//
//  Builder.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree {
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
    public enum Builder {
        /// Build a complete tree from template inventory JSON.
        ///
        /// - Parameter jsonData: JSON data from `TemplateOptionsExtractor` output
        /// - Returns: Root node of the template tree
        /// - Throws: Decoding errors if JSON is invalid
        public static func buildTree(from jsonData: Data) throws -> Node {
            let decoder = JSONDecoder()
            let inventory = try decoder.decode(Models.Template.Model.Inventory.self, from: jsonData)
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
        public static func buildTree(from inventory: Models.Template.Model.Inventory) -> Node {
            // Group templates by category, then by kind
            var categorizedTemplates: [Models.Template.Model.Category: [Models.Template.Model.Kind: [Models.Template.Model.Metadata]]] = [:]

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
            let categoryNodes: [Node.Category] = categorizedTemplates
                .sorted { $0.key.rawValue < $1.key.rawValue }
                .map { category, kindTemplates in
                    let kindNodes: [Node.TemplateKind] = kindTemplates
                        .sorted { $0.key.displayName < $1.key.displayName }
                        .map { kind, templates in
                            let templateNodes = templates
                                .sorted { $0.name < $1.name }
                                .map { buildTemplateNode(from: $0) }

                            return Node.TemplateKind(
                                id: "kind-\(kind.rawValue)",
                                kind: kind,
                                templates: templateNodes
                            )
                        }

                    return Node.Category(
                        id: "category-\(category.rawValue)",
                        category: category,
                        kinds: kindNodes
                    )
                }

            let root = Node.Root(categories: categoryNodes)
            return .root(root)
        }

        // MARK: - Private Helpers

        // swiftlint:disable:next function_body_length
        private static func buildTemplateNode(from metadata: Models.Template.Model.Metadata) -> Node.Template {
            var sections: [Node.Section] = []

            // Properties section
            var propertyItems: [Node] = [
                .property(Node.Property(
                    id: "\(metadata.path)-property-name",
                    key: "Name",
                    value: metadata.name
                )),
                .property(Node.Property(
                    id: "\(metadata.path)-property-path",
                    key: "Path",
                    value: metadata.path
                )),
                .property(Node.Property(
                    id: "\(metadata.path)-property-kind",
                    key: "Kind",
                    value: metadata.kind.displayName
                )),
            ]

            propertyItems.append(.property(Node.Property(
                id: "\(metadata.path)-property-identifier",
                key: "Identifier",
                value: metadata.identifier
            )))

            if let ancestors = metadata.ancestors, !ancestors.isEmpty {
                propertyItems.append(.property(Node.Property(
                    id: "\(metadata.path)-property-ancestors",
                    key: "Ancestors",
                    value: ancestors.map(\.displayName).joined(separator: ", ")
                )))
            }

            sections.append(Node.Section(
                id: "\(metadata.path)-section-properties",
                type: Node.Section.SectionType.properties,
                items: propertyItems
            ))

            // Options section
            if !metadata.options.isEmpty {
                let optionItems = metadata.options.map { option -> Node in
                    buildOptionNode(from: option, parentPath: metadata.path)
                }

                sections.append(Node.Section(
                    id: "\(metadata.path)-section-options",
                    type: Node.Section.SectionType.options,
                    items: optionItems
                ))
            }

            // Variables section (would be populated from actual template parsing)
            // For now, we don't have variable data in the JSON
            sections.append(Node.Section(
                id: "\(metadata.path)-section-variables",
                type: Node.Section.SectionType.variables,
                items: []
            ))

            return Node.Template(
                id: metadata.path,
                name: metadata.name,
                path: metadata.path,
                kind: metadata.kind,
                sections: sections
            )
        }

        private static func buildOptionNode(from option: Models.Template.Model.Option, parentPath: String) -> Node {
            let optionType = Models.Template.Model.OptionType(rawValue: option.type) ?? .text

            let details: [Node.Detail] = [
                Node.Detail(
                    id: "\(parentPath)-option-\(option.identifier)-detail-type",
                    key: "Type",
                    value: optionType.displayName
                ),
                Node.Detail(
                    id: "\(parentPath)-option-\(option.identifier)-detail-identifier",
                    key: "Identifier",
                    value: option.identifier
                ),
                Node.Detail(
                    id: "\(parentPath)-option-\(option.identifier)-detail-default",
                    key: "Default",
                    value: option.defaultValue
                ),
            ]

            var choicesNode: Node.Choices?
            if let choices = option.choices, !choices.isEmpty {
                let choiceNodes = choices.enumerated().map { index, choice in
                    Node.Choice(
                        id: "\(parentPath)-option-\(option.identifier)-choice-\(index)",
                        name: choice,
                        identifier: nil
                    )
                }
                choicesNode = Node.Choices(
                    id: "\(parentPath)-option-\(option.identifier)-choices",
                    choices: choiceNodes
                )
            }

            let optionNode = Node.Option(
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
}
