import Foundation
import Parsing

/// Parses transformation suffixes like :identifier:RFC1034Identifier
public struct TransformationParser: Parser {
    public init() {}

    public var body: some Parser<Substring, [Transformation]> {
        Many(1...) {
            OneOf {
                "identifier".map { Transformation.identifier }
                "RFC1034Identifier".map { Transformation.rfc1034Identifier }
                "bundleIdentifier".map { Transformation.bundleIdentifier }
                "c99extidentifier".map { Transformation.c99extidentifier }
            }
        } separator: {
            ":"
        }
    }
}
