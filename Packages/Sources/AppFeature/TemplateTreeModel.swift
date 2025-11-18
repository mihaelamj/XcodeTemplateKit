import Foundation
import Observation
import TemplateParser

/// UI-specific tree model for displaying templates in an expandable hierarchy.
///
/// This creates an in-memory tree structure where EVERYTHING is a node:
/// - Categories (File Templates, Project Templates, Package Templates)
/// - Templates
/// - Properties (Name, Identifier, etc.)
/// - Ancestors (with their full property trees)
/// - Options
/// - File Structure
///
/// This allows for a fully expandable/collapsible tree view similar to Xcode's Project Navigator.
///
/// Uses @Observable macro (iOS 17+) for better performance - views only update when
/// properties read by body actually change.
@Observable
public final class TemplateTreeModel {
    public var rootNodes: [TreeNode] = []
    public var expandedNodes: Set<String> = []

    private let inventory: TemplateInventory
    private var templateCache: [String: TemplateMetadata] = [:]

    public init(inventory: TemplateInventory) {
        self.inventory = inventory

        // Build template cache for quick ancestor lookups
        for template in inventory.templates {
            templateCache[template.identifier] = template
        }

        buildTree()
    }

    private func buildTree() {
        // Group templates by category
        let grouped = Dictionary(grouping: inventory.templates) { $0.kind.category }

        // Create category nodes
        rootNodes = TemplateCategory.allCases.compactMap { category in
            guard let templates = grouped[category] else { return nil }

            let categoryNode = TreeNode(
                id: "category-\(category.rawValue)",
                type: .category(category),
                label: category.displayName,
                icon: iconForCategory(category),
                children: templates
                    .sorted { $0.name < $1.name }
                    .map { buildTemplateNode($0) }
            )

            return categoryNode
        }
    }

    private func buildTemplateNode(_ template: TemplateMetadata) -> TreeNode {
        var children: [TreeNode] = []

        // Properties node
        let propertiesNode = buildPropertiesNode(for: template)
        children.append(propertiesNode)

        // Ancestors node (with full property expansion)
        if let ancestors = template.ancestors, !ancestors.isEmpty {
            let ancestorsNode = buildAncestorsNode(ancestors: ancestors, templateName: template.name)
            children.append(ancestorsNode)
        }

        // Options node
        if !template.options.isEmpty {
            let optionsNode = buildOptionsNode(options: template.options, templateName: template.name)
            children.append(optionsNode)
        }

        // File Structure node
        if let fileStructure = template.fileStructure, !fileStructure.isEmpty {
            let filesNode = buildFileStructureNode(files: fileStructure, templateName: template.name)
            children.append(filesNode)
        }

        return TreeNode(
            id: "template-\(template.path)",
            type: .template(template),
            label: template.name,
            subtitle: template.kind.displayName,
            icon: iconForTemplate(template),
            children: children
        )
    }

    private func buildPropertiesNode(for template: TemplateMetadata, idPrefix: String? = nil) -> TreeNode {
        var propertyChildren: [TreeNode] = []
        let prefix = idPrefix ?? template.path

        // Basic properties
        propertyChildren.append(TreeNode(
            id: "prop-\(prefix)-name",
            type: .property(key: "Name", value: template.name),
            label: "Name: \(template.name)",
            icon: "textformat"
        ))

        propertyChildren.append(TreeNode(
            id: "prop-\(prefix)-kind",
            type: .property(key: "Kind", value: template.kind.displayName),
            label: "Kind: \(template.kind.displayName)",
            icon: "tag"
        ))

        propertyChildren.append(TreeNode(
            id: "prop-\(prefix)-identifier",
            type: .property(key: "Identifier", value: template.identifier),
            label: "Identifier: \(template.identifier)",
            icon: "number"
        ))

        propertyChildren.append(TreeNode(
            id: "prop-\(prefix)-category",
            type: .property(key: "Category", value: template.kind.category.displayName),
            label: "Category: \(template.kind.category.displayName)",
            icon: "folder"
        ))

        propertyChildren.append(TreeNode(
            id: "prop-\(prefix)-combinations",
            type: .property(key: "Total Combinations", value: "\(template.totalCombinations)"),
            label: "Total Combinations: \(template.totalCombinations)",
            icon: "number.circle"
        ))

        propertyChildren.append(TreeNode(
            id: "prop-\(prefix)-isbase",
            type: .property(key: "Is Base Template", value: template.kind.isBaseTemplate ? "Yes" : "No"),
            label: "Is Base Template: \(template.kind.isBaseTemplate ? "Yes" : "No")",
            icon: "cube"
        ))

        return TreeNode(
            id: "properties-\(prefix)",
            type: .section(name: "Properties"),
            label: "Properties",
            icon: "list.bullet.rectangle",
            children: propertyChildren
        )
    }

