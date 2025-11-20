//
//  Template.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Individual template instance.
    ///
    /// Represents a single `.xctemplate` bundle with its properties, options, and variables.
    /// Contains ancestor references for template inheritance.
    ///
    /// ## Example
    /// ```swift
    /// let templateNode = Template(
    ///     id: "/path/to/App.xctemplate",
    ///     name: "iOS Safari Extension App",
    ///     path: "/Applications/Xcode.app/.../iOS Safari Extension App.xctemplate",
    ///     kind: .iosSafariExtensionApp,
    ///     sections: [
    ///         Section(
    ///             id: "properties",
    ///             type: .properties,
    ///             items: [
    ///                 .property(Property(
    ///                     id: "property-ancestors",
    ///                     key: "Ancestors",
    ///                     value: "com.apple.dt.unit.applicationBase, com.apple.dt.unit.iosBase"
    ///                 ))
    ///             ]
    ///         )
    ///     ]
    /// )
    /// ```
    ///
    /// - Note: Ancestors are stored as comma-separated identifier strings that reference
    ///   other templates by their identifier. These are resolved later using
    ///   `ProjectParser.loadWithAncestors()`.
    public struct Template: Hashable, Identifiable {
        public let id: String
        public let name: String
        public let path: String
        public let kind: Models.Template.Model.Kind
        public let sections: [Section]

        /// Template identifier derived from the kind.
        public var identifier: String {
            kind.rawValue
        }

        public init(
            id: String,
            name: String,
            path: String,
            kind: Models.Template.Model.Kind,
            sections: [Section]
        ) {
            self.id = id
            self.name = name
            self.path = path
            self.kind = kind
            self.sections = sections
        }
    }
}
