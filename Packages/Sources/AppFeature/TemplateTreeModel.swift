import Foundation
import Observation
import OSLog
import TemplateModels

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
@MainActor
@Observable
public final class TemplateTreeModel {
    public var rootNodes: [TreeNode] = []
    public var expandedNodes: Set<String> = []

    private let inventory: TemplateInventory
    private var templateCache: [String: TemplateMetadata] = [:]
    private var cachedExpandableIDs: Set<String> = []
    private var fullyExpandedFlattenCache: [FlattenedNode] = []
    private var filteredNodeCache: [String: [TreeNode]] = [:]
    private var nodeLookup: [String: TreeNode] = [:]
    private static let log = OSLog(subsystem: "com.xcodetemplate.app", category: .pointsOfInterest)
    private static let logger = Logger(subsystem: "com.xcodetemplate.app", category: "TemplateTreeModel")
    private static let signposter = OSSignposter(logHandle: log)

    public init(inventory: TemplateInventory) {
        self.inventory = inventory
        inventory.templates.forEach { templateCache[$0.identifier] = $0 }
        buildTree()
    }
}

// MARK: - Public API

public extension TemplateTreeModel {
    struct FlattenedNode: Identifiable {
        public let node: TreeNode
        public let level: Int

        public var id: String { node.id }
    }

    func toggleExpansion(for nodeID: String) {
        if expandedNodes.contains(nodeID) {
            expandedNodes.remove(nodeID)
        } else {
            expandedNodes.insert(nodeID)
        }
    }

    func isExpanded(_ nodeID: String) -> Bool {
        expandedNodes.contains(nodeID)
    }

    func expandAll() {
        expandedNodes = cachedExpandableIDs
    }

    func collapseAll() {
        expandedNodes.removeAll()
    }

    func allExpandableNodeIDs() -> Set<String> {
        cachedExpandableIDs
    }

    func collectExpandableIDs(from nodes: [TreeNode]) -> Set<String> {
        collectIDs(from: nodes)
    }

    func flattenedNodes(
        roots: [TreeNode],
        expandedIDs: Set<String>,
        autoExpandAll: Bool = false
    ) -> [FlattenedNode] {
        let signpostID = TemplateTreeModel.signposter.makeSignpostID()
        let interval = TemplateTreeModel.signposter.beginInterval("FlattenNodes", id: signpostID)
        let nodes: [FlattenedNode]
        if autoExpandAll, usingFullRootSet(roots) {
            nodes = fullyExpandedFlattenCache
        } else {
            nodes = flattenNodes(
                roots: roots,
                expandedIDs: expandedIDs,
                autoExpandAll: autoExpandAll
            )
        }
        TemplateTreeModel.signposter.endInterval("FlattenNodes", interval)
        return nodes
    }

    func filteredNodes(matching searchText: String) -> [TreeNode] {
        let normalizedText = normalizedSearchKey(for: searchText)
        guard !normalizedText.isEmpty else { return rootNodes }

        if let cached = filteredNodeCache[normalizedText] {
            return cached
        }

        let signpostID = TemplateTreeModel.signposter.makeSignpostID()
        TemplateTreeModel.signposter.emitEvent("FilterNodes", id: signpostID)
        let filtered = rootNodes.compactMap { filterNode($0, searchText: normalizedText) }
        TemplateTreeModel.signposter.emitEvent("FilterNodesResult", id: signpostID)
        filteredNodeCache[normalizedText] = filtered
        return filtered
    }

    func node(withID id: String) -> TreeNode? {
        nodeLookup[id]
    }
}

// MARK: - Tree Building

private extension TemplateTreeModel {
    func buildTree() {
        let grouped = Dictionary(grouping: inventory.templates) { $0.kind.category }

        rootNodes = TemplateCategory.allCases.compactMap { category in
            guard let templates = grouped[category] else { return nil }

            return TreeNode(
                id: "category-\(category.rawValue)",
                type: .category(category),
                label: category.displayName,
                icon: iconForCategory(category),
                children: templates
                    .sorted { $0.name < $1.name }
                    .map { buildTemplateNode($0) }
            )
        }

        refreshCaches()
    }

