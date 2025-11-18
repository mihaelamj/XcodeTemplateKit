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
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                TextField("Search", text: $searchText)
                    .textFieldStyle(.plain)
                if !searchText.isEmpty {
                    Button(
                        action: { searchText = "" },
                        label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.secondary)
                        }
                    )
                    .buttonStyle(.plain)
                }
            }
            .padding(8)
            .background(Color(nsColor: .controlBackgroundColor))

            Divider()

            List(selection: $selectedNodeID) {
                ForEach(flattenedNodes) { item in
                    TreeOutlineRow(
                        node: item.node,
                        level: item.level,
                        fontSize: fontSize,
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
                Button(
                    action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            treeModel.expandedNodes = treeModel.allExpandableNodeIDs()
                        }
                    },
                    label: {
                        Label("Expand All", systemImage: "arrow.down.right.and.arrow.up.left")
                    }
                )

                Button(
                    action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            treeModel.collapseAll()
                        }
                    },
                    label: {
                        Label("Collapse All", systemImage: "arrow.up.left.and.arrow.down.right")
                    }
                )

                #if os(macOS) || os(iOS)
                Divider()

                Button(
                    action: { increaseFontSize() },
                    label: {
                        Label("Increase Font Size", systemImage: "textformat.size.larger")
                    }
                )
                #if os(macOS)
                .keyboardShortcut("+", modifiers: .command)
                #else
                .keyboardShortcut("+", modifiers: .control)
                #endif

                Button(
                    action: { decreaseFontSize() },
                    label: {
                        Label("Decrease Font Size", systemImage: "textformat.size.smaller")
                    }
                )
                #if os(macOS)
                .keyboardShortcut("-", modifiers: .command)
                #else
                .keyboardShortcut("-", modifiers: .control)
                #endif

                Button(
                    action: { resetFontSize() },
                    label: {
                        Label("Reset Font Size", systemImage: "textformat.size")
                    }
                )
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

// MARK: - Outline Row

struct TreeOutlineRow: View {
    let node: TreeNode
    let level: Int
    let fontSize: CGFloat
    let isExpanded: Bool
    let isSearching: Bool
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 6) {
            Color.clear
                .frame(width: CGFloat(level) * 14, height: 1)

            if node.children.isEmpty {
                Color.clear
                    .frame(width: 14, height: 1)
            } else {
                Button(
                    action: onToggle,
                    label: {
                        Image(systemName: "chevron.right")
                            .rotationEffect(.degrees(isExpanded ? 90 : 0))
                            .foregroundStyle(.secondary)
                            .frame(width: 14, height: 14)
                    }
                )
                .buttonStyle(.plain)
                .disabled(isSearching)
            }

            NodeLabel(node: node, fontSize: fontSize)
        }
        .frame(minHeight: 28) // Ensure adequate tap target height
        .padding(.vertical, 4) // Additional padding for better touch area
        .contentShape(Rectangle()) // Make entire row tappable
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
        .frame(minHeight: 28)
        .padding(.vertical, 4)
        .contentShape(Rectangle())
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
