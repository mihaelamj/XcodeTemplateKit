import SwiftUI
import TemplateParser

/// Displays a single template with expandable details.
///
/// Shows template name, kind, file count, and expandable sections for:
/// - Properties (kind, identifier, category, ancestors)
/// - File Structure (recursive tree)
/// - Options (template configuration options)
///
/// ## Example
/// ```swift
/// ForEach(templates) { template in
///     TemplateRow(template: template)
/// }
/// ```
struct TemplateRow: View {
    let template: TemplateMetadata
    @State private var isExpanded = false

    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            templateDetails
        } label: {
            HStack {
                Image(systemName: template.kind.isBaseTemplate ? "cube" : "app.fill")
                    .foregroundStyle(template.kind.isBaseTemplate ? .secondary : Color.blue)

                VStack(alignment: .leading, spacing: 2) {
                    Text(template.name)
                        .font(.body)

                    Text(template.kind.displayName)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                if let fileCount = template.fileStructure?.count, fileCount > 0 {
                    Label("\(fileCount)", systemImage: "doc")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    @ViewBuilder
    private var templateDetails: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Properties
            GroupBox("Properties") {
                VStack(alignment: .leading, spacing: 8) {
                    PropertyRow(label: "Kind", value: template.kind.displayName)
                    PropertyRow(label: "Identifier", value: template.identifier)
                    PropertyRow(label: "Category", value: template.kind.category.displayName)

                    if let ancestors = template.ancestors, !ancestors.isEmpty {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Ancestors:")
                                .font(.caption)
                                .foregroundStyle(.secondary)

                            ForEach(ancestors.indices, id: \.self) { index in
                                HStack {
                                    Image(systemName: "arrow.turn.down.right")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                    Text(ancestors[index].displayName)
                                        .font(.caption)
                                }
                                .padding(.leading, 8)
                            }
                        }
                    }
                }
                .padding(8)
            }

            // File Structure
            if let fileStructure = template.fileStructure, !fileStructure.isEmpty {
                GroupBox("File Structure (\(fileStructure.count) items)") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(fileStructure.indices, id: \.self) { index in
                            FileNodeView(node: fileStructure[index], level: 0)
                        }
                    }
                    .padding(8)
                }
            }

            // Options
            if !template.options.isEmpty {
                GroupBox("Options (\(template.options.count))") {
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(template.options.indices, id: \.self) { index in
                            let option = template.options[index]
                            HStack {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(option.name)
                                    .font(.caption)
                                Spacer()
                                Text(option.defaultValue)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(8)
                }
            }
        }
        .padding(.leading, 20)
    }
}
