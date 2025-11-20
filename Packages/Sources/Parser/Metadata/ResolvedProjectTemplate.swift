import Foundation
import Models

extension Template.Parser.Metadata {
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
