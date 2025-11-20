//
//  Root.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Root node of the template tree.
    ///
    /// The root contains all template categories (Project Templates, Package Templates, etc.).
    ///
    /// ## Example
    /// ```swift
    /// let root = Root(categories: [
    ///     Category(
    ///         id: "category-Project Templates",
    ///         category: .projectTemplates,
    ///         kinds: [...]
    ///     )
    /// ])
    /// ```
    public struct Root: Hashable, Identifiable {
        public let id: String
        public let title: String
        public let categories: [Category]

        public init(
            id: String = "root",
            title: String = "All Xcode Templates",
            categories: [Category]
        ) {
            self.id = id
            self.title = title
            self.categories = categories
        }
    }
}