    private func buildAncestorsNode(ancestors: [TemplateKind], templateName: String) -> TreeNode {
        let ancestorChildren = ancestors.enumerated().map { index, ancestorKind in
            // Try to find the actual ancestor template to show its full properties
            if let ancestorTemplate = templateCache[ancestorKind.rawValue] {
                return buildAncestorTemplateNode(ancestorTemplate, index: index, parentName: templateName)
            } else {
                // Ancestor not in our inventory (external base template)
                return TreeNode(
                    id: "ancestor-\(templateName)-\(index)-\(ancestorKind.rawValue)",
                    type: .ancestor(kind: ancestorKind),
                    label: ancestorKind.displayName,
                    subtitle: "External base template",
                    icon: "arrow.turn.down.right"
                )
            }
        }

        return TreeNode(
            id: "ancestors-\(templateName)",
            type: .section(name: "Ancestors"),
            label: "Ancestors (\(ancestors.count))",
            icon: "arrow.triangle.branch",
            children: ancestorChildren
        )
    }

    private func buildAncestorTemplateNode(_ template: TemplateMetadata, index: Int, parentName: String) -> TreeNode {
        var children: [TreeNode] = []

        // Add properties of the ancestor with unique ID
        let ancestorTemplateName = "ancestor-\(parentName)-\(index)"
        let ancestorProps = buildPropertiesNode(for: template, idPrefix: ancestorTemplateName)
        children.append(ancestorProps)

        // Recursively add ancestor's ancestors
        if let nestedAncestors = template.ancestors, !nestedAncestors.isEmpty {
            let nestedNode = buildAncestorsNode(ancestors: nestedAncestors, templateName: ancestorTemplateName)
            children.append(nestedNode)
        }

        // Add ancestor's options
        if !template.options.isEmpty {
            let optionsNode = buildOptionsNode(options: template.options, templateName: ancestorTemplateName)
            children.append(optionsNode)
        }

        return TreeNode(
            id: "ancestor-\(parentName)-\(index)-\(template.identifier)",
            type: .ancestorTemplate(template),
            label: template.name,
            subtitle: template.kind.displayName,
            icon: "cube.fill",
            children: children
        )
    }

    private func buildOptionsNode(options: [TemplateOptionJSON], templateName: String) -> TreeNode {
        let optionChildren = options.enumerated().map { index, option in
            var optionDetails: [TreeNode] = []

            optionDetails.append(TreeNode(
                id: "option-\(templateName)-\(index)-type",
                type: .property(key: "Type", value: option.type),
                label: "Type: \(option.type)",
                icon: "doc.text"
            ))

            optionDetails.append(TreeNode(
                id: "option-\(templateName)-\(index)-identifier",
                type: .property(key: "Identifier", value: option.identifier),
                label: "Identifier: \(option.identifier)",
                icon: "number"
            ))

            optionDetails.append(TreeNode(
                id: "option-\(templateName)-\(index)-default",
                type: .property(key: "Default Value", value: option.defaultValue),
                label: "Default: \(option.defaultValue)",
                icon: "checkmark.circle"
            ))

            if let choices = option.choices, !choices.isEmpty {
                let choicesNode = TreeNode(
                    id: "option-\(templateName)-\(index)-choices",
                    type: .section(name: "Choices"),
                    label: "Choices (\(choices.count))",
                    icon: "list.bullet",
                    children: choices.enumerated().map { choiceIndex, choice in
                        TreeNode(
                            id: "option-\(templateName)-\(index)-choice-\(choiceIndex)",
                            type: .value(choice),
                            label: choice,
                            icon: "circle.fill"
                        )
                    }
                )
                optionDetails.append(choicesNode)
            }

            return TreeNode(
                id: "option-\(templateName)-\(index)",
                type: .option(option),
                label: option.name,
                icon: "slider.horizontal.3",
                children: optionDetails
            )
        }

        return TreeNode(
            id: "options-\(templateName)",
            type: .section(name: "Options"),
            label: "Options (\(options.count))",
            icon: "gearshape.2",
            children: optionChildren
        )
    }

