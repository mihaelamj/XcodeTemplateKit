//
//  AssetGenerationConfig.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Asset generation configuration for .xcassets files.
    public struct AssetGenerationConfig: Codable, Hashable, Sendable {
        /// Asset name.
        public let name: String?

        /// Asset type (e.g., "appicon", "imageset").
        public let type: String?

        /// Platform availability flags.
        public let platforms: [String: String]?

        public init(
            name: String? = nil,
            type: String? = nil,
            platforms: [String: String]? = nil
        ) {
            self.name = name
            self.type = type
            self.platforms = platforms
        }

        enum CodingKeys: String, CodingKey {
            case name = "Name"
            case type = "Type"
            case platforms = "Platforms"
        }
    }
}
