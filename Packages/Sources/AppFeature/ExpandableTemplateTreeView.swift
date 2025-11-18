import SwiftUI
import TemplateParser

/// Fully expandable tree view for templates with dynamic font sizing.
///
/// This view displays templates as a hierarchical tree where EVERYTHING can be expanded:
/// - Categories
/// - Templates
/// - Properties
/// - Ancestors (with their full property trees)
/// - Options (with choices)
/// - File Structure
///
/// Supports Cmd+Plus/Minus (macOS) and Ctrl+Plus/Minus (iPadOS) for dynamic font scaling.
///
/// Uses @Observable model (iOS 17+) for efficient updates - only updates when properties
/// read by body actually change.
struct ExpandableTemplateTreeView: View {
    var treeModel: TemplateTreeModel // No property wrapper needed with @Observable
    @Binding var selectedNodeID: String?
    @State private var fontSize: CGFloat = 13
    @State private var searchText: String = ""
    @FocusState private var isFocused: Bool

    init(treeModel: TemplateTreeModel, selectedNodeID: Binding<String?>) {
        self.treeModel = treeModel
        _selectedNodeID = selectedNodeID
    }

    var filteredNodes: [TreeNode] {
        if searchText.isEmpty {
            return treeModel.rootNodes
        }

        let filtered = treeModel.rootNodes.map { filterNode($0) }.compactMap { $0 }

        // Auto-expand all nodes when searching
        expandAllNodes(filtered)

        return filtered
    }

    private func filterNode(_ node: TreeNode) -> TreeNode? {
        let matchesSearch = node.label.localizedCaseInsensitiveContains(searchText)
        let filteredChildren = node.children.map { filterNode($0) }.compactMap { $0 }

        if matchesSearch || !filteredChildren.isEmpty {
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

    private func expandAllNodes(_ nodes: [TreeNode]) {
        for node in nodes where !node.children.isEmpty {
            treeModel.expandedNodes.insert(node.id)
            expandAllNodes(node.children)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                TextField("Search", text: $searchText)
                    .textFieldStyle(.plain)
                if !searchText.isEmpty {
                    Button(action: { searchText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(8)
            .background(Color(nsColor: .controlBackgroundColor))

            Divider()

            List(selection: $selectedNodeID) {
                ForEach(filteredNodes) { node in
                    TreeNodeView(
                        node: node,
                        treeModel: treeModel,
                        fontSize: fontSize
                    )
                }
            }
            .listStyle(.sidebar)
            .focused($isFocused)
        }
        .navigationTitle("Templates")
        .onAppear {
            isFocused = true
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: { treeModel.expandAll() }) {
                    Label("Expand All", systemImage: "arrow.down.right.and.arrow.up.left")
                }

                Button(action: { treeModel.collapseAll() }) {
                    Label("Collapse All", systemImage: "arrow.up.left.and.arrow.down.right")
                }

                #if os(macOS) || os(iOS)
                Divider()

                Button(action: { increaseFontSize() }) {
                    Label("Increase Font Size", systemImage: "textformat.size.larger")
                }
                #if os(macOS)
                .keyboardShortcut("+", modifiers: .command)
                #else
                .keyboardShortcut("+", modifiers: .control)
                #endif

                Button(action: { decreaseFontSize() }) {
                    Label("Decrease Font Size", systemImage: "textformat.size.smaller")
                }
                #if os(macOS)
                .keyboardShortcut("-", modifiers: .command)
                #else
                .keyboardShortcut("-", modifiers: .control)
                #endif

                Button(action: { resetFontSize() }) {
                    Label("Reset Font Size", systemImage: "textformat.size")
                }
                #if os(macOS)
                .keyboardShortcut("0", modifiers: .command)
                #else
                .keyboardShortcut("0", modifiers: .control)
                #endif
                #endif
            }
        }
    }

    private func increaseFontSize() {
        fontSize = min(fontSize + 2, 24)
    }

    private func decreaseFontSize() {
        fontSize = max(fontSize - 2, 9)
    }

    private func resetFontSize() {
        fontSize = 13
    }
}

// MARK: - Tree Node View

struct TreeNodeView: View {
    let node: TreeNode
    var treeModel: TemplateTreeModel // No property wrapper needed with @Observable
    let fontSize: CGFloat

    var body: some View {
        if node.children.isEmpty {
            // Leaf node
            LeafNodeRow(node: node, fontSize: fontSize)
                .tag(node.id)
        } else {
            // Expandable node
            DisclosureGroup(
                isExpanded: Binding(
                    get: { treeModel.isExpanded(node.id) },
                    set: { _ in
                        withAnimation(.smooth(duration: 0.25)) {
                            treeModel.toggleExpansion(for: node.id)
                        }
                    }
                )
            ) {
                ForEach(node.children) { child in
                    TreeNodeView(
                        node: child,
                        treeModel: treeModel,
                        fontSize: fontSize
                    )
                }
            } label: {
                NodeLabel(node: node, fontSize: fontSize)
            }
            .animation(nil, value: treeModel.isExpanded(node.id)) // Prevent jumping
            .tag(node.id)
        }
    }
}

// MARK: - Node Label

struct NodeLabel: View {
    let node: TreeNode
    let fontSize: CGFloat

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: node.icon)
                .foregroundStyle(colorForNode(node))
                .font(.system(size: fontSize - 1))
                .frame(width: fontSize + 4)

            VStack(alignment: .leading, spacing: 2) {
                Text(node.label)
                    .font(.system(size: fontSize))
                    .lineLimit(1)

                if let subtitle = node.subtitle {
                    Text(subtitle)
                        .font(.system(size: fontSize - 2))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
        }
        .frame(minHeight: 28) // Ensure adequate tap target height
        .padding(.vertical, 4) // Additional padding for better touch area
        .contentShape(Rectangle()) // Make entire row tappable
    }

    private func colorForNode(_ node: TreeNode) -> Color {
        switch node.type {
        case .category(let category):
            switch category {
            case .projectTemplates: return .blue
            case .fileTemplates: return .orange
            case .packageTemplates: return .green
            }

        case .template(let template), .ancestorTemplate(let template):
            if template.kind.isBaseTemplate {
                return .purple
            }
            switch template.kind.category {
            case .projectTemplates: return .blue
            case .fileTemplates: return .orange
            case .packageTemplates: return .green
            }

        case .ancestor:
            return .purple

        case .section:
            return .secondary

        case .property:
            return .gray

        case .option:
            return .cyan

        case .file(let fileNode):
            return fileNode.isDirectory ? .blue : .gray

        case .value:
            return .secondary
        }
    }
}

// MARK: - Leaf Node Row

struct LeafNodeRow: View {
    let node: TreeNode
    let fontSize: CGFloat

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: node.icon)
                .foregroundStyle(colorForNode(node))
                .font(.system(size: fontSize - 1))
                .frame(width: fontSize + 4)

            Text(node.label)
                .font(.system(size: fontSize))
                .lineLimit(2)
        }
        .frame(minHeight: 28) // Ensure adequate tap target height
        .padding(.vertical, 4) // Additional padding for better touch area
        .contentShape(Rectangle()) // Make entire row tappable
    }

    private func colorForNode(_ node: TreeNode) -> Color {
        switch node.type {
        case .property:
            return .gray
        case .file(let fileNode):
            return fileNode.isDirectory ? .blue : .gray
        case .value:
            return .secondary
        default:
            return .primary
        }
    }
}
