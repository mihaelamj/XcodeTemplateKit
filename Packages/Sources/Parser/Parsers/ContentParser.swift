import Foundation
import Parsing

extension Template.Parser.Content {
    /// Parses entire template content into tokens
    public struct ContentParser: Parser {
        public init() {}

        public var body: some Parser<Substring, [Template.Parser.Token]> {
            Many {
                OneOf {
                    // Parse variables first
                    VariableParser().map(Template.Parser.Token.variable)

                    // Parse text between variables
                    PrefixUpTo("___")
                        .filter { !$0.isEmpty }
                        .map { String($0) }
                        .map(Template.Parser.Token.text)

                    // Catch any remaining text at end
                    Rest()
                        .filter { !$0.isEmpty }
                        .map { String($0) }
                        .map(Template.Parser.Token.text)
                }
            }
        }
    }
}
