import Foundation
import Models

extension Template.Parser.Model {
    /// Variable transformation types
    public enum Transformation: String, Equatable, Sendable, CaseIterable {
        /// Convert to valid Swift/ObjC identifier
        case identifier

        /// Convert to RFC1034 compliant identifier (domain names)
        case rfc1034Identifier = "RFC1034Identifier"

        /// Convert to bundle identifier format
        case bundleIdentifier

        /// Convert to C99 extended identifier
        case c99extidentifier
    }
}

extension Template.Parser.Model.Transformation {
    /// Apply this transformation to a string value
    public func apply(to value: String) -> String {
        switch self {
        case .identifier:
            return value
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "-", with: "_")
                .filter { $0.isLetter || $0.isNumber || $0 == "_" }

        case .rfc1034Identifier:
            return value
                .lowercased()
                .replacingOccurrences(of: " ", with: "-")
                .replacingOccurrences(of: "_", with: "-")
                .filter { $0.isLetter || $0.isNumber || $0 == "-" || $0 == "." }

        case .bundleIdentifier:
            return value
                .lowercased()
                .replacingOccurrences(of: " ", with: ".")
                .replacingOccurrences(of: "_", with: ".")
                .filter { $0.isLetter || $0.isNumber || $0 == "." }

        case .c99extidentifier:
            return value
                .replacingOccurrences(of: " ", with: "_")
                .filter { $0.isLetter || $0.isNumber || $0 == "_" }
        }
    }
}
