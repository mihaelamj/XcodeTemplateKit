//
//  Inventory.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

extension Template.Model {
    /// Template inventory from `TemplateOptionsExtractor` output.
    ///
    /// Contains all discovered templates with their metadata.
    ///
    /// ## Example JSON
    /// ```json
    /// {
    ///   "generatedAt": "2025-11-17T16:38:34Z",
    ///   "totalTemplates": 88,
    ///   "totalCombinations": 176,
    ///   "templates": [...]
    /// }
    /// ```
    public struct Inventory: Codable, Sendable {
        public let generatedAt: String
        public let templates: [Metadata]
        public let totalTemplates: Int
        public let totalCombinations: Int

        public init(
            generatedAt: String,
            templates: [Metadata],
            totalTemplates: Int,
            totalCombinations: Int
        ) {
            self.generatedAt = generatedAt
            self.templates = templates
            self.totalTemplates = totalTemplates
            self.totalCombinations = totalCombinations
        }
    }
}
