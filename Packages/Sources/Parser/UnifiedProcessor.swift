import Foundation
import Models

extension Template.Parser {
    /// Unified processor for ALL template types (File, Project, Package)
    /// Reuses core parsing and variable substitution
    public struct UnifiedProcessor: Sendable {
        private let templateInfoParser = Metadata.Info()
        private let templateProcessor = Processor()

        public init() {}

        // MARK: - Universal Processing

        /// Process ANY template file with variable substitution
        public func processFile(
            templatePath: String,
            context: Resolution.VariableContext
        ) throws -> String {
            let content = try String(contentsOfFile: templatePath, encoding: .utf8)
            return try templateProcessor.process(template: content, context: context)
        }

        /// Process multiple template files (for projects with multiple files)
        public func processFiles(
            templatePaths: [String],
            context: Resolution.VariableContext
        ) throws -> [String: String] {
            var results: [String: String] = [:]

            for path in templatePaths {
                let result = try processFile(templatePath: path, context: context)
                let fileName = URL(fileURLWithPath: path).lastPathComponent
                results[fileName] = result
            }

            return results
        }

        // MARK: - Template Discovery

        /// Find all templates in a directory
        public func findTemplates(in directory: String) -> [String] {
            templateInfoParser.findAllTemplates(in: directory)
        }

        /// Load template metadata
        public func loadMetadata(from plistPath: String) throws -> [String: Any] {
            try templateInfoParser.parsePlist(at: plistPath)
        }

        // MARK: - Template-Specific Helpers

        /// Determine template type from metadata
        public func identifyTemplateType(metadata: [String: Any]) -> TemplateType {
            guard let kind = templateInfoParser.extractKind(from: metadata) else {
                return .unknown
            }

            if kind.contains("FileTemplateKind") {
                return .file
            } else if kind.contains("ProjectTemplateKind") || kind.contains("ProjectTemplateUnitKind") {
                return .project
            } else {
                return .unknown
            }
        }

        /// Create context from template metadata
        public func createContext(
            from metadata: [String: Any],
            fileName: String = "File.swift",
            projectName: String = "MyProject"
        ) -> Resolution.VariableContext {
            // Extract any default options from metadata
            var options: [String: String] = [:]

            if let optionsArray = templateInfoParser.extractOptions(from: metadata) {
                for option in optionsArray {
                    if let identifier = option["Identifier"] as? String,
                       let defaultValue = option["Default"] as? String {
                        options[identifier] = defaultValue
                    }
                }
            }

            let baseFileName = URL(fileURLWithPath: fileName).deletingPathExtension().lastPathComponent

            return Resolution.VariableContext(
                fileName: fileName,
                fileBaseName: baseFileName,
                projectName: projectName,
                packageName: projectName,
                userName: NSUserName(),
                fullUserName: NSFullUserName(),
                date: DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none),
                year: String(Calendar.current.component(.year, from: Date())),
                options: options
            )
        }

        public enum TemplateType: String, Sendable {
            case file = "File"
            case project = "Project"
            case unknown = "Unknown"
        }
    }
}
