//
//  BuildPhase.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Build phase configuration.
    public struct BuildPhase: Codable, Hashable, Sendable {
        /// Build phase class (e.g., "Sources", "Frameworks", "Resources").
        public let buildClass: String

        public init(buildClass: String) {
            self.buildClass = buildClass
        }

        enum CodingKeys: String, CodingKey {
            case buildClass = "Class"
        }
    }
}
