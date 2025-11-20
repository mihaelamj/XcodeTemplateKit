import Foundation
import Models

extension Template.Parser.Metadata {
    /// Generic plist parser for any template type (File, Project, Package)
    /// Reusable across all template kinds
    public struct Info: Sendable {
        public init() {}

        /// Parse any TemplateInfo.plist into a dictionary
        public func parsePlist(at path: String) throws -> [String: Any] {
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)

            guard let plist = try PropertyListSerialization.propertyList(
                from: data,
                format: nil
            ) as? [String: Any] else {
                throw ParserError.invalidPlist
            }

            return plist
        }

        /// Extract kind from plist (identifies template type)
        public func extractKind(from plist: [String: Any]) -> String? {
            plist["Kind"] as? String
        }

        /// Extract identifier from plist
        public func extractIdentifier(from plist: [String: Any]) -> String? {
            plist["Identifier"] as? String
        }

        /// Extract options array from plist
        public func extractOptions(from plist: [String: Any]) -> [[String: Any]]? {
            plist["Options"] as? [[String: Any]]
        }

        /// Extract ancestors from plist (for inheritance)
        public func extractAncestors(from plist: [String: Any]) -> [String]? {
            plist["Ancestors"] as? [String]
        }

        /// Find all TemplateInfo.plist files in directory
        public func findAllTemplates(in directory: String) -> [String] {
            var templates: [String] = []
            let fileManager = FileManager.default

            guard let enumerator = fileManager.enumerator(atPath: directory) else {
                return templates
            }

            for case let file as String in enumerator {
                if file.hasSuffix("TemplateInfo.plist") || file.hasSuffix("TemplateInfo.json") {
                    templates.append("\(directory)/\(file)")
                }
            }

            return templates
        }

        public enum ParserError: Error {
            case invalidPlist
            case fileNotFound
        }
    }
}
