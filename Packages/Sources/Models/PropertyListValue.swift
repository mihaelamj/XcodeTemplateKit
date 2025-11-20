//
//  PropertyListValue.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Property list value type that can represent any plist value.
    ///
    /// This enum handles the heterogeneous nature of build settings and other
    /// dictionary values in target configurations, where values can be strings,
    /// numbers, booleans, arrays, or nested dictionaries.
    public enum PropertyListValue: Codable, Hashable, Sendable {
        case string(String)
        case int(Int)
        case double(Double)
        case bool(Bool)
        case array([PropertyListValue])
        case dictionary([String: PropertyListValue])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()

            // Try to decode in order of specificity
            if let bool = try? container.decode(Bool.self) {
                self = .bool(bool)
            } else if let int = try? container.decode(Int.self) {
                self = .int(int)
            } else if let double = try? container.decode(Double.self) {
                self = .double(double)
            } else if let string = try? container.decode(String.self) {
                self = .string(string)
            } else if let array = try? container.decode([PropertyListValue].self) {
                self = .array(array)
            } else if let dict = try? container.decode([String: PropertyListValue].self) {
                self = .dictionary(dict)
            } else {
                throw DecodingError.typeMismatch(
                    PropertyListValue.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Expected a plist-compatible type"
                    )
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value):
                try container.encode(value)
            case .int(let value):
                try container.encode(value)
            case .double(let value):
                try container.encode(value)
            case .bool(let value):
                try container.encode(value)
            case .array(let value):
                try container.encode(value)
            case .dictionary(let value):
                try container.encode(value)
            }
        }
    }
}
