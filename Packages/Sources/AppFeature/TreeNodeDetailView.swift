import SwiftUI
import TemplateParser

/// Detail view that shows rich information about the selected tree node.
/// Styled like Xcode's Inspector panel with tabbed interface.
///
/// ## SwiftLint Exceptions
///
/// This view exceeds normal size limits due to comprehensive template inspection UI:
/// - **type_body_length**: Contains multiple inspector tabs (Attributes, Documentation, Examples)
///   with detailed views for categories, templates, properties, options, and files. Each tab needs
///   its own rendering logic and helper views.
/// - **function_body_length**: `templateDetail` displays Form with multiple sections for template
///   metadata (Overview, Identification, Location, Metadata, Inheritance, Customization, File Structure).
///   Splitting would break SwiftUI Form coherence and make the UI harder to maintain.
///
/// These violations are necessary for a complete, Xcode-style inspector interface.
// swiftlint:disable type_body_length
struct TreeNodeDetailView: View {
    let node: TreeNode?
    @State private var selectedTab: InspectorTab = .attributes

    enum InspectorTab: String, CaseIterable {
        case attributes = "Attributes"
        case documentation = "Documentation"
        case examples = "Examples"

        var icon: String {
            switch self {
            case .attributes: return "list.bullet.rectangle"
            case .documentation: return "doc.text"
            case .examples: return "curlybraces"
            }
        }
    }

