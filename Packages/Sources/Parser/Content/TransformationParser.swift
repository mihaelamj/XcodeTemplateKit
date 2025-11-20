import Foundation
import Models
import Parsing

extension Template.Parser.Content {
    /// Parses transformation suffixes like :identifier:RFC1034Identifier
    public struct TransformationParser: Parser {
        public init() {}

        public var body: some Parser<Substring, [Template.Parser.Model.Transformation]> {
            Many(1...) {
                OneOf {
                    "identifier".map { Template.Parser.Model.Transformation.identifier }
                    "RFC1034Identifier".map { Template.Parser.Model.Transformation.rfc1034Identifier }
                    "bundleIdentifier".map { Template.Parser.Model.Transformation.bundleIdentifier }
                    "c99extidentifier".map { Template.Parser.Model.Transformation.c99extidentifier }
                }
            } separator: {
                ":"
            }
        }
    }
}
