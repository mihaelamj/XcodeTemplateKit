import SharedViews
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

    private var isSearching: Bool {
        !searchText.isEmpty
    }

    private var filteredRootNodes: [TreeNode] {
        if searchText.isEmpty {
            return treeModel.rootNodes
        }
        return treeModel.filteredNodes(matching: searchText)
    }

    private var flattenedNodes: [TemplateTreeModel.FlattenedNode] {
        let expandedIDs: Set<String>
        if isSearching {
            expandedIDs = treeModel.collectExpandableIDs(from: filteredRootNodes)
        } else {
            expandedIDs = treeModel.expandedNodes
        }
        return treeModel.flattenedNodes(
            roots: filteredRootNodes,
            expandedIDs: expandedIDs,
            autoExpandAll: isSearching
        )
    }

    var body: some View {
        VStack(spacing: 0) {
            OutlineSearchBar(text: $searchText)

            Divider()

            List(selection: $selectedNodeID) {
                ForEach(flattenedNodes) { item in
                    OutlineRowView(
                        configuration: rowConfiguration(for: item),
                        isExpanded: isSearching ? true : treeModel.isExpanded(item.node.id),
                        isSearching: isSearching,
                        onToggle: {
                            guard !isSearching else { return }
                            withAnimation(.smooth(duration: 0.25)) {
                                treeModel.toggleExpansion(for: item.node.id)
                            }
                        }
                    )
                    .tag(item.node.id)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedNodeID = item.node.id
                    }
                }
            }
            .listStyle(.sidebar)
            .environment(\.defaultMinListRowHeight, 28)
            .focused($isFocused)
        }
        .navigationTitle("Templates")
        .onAppear {
            isFocused = true
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                OutlineToolbar(
                    onExpandAll: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            treeModel.expandedNodes = treeModel.allExpandableNodeIDs()
                        }
                    },
                    onCollapseAll: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            treeModel.collapseAll()
                        }
                    },
                    onIncreaseFont: { increaseFontSize() },
                    onDecreaseFont: { decreaseFontSize() },
                    onResetFont: { resetFontSize() }
                )
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

private extension ExpandableTemplateTreeView {
    func rowConfiguration(for item: TemplateTreeModel.FlattenedNode) -> OutlineRowConfiguration {
        let node = item.node
        return OutlineRowConfiguration(
            id: node.id,
            level: item.level,
            hasChildren: !node.children.isEmpty,
            iconName: node.icon,
            iconColor: colorForNode(node),
            label: node.label,
            subtitle: node.subtitle,
            fontSize: fontSize
        )
    }

    func colorForNode(_ node: TreeNode) -> Color {
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
