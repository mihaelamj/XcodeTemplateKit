//
//  Components.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Template components configuration for project templates with extensions.
    ///
    /// Components specify sub-targets or extensions that should be added to a project,
    /// such as app extensions that need to be embedded in the main app target.
    ///
    /// ## Examples
    /// ```swift
    /// // Safari extension component
    /// let components = Template.Components(components: [
    ///     Template.Component(
    ///         identifier: "com.apple.dt.unit.safariextension",
    ///         name: "___PACKAGENAME___ Extension",
    ///         productBuildPhaseInjections: [
    ///             Template.ProductBuildPhaseInjection(
    ///                 targetIdentifier: "com.apple.dt.applicationTarget"
    ///             )
    ///         ]
    ///     )
    /// ])
    /// ```
    public struct Components: Codable, Hashable, Sendable {
        /// Array of component definitions.
        public let components: [Component]

        public init(components: [Component]) {
            self.components = components
        }

        // MARK: - Codable

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            components = try container.decode([Component].self)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(components)
        }
    }
}
