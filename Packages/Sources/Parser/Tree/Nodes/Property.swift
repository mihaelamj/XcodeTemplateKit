//
//  Property.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Property key-value pair.
    ///
    /// Displays metadata about a template such as name, path, kind, identifier, and ancestors.
    ///
    /// ## Example
    /// ```swift
    /// let nameProperty = Property(
    ///     id: "property-name",
    ///     key: "Name",
    ///     value: "Multiplatform App"
    /// )
    ///
    /// let ancestorsProperty = Property(
    ///     id: "property-ancestors",
    ///     key: "Ancestors",
    ///     value: "com.apple.dt.unit.applicationBase, com.apple.dt.unit.iosBase, com.apple.dt.unit.languageChoice.app.iOS"
    /// )
    /// ```
    public struct Property: Hashable, Identifiable {
        public let id: String
        public let key: String
        public let value: String

        public init(
            id: String,
            key: String,
            value: String
        ) {
            self.id = id
            self.key = key
            self.value = value
        }
    }
}
