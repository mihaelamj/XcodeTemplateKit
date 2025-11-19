import SwiftUI
import TemplateModels

/// Displays a file or directory node in a recursive tree structure.
///
/// Shows file/folder icons based on type (Swift, folder, assets, etc.)
/// with color coding and expandable children for directories.
///
/// ## Example
/// ```swift
/// ForEach(fileNodes.indices, id: \.self) { index in
///     FileNodeView(node: fileNodes[index], level: 0)
/// }
/// ```
struct FileNodeView: View {
    let node: FileNode
    let level: Int
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Button {
                if node.isDirectory {
                    isExpanded.toggle()
                }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: nodeIcon)
                        .font(.caption)
                        .foregroundStyle(nodeColor)
                        .frame(width: 16)

                    Text(node.name)
                        .font(.caption.monospaced())
                        .foregroundStyle(.primary)

                    Spacer()

                    if node.isDirectory, let childCount = node.children?.count {
                        Text("\(childCount)")
                            .font(.caption2)
                            .foregroundStyle(.tertiary)
                    }
                }
                .padding(.leading, CGFloat(level * 16))
            }
            .buttonStyle(.plain)

            // Children
            if isExpanded, let children = node.children {
                ForEach(children.indices, id: \.self) { index in
                    FileNodeView(node: children[index], level: level + 1)
                }
            }
        }
    }

    private var nodeIcon: String {
        if node.isDirectory {
            return isExpanded ? "folder.fill" : "folder"
        } else if node.name.hasSuffix(".swift") {
            return "swift"
        } else if node.name.hasSuffix(".xcassets") {
            return "photo.on.rectangle"
        } else if node.name.hasSuffix(".xcdatamodeld") || node.name.hasSuffix(".xcdatamodel") {
            return "cylinder"
        } else if node.name.hasSuffix(".storyboard") || node.name.hasSuffix(".xib") {
            return "rectangle.stack"
        } else if node.name.hasSuffix(".json") {
            return "doc.text"
        } else {
            return "doc"
        }
    }

    private var nodeColor: Color {
        if node.isDirectory {
            return .blue
        } else if node.name.hasSuffix(".swift") {
            return .orange
        } else {
            return .secondary
        }
    }
}
