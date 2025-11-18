import SwiftUI
import TemplateParser

/// Displays detailed information about a selected template.
struct TemplateDetailView: View {
    let template: TemplateMetadata

    var body: some View {
        Form {
            // Header Section
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text(template.name)
                        .font(.title2)
                        .fontWeight(.semibold)

                    HStack {
                        Label(template.kind.displayName, systemImage: iconForCategory())
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Spacer()

                        if template.kind.isBaseTemplate {
                            Label("Base Template", systemImage: "cube")
                                .font(.caption)
                                .foregroundStyle(.orange)
                        }
                    }
                }
            }

            // Identity Section
            Section("Identity") {
                LabeledContent("Name", value: template.name)
                LabeledContent("Kind", value: template.kind.displayName)
                LabeledContent("Identifier", value: template.identifier)
                LabeledContent("Category", value: template.kind.category.displayName)
            }

            // Path Section
            Section("Location") {
                LabeledContent("Path") {
                    Text(template.path)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .textSelection(.enabled)
                }
            }

            // Metadata Section
            Section("Metadata") {
                LabeledContent("Total Combinations", value: "\(template.totalCombinations)")
                LabeledContent("Is Base Template", value: template.kind.isBaseTemplate ? "Yes" : "No")
                if template.kind.isUtilityTemplate {
                    LabeledContent("Is Utility Template", value: "Yes")
                }
            }

            // Ancestors Section
            if let ancestors = template.ancestors, !ancestors.isEmpty {
                Section("Ancestors (\(ancestors.count))") {
                    ForEach(ancestors, id: \.rawValue) { ancestor in
                        LabeledContent {
                            Text(ancestor.displayName)
                        } label: {
                            Label(ancestor.rawValue, systemImage: "arrow.turn.down.right")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }

            // File Structure Section
            if let fileStructure = template.fileStructure, !fileStructure.isEmpty {
                Section("File Structure (\(fileStructure.count) items)") {
                    ForEach(fileStructure, id: \.path) { fileNode in
                        FileNodeRow(node: fileNode)
                    }
                }
            }

            // Options Section
            if !template.options.isEmpty {
                Section("Template Options (\(template.options.count))") {
                    ForEach(template.options, id: \.identifier) { option in
                        DisclosureGroup {
                            VStack(alignment: .leading, spacing: 8) {
                                LabeledContent("Type", value: option.type)
                                LabeledContent("Identifier", value: option.identifier)
                                LabeledContent("Default Value", value: option.defaultValue)

                                if let choices = option.choices, !choices.isEmpty {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Choices")
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                        ForEach(choices, id: \.self) { choice in
                                            HStack {
                                                Image(systemName: "circle.fill")
                                                    .font(.system(size: 4))
                                                    .foregroundStyle(.secondary)
                                                Text(choice)
                                                    .font(.caption)
                                            }
                                            .padding(.leading, 8)
                                        }
                                    }
                                }
                            }
                        } label: {
                            Label(option.name, systemImage: "slider.horizontal.3")
                        }
                    }
                }
            }
        }
        .formStyle(.grouped)
        .navigationTitle(template.name)
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }

    private func iconForCategory() -> String {
        switch template.kind.category {
        case .projectTemplates: return "app.fill"
        case .fileTemplates: return "doc.text"
        case .packageTemplates: return "shippingbox"
        }
    }
}

// MARK: - File Node Row

struct FileNodeRow: View {
    let node: FileNode

    var body: some View {
        HStack {
            Image(systemName: node.isDirectory ? "folder.fill" : iconForFile(node.name))
                .foregroundStyle(node.isDirectory ? .blue : .gray)
            Text(node.name)
                .font(.system(.body, design: .monospaced))
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
}
