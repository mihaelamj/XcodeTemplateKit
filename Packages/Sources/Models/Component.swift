//
//  Component.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Definition of a single template component (sub-target or extension).
    public struct Component: Codable, Hashable, Sendable {
        /// Template identifier for the component target.
        public let identifier: String

        /// Component name (often uses template variables like ___PACKAGENAME___Extension).
        public let name: String

        /// Specifies where this component's product should be injected.
        public let productBuildPhaseInjections: [ProductBuildPhaseInjection]?

        public init(
            identifier: String,
            name: String,
            productBuildPhaseInjections: [ProductBuildPhaseInjection]? = nil
        ) {
            self.identifier = identifier
            self.name = name
            self.productBuildPhaseInjections = productBuildPhaseInjections
        }

        enum CodingKeys: String, CodingKey {
            case identifier = "Identifier"
            case name = "Name"
            case productBuildPhaseInjections = "ProductBuildPhaseInjections"
        }
    }
}
