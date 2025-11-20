//
//  Targets.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Template targets configuration for project templates.
    ///
    /// Targets define build targets that will be created in the generated project,
    /// including their build settings, build phases, dependencies, and product types.
    ///
    /// ## Examples
    /// ```swift
    /// // Simple application target
    /// let targets = Template.Targets(targets: [
    ///     Template.TargetDefinition(
    ///         productType: "com.apple.product-type.application",
    ///         buildPhases: [
    ///             Template.BuildPhase(buildClass: "Sources"),
    ///             Template.BuildPhase(buildClass: "Frameworks"),
    ///             Template.BuildPhase(buildClass: "Resources")
    ///         ]
    ///     )
    /// ])
    /// ```
    public struct Targets: Codable, Hashable, Sendable {
        /// Array of target definitions.
        public let targets: [TargetDefinition]

        public init(targets: [TargetDefinition]) {
            self.targets = targets
        }

        // MARK: - Codable

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            targets = try container.decode([TargetDefinition].self)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(targets)
        }
    }
}
