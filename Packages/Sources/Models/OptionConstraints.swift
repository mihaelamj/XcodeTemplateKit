//
//  OptionConstraints.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Template option constraints configuration.
    ///
    /// Option constraints specify validation rules and requirements for template options,
    /// typically enforcing relationships between the template and its associated targets.
    ///
    /// ## Examples
    /// ```swift
    /// // Require bundle identifier prefix if associated target exists
    /// let constraints = Template.OptionConstraints(constraints: [
    ///     Template.OptionConstraint(
    ///         constraintType: .requirementIfAssociatedTarget,
    ///         identifier: "bundleIdentifierPrefix",
    ///         value: "___ASSOCIATEDTARGET_bundleIdentifier___"
    ///     )
    /// ])
    /// ```
    public struct OptionConstraints: Codable, Hashable, Sendable {
        /// Array of option constraints.
        public let constraints: [OptionConstraint]

        public init(constraints: [OptionConstraint]) {
            self.constraints = constraints
        }

        // MARK: - Codable

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            constraints = try container.decode([OptionConstraint].self)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(constraints)
        }
    }
}
