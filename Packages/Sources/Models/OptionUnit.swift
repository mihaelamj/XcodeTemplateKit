//
//  OptionUnit.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Unit value for an option (e.g., "Swift" or "Objective-C" for language choice).
    ///
    /// Units are dictionary values where each key (like "Swift", "Objective-C", "Metal 4")
    /// maps to a OptionUnit with varying optional properties. Different units can have
    /// completely different sets of properties.
    ///
    /// ## Properties
    /// Each unit can have any combination of:
    /// - **Definitions**: Code template definitions specific to this unit
    /// - **Nodes**: Array of node references to generate
    /// - **Project**: Project configuration overrides
    /// - **RequiredOptions**: Other options that must have specific values
    /// - **Targets**: Target configurations to create
    /// - **Components**: Component definitions
    ///
    /// ## Example
    /// ```swift
    /// // Swift unit might have:
    /// OptionUnit(
    ///     definitions: Definitions(...),
    ///     nodes: ["AppDelegate.swift:comments", ...],
    ///     targets: Targets(...)
    /// )
    ///
    /// // Objective-C unit might only have:
    /// OptionUnit(
    ///     definitions: Definitions(...),
    ///     components: [Component(...)]
    /// )
    /// ```
    ///
    /// Because of this heterogeneous structure, OptionUnit uses custom Codable
    /// implementation to handle varying property sets.
    public struct OptionUnit: Codable, Hashable, Sendable {
        /// Code template definitions for this unit
        public let definitions: Definitions?

        /// Array of node references to generate
        public let nodes: [String]?

        /// Project configuration for this unit
        public let project: ProjectConfiguration?

        /// Required options: other option IDs must have these values
        public let requiredOptions: [String: String]?

        /// Target configurations to create
        public let targets: Targets?

        /// Component definitions
        public let components: [OptionComponent]?

        public init(
            definitions: Definitions? = nil,
            nodes: [String]? = nil,
            project: ProjectConfiguration? = nil,
            requiredOptions: [String: String]? = nil,
            targets: Targets? = nil,
            components: [OptionComponent]? = nil
        ) {
            self.definitions = definitions
            self.nodes = nodes
            self.project = project
            self.requiredOptions = requiredOptions
            self.targets = targets
            self.components = components
        }

        enum CodingKeys: String, CodingKey {
            case definitions = "Definitions"
            case nodes = "Nodes"
            case project = "Project"
            case requiredOptions = "RequiredOptions"
            case targets = "Targets"
            case components = "Components"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            definitions = try container.decodeIfPresent(Definitions.self, forKey: .definitions)
            nodes = try container.decodeIfPresent([String].self, forKey: .nodes)
            project = try container.decodeIfPresent(ProjectConfiguration.self, forKey: .project)
            requiredOptions = try container.decodeIfPresent([String: String].self, forKey: .requiredOptions)
            targets = try container.decodeIfPresent(Targets.self, forKey: .targets)
            components = try container.decodeIfPresent([OptionComponent].self, forKey: .components)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(definitions, forKey: .definitions)
            try container.encodeIfPresent(nodes, forKey: .nodes)
            try container.encodeIfPresent(project, forKey: .project)
            try container.encodeIfPresent(requiredOptions, forKey: .requiredOptions)
            try container.encodeIfPresent(targets, forKey: .targets)
            try container.encodeIfPresent(components, forKey: .components)
        }
    }
}