    func buildTemplateNode(_ template: TemplateMetadata) -> TreeNode {
        var children: [TreeNode] = []

        let propertiesNode = buildPropertiesNode(for: template)
        children.append(propertiesNode)

        if let ancestors = template.ancestors, !ancestors.isEmpty {
            let ancestorsNode = buildAncestorsNode(ancestors: ancestors, templateName: template.name)
            children.append(ancestorsNode)
        }

        if !template.options.isEmpty {
            let optionsNode = buildOptionsNode(options: template.options, templateName: template.name)
            children.append(optionsNode)
        }

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

    func buildPropertiesNode(for template: TemplateMetadata, idPrefix: String? = nil) -> TreeNode {
        var propertyChildren: [TreeNode] = []
        let prefix = idPrefix ?? template.path

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

    func buildAncestorsNode(ancestors: [TemplateKind], templateName: String) -> TreeNode {
        let ancestorChildren = ancestors.enumerated().map { index, ancestorKind in
            if let ancestorTemplate = templateCache[ancestorKind.rawValue] {
                return buildAncestorTemplateNode(ancestorTemplate, index: index, parentName: templateName)
            } else {
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

    func buildAncestorTemplateNode(_ template: TemplateMetadata, index: Int, parentName: String) -> TreeNode {
        var children: [TreeNode] = []

        let ancestorTemplateName = "ancestor-\(parentName)-\(index)"
        let ancestorProps = buildPropertiesNode(for: template, idPrefix: ancestorTemplateName)
        children.append(ancestorProps)

        if let nestedAncestors = template.ancestors, !nestedAncestors.isEmpty {
            let nestedNode = buildAncestorsNode(ancestors: nestedAncestors, templateName: ancestorTemplateName)
            children.append(nestedNode)
        }

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

    func buildOptionsNode(options: [TemplateOptionJSON], templateName: String) -> TreeNode {
        let optionChildren = options.enumerated().map { index, option in
            TreeNode(
                id: "option-\(templateName)-\(index)",
                type: .option(option),
                label: option.name,
                icon: "slider.horizontal.3",
                children: optionDetailNodes(option: option, templateName: templateName, index: index)
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

    func optionDetailNodes(option: TemplateOptionJSON, templateName: String, index: Int) -> [TreeNode] {
        var optionDetails: [TreeNode] = [
            TreeNode(
                id: "option-\(templateName)-\(index)-type",
                type: .property(key: "Type", value: option.type),
                label: "Type: \(option.type)",
                icon: "doc.text"
            ),
            TreeNode(
                id: "option-\(templateName)-\(index)-identifier",
                type: .property(key: "Identifier", value: option.identifier),
                label: "Identifier: \(option.identifier)",
                icon: "number"
            ),
            TreeNode(
                id: "option-\(templateName)-\(index)-default",
                type: .property(key: "Default Value", value: option.defaultValue),
                label: "Default: \(option.defaultValue)",
                icon: "checkmark.circle"
            ),
        ]

        if let choices = option.choices, !choices.isEmpty {
            optionDetails.append(optionChoicesNode(
                choices: choices,
                templateName: templateName,
                optionIndex: index
            ))
        }

        return optionDetails
    }

    func optionChoicesNode(choices: [String], templateName: String, optionIndex: Int) -> TreeNode {
        TreeNode(
            id: "option-\(templateName)-\(optionIndex)-choices",
            type: .section(name: "Choices"),
            label: "Choices (\(choices.count))",
            icon: "list.bullet",
            children: choices.enumerated().map { choiceIndex, choice in
                TreeNode(
                    id: "option-\(templateName)-\(optionIndex)-choice-\(choiceIndex)",
                    type: .value(choice),
                    label: choice,
                    icon: "circle.fill"
                )
            }
        )
    }

    func buildFileStructureNode(files: [FileNode], templateName: String) -> TreeNode {
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

    func buildFileNode(file: FileNode, templateName: String, index: Int) -> TreeNode {
        let children: [TreeNode]
        if let fileChildren = file.children, !fileChildren.isEmpty {
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
}

// MARK: - Filtering & Utilities

private extension TemplateTreeModel {
    func refreshCaches() {
        cachedExpandableIDs = collectIDs(from: rootNodes)
        filteredNodeCache.removeAll()
        nodeLookup = [:]
        indexNodes(rootNodes)
        fullyExpandedFlattenCache = flattenNodes(
            roots: rootNodes,
            expandedIDs: cachedExpandableIDs,
            autoExpandAll: true
        )
    }

    func collectIDs(from nodes: [TreeNode]) -> Set<String> {
        var ids = Set<String>()
        func walk(_ nodes: [TreeNode]) {
            for node in nodes where !node.children.isEmpty {
                ids.insert(node.id)
                walk(node.children)
            }
        }
        walk(nodes)
        return ids
    }

    func flattenNodes(
        roots: [TreeNode],
        expandedIDs: Set<String>,
        autoExpandAll: Bool
    ) -> [FlattenedNode] {
        var result: [FlattenedNode] = []

        func appendNodes(_ nodes: [TreeNode], level: Int) {
            for node in nodes {
                result.append(FlattenedNode(node: node, level: level))
                let shouldExpand = autoExpandAll || expandedIDs.contains(node.id)
                if shouldExpand {
                    appendNodes(node.children, level: level + 1)
                }
            }
        }

        appendNodes(roots, level: 0)
        return result
    }

    func filterNode(_ node: TreeNode, searchText: String) -> TreeNode? {
        let matches = node.label.localizedCaseInsensitiveContains(searchText)
            || (node.subtitle?.localizedCaseInsensitiveContains(searchText) ?? false)
        let filteredChildren = node.children.compactMap { filterNode($0, searchText: searchText) }

        if matches || !filteredChildren.isEmpty {
            return TreeNode(
                id: node.id,
                type: node.type,
                label: node.label,
                subtitle: node.subtitle,
                icon: node.icon,
                children: filteredChildren
            )
        }

        return nil
    }

    func usingFullRootSet(_ nodes: [TreeNode]) -> Bool {
        guard nodes.count == rootNodes.count else { return false }
        return zip(nodes, rootNodes).allSatisfy { $0.id == $1.id }
    }

    func normalizedSearchKey(for text: String) -> String {
        text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }

    func indexNodes(_ nodes: [TreeNode]) {
        for node in nodes {
            nodeLookup[node.id] = node
            if !node.children.isEmpty {
                indexNodes(node.children)
            }
        }
    }
}

// MARK: - Icons

private extension TemplateTreeModel {
    func iconForCategory(_ category: TemplateCategory) -> String {
        switch category {
        case .projectTemplates: return "folder.fill"
        case .fileTemplates: return "doc.fill"
        case .packageTemplates: return "shippingbox.fill"
        }
    }

    func iconForTemplate(_ template: TemplateMetadata) -> String {
        if template.kind.isBaseTemplate {
            return "cube"
        }
        switch template.kind.category {
        case .projectTemplates: return "app.fill"
        case .fileTemplates: return "doc.text"
        case .packageTemplates: return "shippingbox"
        }
    }

    func iconForFile(_ name: String) -> String {
        let ext = (name as NSString).pathExtension.lowercased()
        switch ext {
        case "swift": return "swift"
        case "h", "m", "mm": return "doc.text"
        case "plist": return "list.bullet"
        case "json": return "curlybraces"
        default: return "doc"
        }
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
