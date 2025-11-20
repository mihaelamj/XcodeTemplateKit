//
//  TargetDefinition.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Definition of a single build target.
    public struct TargetDefinition: Codable, Hashable, Sendable {
        /// Target name (often uses template variables like ___PACKAGENAME___).
        public let name: String?

        /// Unique identifier for the target.
        public let targetIdentifier: String?

        /// Type of target (e.g., "Aggregate").
        public let targetType: String?

        /// Xcode product type (e.g., "com.apple.product-type.application").
        public let productType: String?

        /// Build settings applied to all configurations.
        public let sharedSettings: [String: PropertyListValue]?

        /// Per-configuration build settings (Debug, Release, etc.).
        public let buildConfigurations: [String: [String: PropertyListValue]]?

        /// Ordered list of build phases.
        public let buildPhases: [BuildPhase]?

        /// Target dependencies.
        public let dependencies: [PropertyListValue]?

        /// Framework dependencies (array of strings or dictionaries).
        public let frameworks: [PropertyListValue]?

        /// Whether this target is concrete (can be instantiated).
        public let concrete: Bool?

        public init(
            name: String? = nil,
            targetIdentifier: String? = nil,
            targetType: String? = nil,
            productType: String? = nil,
            sharedSettings: [String: PropertyListValue]? = nil,
            buildConfigurations: [String: [String: PropertyListValue]]? = nil,
            buildPhases: [BuildPhase]? = nil,
            dependencies: [PropertyListValue]? = nil,
            frameworks: [PropertyListValue]? = nil,
            concrete: Bool? = nil
        ) {
            self.name = name
            self.targetIdentifier = targetIdentifier
            self.targetType = targetType
            self.productType = productType
            self.sharedSettings = sharedSettings
            self.buildConfigurations = buildConfigurations
            self.buildPhases = buildPhases
            self.dependencies = dependencies
            self.frameworks = frameworks
            self.concrete = concrete
        }

        enum CodingKeys: String, CodingKey {
            case name = "Name"
            case targetIdentifier = "TargetIdentifier"
            case targetType = "TargetType"
            case productType = "ProductType"
            case sharedSettings = "SharedSettings"
            case buildConfigurations = "BuildConfigurations"
            case buildPhases = "BuildPhases"
            case dependencies = "Dependencies"
            case frameworks = "Frameworks"
            case concrete = "Concrete"
        }
    }
}
