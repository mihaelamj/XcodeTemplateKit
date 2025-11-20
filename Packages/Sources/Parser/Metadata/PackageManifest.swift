import Foundation
import Models

extension Template.Parser.Metadata {
    /// Parser for Package.swift manifests in templates
    public struct PackageManifest: Sendable {
        public init() {}

        /// Parse Package.swift template and substitute variables
        public func parseTemplate(manifestPath: String, context: Template.Parser.Resolution.VariableContext) throws -> String {
            let content = try String(contentsOfFile: manifestPath, encoding: .utf8)

            // Use the main template processor
            let processor = Template.Parser.Processor()
            return try processor.process(template: content, context: context)
        }

        /// Extract package name from Package.swift
        public func extractPackageName(from content: String) -> String? {
            // Look for: name: "PackageName"
            let pattern = #"name:\s*"([^"]+)""#
            if let regex = try? NSRegularExpression(pattern: pattern),
               let match = regex.firstMatch(in: content, range: NSRange(content.startIndex..., in: content)),
               let range = Range(match.range(at: 1), in: content) {
                return String(content[range])
            }
            return nil
        }

        /// Extract dependencies from Package.swift
        public func extractDependencies(from content: String) -> [PackageDependency] {
            var dependencies: [PackageDependency] = []

            // Look for .package(url: "...", from: "...")
            let pattern = #"\.package\(url:\s*"([^"]+)",\s*(?:from|exact):\s*"([^"]+)"\)"#
            if let regex = try? NSRegularExpression(pattern: pattern) {
                let matches = regex.matches(in: content, range: NSRange(content.startIndex..., in: content))

                for match in matches {
                    if let urlRange = Range(match.range(at: 1), in: content),
                       let versionRange = Range(match.range(at: 2), in: content) {
                        dependencies.append(PackageDependency(
                            url: String(content[urlRange]),
                            version: String(content[versionRange])
                        ))
                    }
                }
            }

            return dependencies
        }
    }

    public struct PackageDependency: Sendable, Equatable {
        public let url: String
        public let version: String

        public init(url: String, version: String) {
            self.url = url
            self.version = version
        }
    }
}
