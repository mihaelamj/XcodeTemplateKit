//
//  FileDefinition.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Structured file definition specifying file placement and configuration.
    public struct FileDefinition: Codable, Hashable, Sendable {
        /// Output file path relative to project root.
        public let path: String?

        /// Xcode group(s) containing the file.
        public let group: FileGroup?

        /// Target indices that should include this file (zero-based).
        public let targetIndices: [Int]?

        /// Content to prepend to file (e.g., header comments, imports).
        public let beginning: String?

        /// Content to append to file.
        public let end: String?

        /// Order in Xcode file list (lower numbers appear first).
        public let sortOrder: Int?

        /// Indentation level for code generation.
        public let indent: Int?

        /// Asset generation configuration (for .xcassets files).
        public let assetGeneration: [AssetGenerationConfig]?

        public init(
            path: String? = nil,
            group: FileGroup? = nil,
            targetIndices: [Int]? = nil,
            beginning: String? = nil,
            end: String? = nil,
            sortOrder: Int? = nil,
            indent: Int? = nil,
            assetGeneration: [AssetGenerationConfig]? = nil
        ) {
            self.path = path
            self.group = group
            self.targetIndices = targetIndices
            self.beginning = beginning
            self.end = end
            self.sortOrder = sortOrder
            self.indent = indent
            self.assetGeneration = assetGeneration
        }

        enum CodingKeys: String, CodingKey {
            case path = "Path"
            case group = "Group"
            case targetIndices = "TargetIndices"
            case beginning = "Beginning"
            case end = "End"
            case sortOrder = "SortOrder"
            case indent = "Indent"
            case assetGeneration = "AssetGeneration"
        }
    }
}
