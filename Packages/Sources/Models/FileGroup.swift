//
//  FileGroup.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Xcode group path for file organization.
    public enum FileGroup: Codable, Hashable, Sendable {
        /// Single group name.
        case single(String)

        /// Nested group path.
        case path([String])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()

            if let string = try? container.decode(String.self) {
                self = .single(string)
            } else if let array = try? container.decode([String].self) {
                self = .path(array)
            } else {
                throw DecodingError.typeMismatch(
                    FileGroup.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Expected String or Array"
                    )
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .single(let value):
                try container.encode(value)
            case .path(let value):
                try container.encode(value)
            }
        }
    }
}
