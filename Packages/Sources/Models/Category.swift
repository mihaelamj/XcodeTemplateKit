//
//  Category.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation

extension Template.Model {
    /// High-level categorization of template types.
    ///
    /// Groups templates into major categories for organization.
    ///
    /// ## Example
    /// ```swift
    /// let category = Template.Category.projectTemplates
    /// print(category.displayName)  // "Project Templates"
    /// ```
    public enum Category: String, Hashable, CaseIterable {
        case projectTemplates = "Project Templates"
        case fileTemplates = "File Templates"
        case packageTemplates = "Package Templates"

        public var displayName: String {
            rawValue
        }
    }
}
