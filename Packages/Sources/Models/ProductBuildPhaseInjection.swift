//
//  ProductBuildPhaseInjection.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Specifies where a component's product should be injected into another target.
    public struct ProductBuildPhaseInjection: Codable, Hashable, Sendable {
        /// Target identifier where the product should be injected.
        public let targetIdentifier: String

        public init(targetIdentifier: String) {
            self.targetIdentifier = targetIdentifier
        }

        enum CodingKeys: String, CodingKey {
            case targetIdentifier = "TargetIdentifier"
        }
    }
}
