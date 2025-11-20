//
//  ConstraintType.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Type of option constraint.
    public enum ConstraintType: Codable, Hashable, Sendable {
        /// Requires option value if associated target exists.
        case requirementIfAssociatedTarget

        /// Sets default value if associated target exists.
        case defaultIfAssociatedTarget

        /// Unknown constraint type (for forward compatibility).
        case unknown(String)

        /// Raw string value for this constraint type.
        public var rawValue: String {
            switch self {
            case .requirementIfAssociatedTarget:
                return "RequirementIfAssociatedTarget"
            case .defaultIfAssociatedTarget:
                return "DefaultIfAssociatedTarget"
            case .unknown(let value):
                return value
            }
        }

        /// Initialize from raw string value.
        public init(rawValue: String) {
            switch rawValue {
            case "RequirementIfAssociatedTarget":
                self = .requirementIfAssociatedTarget
            case "DefaultIfAssociatedTarget":
                self = .defaultIfAssociatedTarget
            default:
                self = .unknown(rawValue)
            }
        }

        // MARK: - Codable

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self.init(rawValue: rawValue)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }

        // MARK: - Hashable

        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue)
        }

        public static func ==(lhs: ConstraintType, rhs: ConstraintType) -> Bool {
            lhs.rawValue == rhs.rawValue
        }
    }
}

extension Template.Model.ConstraintType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .requirementIfAssociatedTarget:
            return "Requirement If Associated Target"
        case .defaultIfAssociatedTarget:
            return "Default If Associated Target"
        case .unknown(let value):
            return "Unknown (\(value))"
        }
    }
}
