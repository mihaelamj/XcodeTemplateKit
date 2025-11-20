//
//  ProjectConfiguration.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

extension Template.Model {
    /// Project configuration type for template settings.
    ///
    /// Specifies the type of project configuration settings included.
    /// Appears in 10 templates.
    public enum ProjectConfiguration: String, Codable, Hashable, Sendable {
        case configurations = "Configurations"
        case sharedSettings = "SharedSettings"
    }
}