    var body: some View {
        if let node {
            VStack(spacing: 0) {
                // Inspector header
                HStack {
                    Image(systemName: node.icon)
                        .foregroundStyle(.secondary)
                    Text(node.label)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .background(Color(nsColor: .controlBackgroundColor))

                Divider()

                // Tab bar
                HStack(spacing: 0) {
                    ForEach(InspectorTab.allCases, id: \.self) { tab in
                        Button(action: { selectedTab = tab }) {
                            VStack(spacing: 4) {
                                Image(systemName: tab.icon)
                                    .font(.system(size: 16))
                                Text(tab.rawValue)
                                    .font(.system(size: 10))
                            }
                            .frame(maxWidth: .infinity, minHeight: 44) // Minimum 44pt tap target
                            .padding(.vertical, 12) // Increased padding for better tap area
                            .background(selectedTab == tab ? Color.accentColor.opacity(0.1) : Color.clear)
                            .foregroundStyle(selectedTab == tab ? .primary : .secondary)
                            .contentShape(Rectangle()) // Ensure entire frame is tappable
                        }
                        .buttonStyle(.plain)
                    }
                }
                .background(Color(nsColor: .controlBackgroundColor))

                Divider()

                // Tab content
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        switch selectedTab {
                        case .attributes:
                            nodeDetailContent(for: node)
                        case .documentation:
                            documentationContent(for: node)
                        case .examples:
                            examplesContent(for: node)
                        }
                    }
                }
            }
        } else {
            ContentUnavailableView {
                Label("No Selection", systemImage: "sidebar.left")
            } description: {
                Text("Select an item from the sidebar to view its details")
            }
        }
    }

    @ViewBuilder
    private func nodeDetailContent(for node: TreeNode) -> some View {
        switch node.type {
        case .category(let category):
            categoryDetail(category)

        case .template(let template), .ancestorTemplate(let template):
            templateDetail(template)

        case .ancestor(let kind):
            ancestorDetail(kind)

        case .section(let name):
            sectionDetail(name)

        case .property(let key, let value):
            propertyDetail(key: key, value: value)

        case .option(let option):
            optionDetail(option)

        case .file(let fileNode):
            fileDetail(fileNode)

        case .value(let value):
            valueDetail(value)
        }
    }

    // MARK: - Detail Views

    private func categoryDetail(_ category: TemplateCategory) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Category") {
                InspectorRow(label: "Type", value: category.displayName)
                InspectorRow(label: "Description", value: "Contains project, file, or package templates")
            }
        }
    }

    // swiftlint:disable:next function_body_length
    private func templateDetail(_ template: TemplateMetadata) -> some View {
        Form {
            Section("Overview") {
                LabeledContent {
                    HStack {
                        Text(template.name)
                        Spacer()
                        Image(systemName: "textformat")
                            .font(.system(size: 9))
                            .foregroundStyle(.tertiary)
                        Text("String")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundStyle(.tertiary)
                    }
                } label: {
                    Text("Name")
                }

                LabeledContent {
                    HStack {
                        Text(template.kind.displayName)
                        Spacer()
                        Image(systemName: "tag")
                            .font(.system(size: 9))
                            .foregroundStyle(.tertiary)
                        Text("TemplateKind")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundStyle(.tertiary)
                    }
                } label: {
                    Text("Kind")
                }

                LabeledContent {
                    HStack {
                        Text(template.kind.category.displayName)
                        Spacer()
                        Image(systemName: "tag")
                            .font(.system(size: 9))
                            .foregroundStyle(.tertiary)
                        Text("TemplateCategory")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundStyle(.tertiary)
                    }
                } label: {
                    Text("Category")
                }
            }

            Section("Identification") {
                LabeledContent {
                    HStack {
                        Text(template.identifier)
                            .textSelection(.enabled)
                            .font(.system(.body, design: .monospaced))
                        Spacer()
                        Image(systemName: "textformat")
                            .font(.system(size: 9))
                            .foregroundStyle(.tertiary)
                        Text("String")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundStyle(.tertiary)
                    }
                } label: {
                    Text("Identifier")
                }
            }

            Section("Location") {
                LabeledContent {
                    HStack {
                        Text(template.path)
                            .textSelection(.enabled)
                            .font(.system(.caption, design: .monospaced))
                        Spacer()
                        Image(systemName: "textformat")
                            .font(.system(size: 9))
                            .foregroundStyle(.tertiary)
                        Text("String")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundStyle(.tertiary)
                    }
                } label: {
                    Text("Path")
                }
            }

            Section("Metadata") {
                LabeledContent {
                    HStack {
                        Text("\(template.totalCombinations)")
                        Spacer()
                        Image(systemName: "number")
                            .font(.system(size: 9))
                            .foregroundStyle(.tertiary)
                        Text("Integer")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundStyle(.tertiary)
                    }
                } label: {
                    Text("Total Combinations")
                }

                LabeledContent {
                    HStack {
                        Text(template.kind.isBaseTemplate ? "Yes" : "No")
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 9))
                            .foregroundStyle(.tertiary)
                        Text("Boolean")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundStyle(.tertiary)
                    }
                } label: {
                    Text("Is Base Template")
                }

                if template.kind.isUtilityTemplate {
                    LabeledContent {
                        HStack {
                            Text("Yes")
                            Spacer()
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 9))
                                .foregroundStyle(.tertiary)
                            Text("Boolean")
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundStyle(.tertiary)
                        }
                    } label: {
                        Text("Is Utility Template")
                    }
                }
            }

            if let ancestors = template.ancestors, !ancestors.isEmpty {
                Section("Inheritance") {
                    LabeledContent {
                        HStack {
                            Text("\(ancestors.count)")
                            Spacer()
                            Image(systemName: "number")
                                .font(.system(size: 9))
                                .foregroundStyle(.tertiary)
                            Text("Integer")
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundStyle(.tertiary)
                        }
                    } label: {
                        Text("Ancestor Count")
                    }
                    Text("This template inherits properties, options, and build settings from \(ancestors.count) base template(s).")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            if !template.options.isEmpty {
                Section("Customization") {
                    LabeledContent {
                        HStack {
                            Text("\(template.options.count)")
                            Spacer()
                            Image(systemName: "number")
                                .font(.system(size: 9))
                                .foregroundStyle(.tertiary)
                            Text("Integer")
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundStyle(.tertiary)
                        }
                    } label: {
                        Text("Option Count")
                    }
                    Text("This template provides \(template.options.count) configuration option(s) when creating a new project.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            if let fileStructure = template.fileStructure, !fileStructure.isEmpty {
                Section("File Structure") {
                    LabeledContent {
                        HStack {
                            Text("\(fileStructure.count)")
                            Spacer()
                            Image(systemName: "number")
                                .font(.system(size: 9))
                                .foregroundStyle(.tertiary)
                            Text("Integer")
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundStyle(.tertiary)
                        }
                    } label: {
                        Text("Root Files/Folders")
                    }
                    Text("This template will create \(fileStructure.count) root-level file(s) and/or folder(s).")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .formStyle(.grouped)
    }

    private func ancestorDetail(_ kind: TemplateKind) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Ancestor Template", systemImage: "arrow.turn.down.right")
                .font(.title3)
                .fontWeight(.semibold)

            Text(kind.displayName)
                .font(.title2)

            Text("Identifier: \(kind.rawValue)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)

            Divider()

            Text("This is a base template that provides inherited properties and build settings.")
                .foregroundStyle(.secondary)
        }
    }

    private func sectionDetail(_ name: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(name, systemImage: "folder")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Expand this section to view all \(name.lowercased()).")
                .foregroundStyle(.secondary)
        }
    }

    private func propertyDetail(key: String, value: String) -> some View {
        let propertyType = PropertyTypeResolver.resolve(key: key, value: value, node: TreeNode(id: "", type: .property(key: key, value: value), label: "", icon: ""))

        return VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Property") {
                InspectorRow(label: "Key", value: key, typeIcon: "key")
                InspectorRow(label: "Value", value: value, selectable: true)
                InspectorRow(label: "Type", value: propertyType.displayName, typeIcon: propertyType.icon)
            }

            // Show type description
            InspectorSection(title: "Type Description") {
                Text(propertyType.description)
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
            }

            // Show possible values
            if !propertyType.possibleValues.isEmpty {
                InspectorSection(title: "Possible Values") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(propertyType.possibleValues, id: \.self) { possibleValue in
                            Text(possibleValue)
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundStyle(possibleValue.contains(":") ? .primary : .secondary)
                                .padding(.vertical, 2)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                }
            }
        }
    }

    private func optionDetail(_ option: TemplateOptionJSON) -> some View {
        Form {
            Section("Option Details") {
                LabeledContent("Name", value: option.name)
                LabeledContent("Type", value: option.type)
                LabeledContent("Identifier", value: option.identifier)
                LabeledContent("Default Value", value: option.defaultValue)
            }

            if let choices = option.choices, !choices.isEmpty {
                Section("Available Choices (\(choices.count))") {
                    ForEach(choices, id: \.self) { choice in
                        Text(choice)
                    }
                }
            }

            Section("Description") {
                Text(
                    """
                    This option allows users to customize the template when creating a new project. \
                    The value can be selected from predefined choices or entered as text, depending on the option type.
                    """
                )
                .font(.caption)
                .foregroundStyle(.secondary)
            }
        }
        .formStyle(.grouped)
    }

    private func fileDetail(_ fileNode: FileNode) -> some View {
        Form {
            Section("File Information") {
                LabeledContent("Name", value: fileNode.name)
                LabeledContent("Type", value: fileNode.isDirectory ? "Directory" : "File")
                LabeledContent("Path") {
                    Text(fileNode.path)
                        .textSelection(.enabled)
                        .font(.system(.caption, design: .monospaced))
                }
            }

            Section("Description") {
                if fileNode.isDirectory {
                    Text("This is a directory that will be created when instantiating the template.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                } else {
                    Text(
                        "This is a file that will be created when instantiating the template. The file may contain template variables that will be substituted with actual values."
                    )
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
            }
        }
        .formStyle(.grouped)
    }

    private func valueDetail(_ value: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Value") {
                Text(value)
                    .textSelection(.enabled)
                    .padding(.vertical, 8)
            }
        }
    }

    // MARK: - Type Icon Helper

    private func typeIcon(for key: String) -> String {
        switch key.lowercased() {
        case "name", "kind", "identifier", "category", "path":
            return "textformat" // String
        case "total combinations", "ancestor count", "option count":
            return "number" // Int
        case "is base template", "is utility template":
            return "checkmark.circle" // Bool
        case "ancestors", "options", "choices":
            return "list.bullet" // Array
        case "file structure":
            return "folder" // Array of files
        default:
            return "questionmark.circle" // Unknown
        }
    }

    // MARK: - Documentation Tab

    @ViewBuilder
    private func documentationContent(for node: TreeNode) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            switch node.type {
            case .template(let template), .ancestorTemplate(let template):
                templateDocumentation(template)
            case .option(let option):
                optionDocumentation(option)
            case .property(let key, let value):
                propertyDocumentation(key: key, value: value)
            case .category(let category):
                categoryDocumentation(category)
            default:
                InspectorSection(title: "Description") {
                    Text("No documentation available for this item type.")
                        .foregroundStyle(.secondary)
                        .padding(.vertical, 8)
                }
            }
        }
    }

    private func templateDocumentation(_ template: TemplateMetadata) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Overview") {
                CopyableText(text: """
                Template: \(template.name)
                Type: \(template.kind.displayName)
                Category: \(template.kind.category.displayName)

                This is an Xcode template that creates a new \(template.kind.displayName.lowercased()) \
                when instantiated. Templates can include source files, build settings, and configuration options.
                """)
            }

            if let ancestors = template.ancestors, !ancestors.isEmpty {
                InspectorSection(title: "Inheritance") {
                    CopyableText(text: """
                    This template inherits from \(ancestors.count) base template(s):
                    \(ancestors.map { "• " + $0.displayName }.joined(separator: "\n"))

                    Inherited properties and build settings are merged with this template's configuration.
                    """)
                }
            }

            InspectorSection(title: "Usage") {
                CopyableText(text: """
                To use this template:
                1. Open Xcode
                2. Go to File → New → \(template.kind.category == .projectTemplates ? "Project..." : template.kind.category == .fileTemplates ? "File..." : "Package...")
                3. Select "\(template.name)" from the template chooser
                \(template.options.isEmpty ? "" : "4. Configure the available options")
                """)
            }
        }
    }

    private func optionDocumentation(_ option: TemplateOptionJSON) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Description") {
                CopyableText(text: """
                Option: \(option.name)
                Type: \(option.type)
                Default: \(option.defaultValue)

                This option allows customization of the template when creating a new instance. \
                The value will be used to configure various aspects of the generated project or file.
                """)
            }

            if let choices = option.choices, !choices.isEmpty {
                InspectorSection(title: "Available Choices") {
                    CopyableText(text: choices.map { "• " + $0 }.joined(separator: "\n"))
                }
            }
        }
    }

    private func propertyDocumentation(key: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Property Information") {
                CopyableText(text: """
                Key: \(key)
                Value: \(value)

                This property is part of the template's metadata and helps define its characteristics \
                and behavior within Xcode's template system.
                """)
            }
        }
    }

    private func categoryDocumentation(_ category: TemplateCategory) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Category Description") {
                CopyableText(text: """
                \(category.displayName)

                This category contains templates for creating \(category == .projectTemplates ? "new projects" : category == .fileTemplates ? "new files" : "new Swift packages"). \
                Each template in this category provides a starting point with preconfigured files, build settings, and project structure.
                """)
            }
        }
    }

    // MARK: - Examples Tab

    @ViewBuilder
    private func examplesContent(for node: TreeNode) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            switch node.type {
            case .template(let template), .ancestorTemplate(let template):
                templateExamples(template)
            case .option(let option):
                optionExamples(option)
            default:
                InspectorSection(title: "Examples") {
                    Text("No code examples available for this item type.")
                        .foregroundStyle(.secondary)
                        .padding(.vertical, 8)
                }
            }
        }
    }

    private func templateExamples(_ template: TemplateMetadata) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Template Definition Example") {
                CodeBlock(code: """
                {
                  "name": "\(template.name)",
                  "identifier": "\(template.identifier)",
                  "kind": "\(template.kind.rawValue)",
                  "category": "\(template.kind.category.rawValue)",
                  "totalCombinations": \(template.totalCombinations)\(template.ancestors?
                    .isEmpty == false ? ",\n  \"ancestors\": [\n    \(template.ancestors!.map { "\"\($0.rawValue)\"" }.joined(separator: ",\n    "))\n  ]" : "")
                }
                """)
            }

            if !template.options.isEmpty {
                InspectorSection(title: "Options Usage Example") {
                    CodeBlock(code: """
                    // Example of programmatically accessing template options:
                    let template = TemplateMetadata(/* ... */)

                    for option in template.options {
                        print("Option: \\(option.name)")
                        print("Default: \\(option.defaultValue)")
                        if let choices = option.choices {
                            print("Choices: \\(choices.joined(separator: ", "))")
                        }
                    }
                    """)
                }
            }

            if let fileStructure = template.fileStructure, !fileStructure.isEmpty {
                InspectorSection(title: "File Structure Example") {
                    CodeBlock(code: """
                    // Files created by this template:
                    \(fileStructure.prefix(5).map { "\(String(repeating: "  ", count: $0.path.components(separatedBy: "/").count - 1))└─ \($0.name)\($0.isDirectory ? "/" : "")" }
                        .joined(separator: "\n"))\(fileStructure.count > 5 ? "\n  ... and \(fileStructure.count - 5) more" : "")
                    """)
                }
            }

            if let rawContent = template.rawContent {
                InspectorSection(title: "TemplateInfo.plist (\(template.rawContentType?.uppercased() ?? "RAW"))") {
                    CodeBlock(code: rawContent, language: template.rawContentType)
                }
            }
        }
    }

    private func optionExamples(_ option: TemplateOptionJSON) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            InspectorSection(title: "Option Definition") {
                CodeBlock(code: """
                {
                  "name": "\(option.name)",
                  "type": "\(option.type)",
                  "identifier": "\(option.identifier)",
                  "defaultValue": "\(option.defaultValue)"\(option.choices?
                    .isEmpty == false ? ",\n  \"choices\": [\n    \(option.choices!.map { "\"\($0)\"" }.joined(separator: ",\n    "))\n  ]" : "")
                }
                """)
            }

            InspectorSection(title: "Swift Usage Example") {
                CodeBlock(code: """
                // Reading option value:
                let \(option.identifier.replacingOccurrences(of: ".", with: "_")) = "\(option.defaultValue)"

                // Using in template logic:
                if \(option.identifier.replacingOccurrences(of: ".", with: "_")) == "\(option.defaultValue)" {
                    // Configure for default option
                }
                """)
            }
        }
    }
}

