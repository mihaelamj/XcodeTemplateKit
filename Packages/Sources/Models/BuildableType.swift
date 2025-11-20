//
//  BuildableType.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

extension Template.Model {
    /// Build phase type for file templates.
    ///
    /// Specifies how files created from this template should be handled in build phases.
    /// Appears in 16 templates.
    public enum BuildableType: String, Codable, Hashable, Sendable {
        case none = "None"
        case test = "Test"
        case hidden = "Hidden"
    }
}
