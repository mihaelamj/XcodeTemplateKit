import Foundation

extension Template.Parser.Metadata {
    /// Parses Project Template Info.plist files
    public struct Project: Sendable {
        public init() {}

        /// Parse a TemplateInfo.plist file
        public func parse(plistPath: String) throws -> ProjectInfo {
            let url = URL(fileURLWithPath: plistPath)
            let data = try Data(contentsOf: url)

            let decoder = PropertyListDecoder()
            return try decoder.decode(ProjectInfo.self, from: data)
        }

        /// Find all project templates in a directory
        public func findProjectTemplates(in directory: String) -> [String] {
        var templates: [String] = []
        let fileManager = FileManager.default

        guard let enumerator = fileManager.enumerator(atPath: directory) else {
            return templates
        }

        for case let file as String in enumerator where file.hasSuffix(".xctemplate/TemplateInfo.plist") {
            let fullPath = "\(directory)/\(file)"
            templates.append(fullPath)
        }

            return templates
        }

        /// Load and resolve template inheritance
        public func loadWithAncestors(templatePath: String, allTemplates: [String: ProjectInfo]) throws -> ResolvedProjectTemplate {
        guard let templateInfo = allTemplates[templatePath] else {
            throw ParserError.templateNotFound(templatePath)
        }

        // Resolve ancestors
        var resolvedOptions: [TemplateOption] = templateInfo.options ?? []
        var resolvedNodes: [String] = templateInfo.nodes ?? []

        if let ancestors = templateInfo.ancestors {
            for ancestorKind in ancestors.reversed() {
                if let ancestor = allTemplates.values.first(where: { $0.kind == ancestorKind.templateKind }) {
                    // Merge ancestor options
                    if let ancestorOptions = ancestor.options {
                        resolvedOptions = mergeOptions(base: ancestorOptions, override: resolvedOptions)
                    }
                    // Merge ancestor nodes
                    if let ancestorNodes = ancestor.nodes {
                        resolvedNodes = ancestorNodes + resolvedNodes
                    }
                }
                }
            }

            return ResolvedProjectTemplate(
                info: templateInfo,
                options: resolvedOptions,
                nodes: resolvedNodes
            )
        }

        private func mergeOptions(base: [TemplateOption], override: [TemplateOption]) -> [TemplateOption] {
        var merged = base
        for option in override {
            if let index = merged.firstIndex(where: { $0.identifier == option.identifier }) {
                merged[index] = option // Override
            } else {
                merged.append(option) // Add new
                }
            }
            return merged
        }

        public enum ParserError: Error {
            case templateNotFound(String)
            case invalidPlist
        }
    }

    /// Resolved project template with inheritance applied
    public struct ResolvedProjectTemplate: Sendable {
        public let info: ProjectInfo
        public let options: [TemplateOption]
        public let nodes: [String]

        public init(info: ProjectInfo, options: [TemplateOption], nodes: [String]) {
            self.info = info
            self.options = options
            self.nodes = nodes
        }
    }
}
