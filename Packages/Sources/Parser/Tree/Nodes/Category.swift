//
//  Category.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Template category grouping (Project Templates, Package Templates).
    ///
    /// Groups template kinds by their high-level category.
    ///
    /// ## Example
    /// ```swift
    /// let categoryNode = Category(
    ///     id: "category-projectTemplates",
    ///     category: .projectTemplates,
    ///     kinds: [
    ///         TemplateKind(
    ///             id: "kind-com.apple.dt.unit.multiPlatform.app",
    ///             kind: .app,
    ///             templates: [...]
    ///         )
    ///     ]
    /// )
    /// ```
    public struct Category: Hashable, Identifiable {
        public let id: String
        public let category: Models.Template.Model.Category
        public let kinds: [TemplateKind]

        public var displayName: String {
            category.displayName
        }

        public init(
            id: String,
            category: Models.Template.Model.Category,
            kinds: [TemplateKind]
        ) {
            self.id = id
            self.category = category
            self.kinds = kinds
        }
    }
}
