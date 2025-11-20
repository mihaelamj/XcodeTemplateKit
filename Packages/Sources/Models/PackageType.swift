//
//  PackageType.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

extension Template.Model {
    /// Swift Package type for package templates.
    ///
    /// Specifies the type of Swift Package to create.
    /// Appears in 5 templates.
    public enum PackageType: Codable, Hashable, Sendable {
        case swiftMacro
        case library
        case empty
        case commandPlugin
        case buildToolPlugin
        case unknown(String)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self = PackageType(rawValue: rawValue)
        }

        public init(rawValue: String) {
            switch rawValue {
            case "swift-macro": self = .swiftMacro
            case "library": self = .library
            case "empty": self = .empty
            case "command-plugin": self = .commandPlugin
            case "build-tool-plugin": self = .buildToolPlugin
            default: self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .swiftMacro: return "swift-macro"
            case .library: return "library"
            case .empty: return "empty"
            case .commandPlugin: return "command-plugin"
            case .buildToolPlugin: return "build-tool-plugin"
            case .unknown(let value): return value
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }
}