    private func buildFileStructureNode(files: [FileNode], templateName: String) -> TreeNode {
        let fileChildren = files.enumerated().map { index, file in
            buildFileNode(file: file, templateName: templateName, index: index)
        }

        return TreeNode(
            id: "files-\(templateName)",
            type: .section(name: "File Structure"),
            label: "File Structure (\(files.count))",
            icon: "doc.on.doc",
            children: fileChildren
        )
    }

    private func buildFileNode(file: FileNode, templateName: String, index: Int) -> TreeNode {
        let children: [TreeNode]
        if let fileChildren = file.children, !fileChildren.isEmpty {
            // Recursively build children for directories
            children = fileChildren.enumerated().map { childIndex, child in
                buildFileNode(file: child, templateName: "\(templateName)-\(index)", index: childIndex)
            }
        } else {
            children = []
        }

        return TreeNode(
            id: "file-\(templateName)-\(index)-\(file.path)",
            type: .file(file),
            label: file.name,
            icon: file.isDirectory ? "folder.fill" : iconForFile(file.name),
            children: children
        )
    }

    // MARK: - Helper Methods

    private func iconForCategory(_ category: TemplateCategory) -> String {
        switch category {
        case .projectTemplates: return "folder.fill"
        case .fileTemplates: return "doc.fill"
        case .packageTemplates: return "shippingbox.fill"
        }
    }

    private func iconForTemplate(_ template: TemplateMetadata) -> String {
        if template.kind.isBaseTemplate {
            return "cube"
        }
        switch template.kind.category {
        case .projectTemplates: return "app.fill"
        case .fileTemplates: return "doc.text"
        case .packageTemplates: return "shippingbox"
        }
    }

    private func iconForFile(_ name: String) -> String {
        let ext = (name as NSString).pathExtension.lowercased()
        switch ext {
        case "swift": return "swift"
        case "h", "m", "mm": return "doc.text"
        case "plist": return "list.bullet"
        case "json": return "curlybraces"
        default: return "doc"
        }
    }

    // MARK: - Expansion/Selection

    public func toggleExpansion(for nodeID: String) {
        if expandedNodes.contains(nodeID) {
            expandedNodes.remove(nodeID)
        } else {
            expandedNodes.insert(nodeID)
        }
    }

    public func isExpanded(_ nodeID: String) -> Bool {
        expandedNodes.contains(nodeID)
    }

    public func expandAll() {
        func collectIDs(from nodes: [TreeNode]) -> Set<String> {
            var ids = Set<String>()
            for node in nodes where !node.children.isEmpty {
                ids.insert(node.id)
                ids.formUnion(collectIDs(from: node.children))
            }
            return ids
        }
        expandedNodes = collectIDs(from: rootNodes)
    }

    public func collapseAll() {
        expandedNodes.removeAll()
    }
}

// MARK: - Tree Node

public struct TreeNode: Identifiable, Hashable {
    public let id: String
    public let type: NodeType
    public let label: String
    public let subtitle: String?
    public let icon: String
    public let children: [TreeNode]

    public init(
        id: String,
        type: NodeType,
        label: String,
        subtitle: String? = nil,
        icon: String,
        children: [TreeNode] = []
    ) {
        self.id = id
        self.type = type
        self.label = label
        self.subtitle = subtitle
        self.icon = icon
        self.children = children
    }

    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Node Type

public enum NodeType: Hashable {
    case category(TemplateCategory)
    case template(TemplateMetadata)
    case ancestorTemplate(TemplateMetadata)
    case ancestor(kind: TemplateKind)
    case section(name: String)
    case property(key: String, value: String)
    case option(TemplateOptionJSON)
    case file(FileNode)
    case value(String)
}
