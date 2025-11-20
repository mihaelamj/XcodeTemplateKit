import Foundation
import Parsing

/// Parses entire template content into tokens
public struct TemplateContentParser: Parser {
    public init() {}

    public var body: some Parser<Substring, [TemplateToken]> {
        Many {
            OneOf {
                // Parse variables first
                VariableParser().map(TemplateToken.variable)

                // Parse text between variables
                PrefixUpTo("___")
                    .filter { !$0.isEmpty }
                    .map { String($0) }
                    .map(TemplateToken.text)

                // Catch any remaining text at end
                Rest()
                    .filter { !$0.isEmpty }
                    .map { String($0) }
                    .map(TemplateToken.text)
            }
        }
    }
}