// MARK: - Inspector Components

struct InspectorSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(.secondary)
                .textCase(.uppercase)
                .padding(.horizontal, 12)
                .padding(.top, 16)
                .padding(.bottom, 6)

            VStack(alignment: .leading, spacing: 0) {
                content
            }
            .background(Color(nsColor: .controlBackgroundColor))
            .cornerRadius(6)
            .padding(.horizontal, 12)
        }
    }
}

struct InspectorRow: View {
    let label: String
    let value: String
    var typeIcon: String?
    var selectable: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                if let icon = typeIcon {
                    Image(systemName: icon)
                        .font(.system(size: 9))
                        .foregroundStyle(.tertiary)
                }
                Text(label)
                    .font(.system(size: 11))
                    .foregroundStyle(.secondary)
            }

            if selectable {
                Text(value)
                    .font(.system(size: 13))
                    .textSelection(.enabled)
            } else {
                Text(value)
                    .font(.system(size: 13))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }
}

// MARK: - Copyable Components

struct CopyableText: View {
    let text: String
    @State private var showCopied = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(text)
                .font(.system(size: 13))
                .textSelection(.enabled)
                .padding(.vertical, 8)

            HStack {
                Spacer()
                Button(action: copyToClipboard) {
                    Label(showCopied ? "Copied!" : "Copy", systemImage: showCopied ? "checkmark" : "doc.on.doc")
                        .font(.system(size: 11))
                }
                .buttonStyle(.borderless)
            }
        }
        .padding(.horizontal, 12)
    }

    private func copyToClipboard() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
        showCopied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showCopied = false
        }
    }
}

struct CodeBlock: View {
    let code: String
    var language: String?
    @State private var showCopied = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: true) {
                Text(code)
                    .font(.custom("Menlo", size: 12)) // Use Xcode's default font
                    .lineSpacing(2) // Better readability
                    .textSelection(.enabled)
                    .padding(12)
            }
            .background(Color(nsColor: .textBackgroundColor))
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(nsColor: .separatorColor), lineWidth: 1)
            )

            HStack {
                Spacer()
                Button(action: copyToClipboard) {
                    Label(showCopied ? "Copied!" : "Copy Code", systemImage: showCopied ? "checkmark" : "doc.on.doc")
                        .font(.system(size: 11))
                }
                .buttonStyle(.borderless)
                .padding(.top, 4)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }

    private func copyToClipboard() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(code, forType: .string)
        showCopied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showCopied = false
        }
    }
}
