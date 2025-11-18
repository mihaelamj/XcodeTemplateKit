import SwiftUI
import TemplateParser

/// Displays template inventory organized by category.
///
/// Shows templates grouped into sections (Project Templates, Package Templates)
/// with expand/collapse functionality.
///
/// ## Example
/// ```swift
/// let inventory = try JSONDecoder().decode(TemplateInventory.self, from: data)
/// TemplateTreeView(inventory: inventory)
/// ```
struct TemplateTreeView: View {
    let inventory: TemplateInventory
    @Binding var selectedTemplatePath: String?
    @State private var expandedCategories: Set<String> = []
    @State private var expandedKinds: Set<String> = []

    var body: some View {
        List(selection: $selectedTemplatePath) {
            ForEach(groupedTemplates.sorted(by: { $0.key < $1.key }), id: \.key) { category, templates in
                Section {
                    ForEach(templates.sorted(by: { $0.name < $1.name })) { template in
                        Label {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(template.name)
                                    .font(.system(.body))
                                Text(template.kind.displayName)
                                    .font(.system(.caption))
                                    .foregroundStyle(.secondary)
                            }
                        } icon: {
                            Image(systemName: iconForTemplate(template))
                                .foregroundStyle(colorForCategory(category))
                        }
                        .tag(template.path)
                    }
                } header: {
                    HStack {
                        Image(systemName: folderIcon(for: category))
                            .foregroundStyle(colorForCategory(category))
                        Text(category)
                            .font(.headline)
                        Spacer()
                        Text("\(templates.count)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Templates")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Button("Expand All", systemImage: "chevron.down.circle") {
                        expandAll()
                    }
                    Button("Collapse All", systemImage: "chevron.up.circle") {
                        collapseAll()
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }

    private var groupedTemplates: [String: [TemplateMetadata]] {
        Dictionary(grouping: inventory.templates) { template in
            template.kind.category.displayName
        }
    }

    private func folderIcon(for category: String) -> String {
        switch category {
        case "Project Templates": return "folder.fill"
        case "File Templates": return "doc.fill"
        case "Package Templates": return "shippingbox.fill"
        default: return "folder"
        }
    }

    private func iconForTemplate(_ template: TemplateMetadata) -> String {
        let category = template.kind.category
        switch category {
        case .projectTemplates:
            if template.kind.isBaseTemplate {
                return "cube"
            }
            return "app.fill"
        case .fileTemplates:
            return "doc.text"
        case .packageTemplates:
            return "shippingbox"
        }
    }

    private func colorForCategory(_ category: String) -> Color {
        switch category {
        case "Project Templates": return .blue
        case "File Templates": return .orange
        case "Package Templates": return .green
        default: return .gray
        }
    }

    private func expandAll() {
        expandedCategories = Set(groupedTemplates.keys)
        expandedKinds = Set(inventory.templates.map(\.kind.rawValue))
    }

    private func collapseAll() {
        expandedCategories.removeAll()
        expandedKinds.removeAll()
    }
}
