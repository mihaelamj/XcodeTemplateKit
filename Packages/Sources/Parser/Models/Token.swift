import Foundation

extension Template.Parser {
    /// Represents a parsed piece of template content
    public enum Token: Equatable, Sendable {
        /// Plain text content
        case text(String)

        /// A variable to be substituted
        case variable(VariableToken)
    }
}

extension Template.Parser.Token: CustomStringConvertible {
        public var description: String {
            switch self {
            case .text(let str):
                return "Text(\"\(str)\")"
            case .variable(let token):
                return "Variable(\(token))"
            }
        }
    }
