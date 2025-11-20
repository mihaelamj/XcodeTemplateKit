import Foundation
import Models

extension Template.Parser {
    /// Processes template content by parsing and substituting variables
    public struct Processor: Sendable {
        public init() {}

        /// Process a template string with the given context
        public func process(template: String, context: Resolution.VariableContext) throws -> String {
            // Parse template into tokens
            let parser = Content.ContentParser()
            let tokens = try parser.parse(template[...])

            // Resolve and concatenate
            var mutableContext = context // Make mutable for UUID caching
            return tokens.map { token in
                switch token {
                case .text(let str):
                    return str
                case .variable(let varToken):
                    return mutableContext.resolveVariable(varToken)
                }
            }.joined()
        }
    }
}
