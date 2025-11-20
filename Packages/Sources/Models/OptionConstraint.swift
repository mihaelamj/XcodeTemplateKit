//
//  OptionConstraint.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Definition of a single option constraint.
    public struct OptionConstraint: Codable, Hashable, Sendable {
        /// Type of constraint to apply.
        public let constraintType: ConstraintType

        /// The option identifier being constrained.
        public let identifier: String

        /// The required or expected value.
        public let value: String

        public init(
            constraintType: ConstraintType,
            identifier: String,
            value: String
        ) {
            self.constraintType = constraintType
            self.identifier = identifier
            self.value = value
        }

        enum CodingKeys: String, CodingKey {
            case constraintType = "ConstraintType"
            case identifier = "Identifier"
            case value = "Value"
        }
    }
}
