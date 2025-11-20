//
//  Variable.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Template variable that gets filled in during project creation.
    ///
    /// Variables are placeholders like `___PROJECTNAME___`, `___ORGANIZATIONNAME___`, etc.
    /// that get replaced with user input when creating a project.
    ///
    /// ## Example
    /// ```swift
    /// let projectNameVar = Variable(
    ///     id: "var-projectname",
    ///     name: "Product Name",
    ///     placeholder: "___PROJECTNAME___",
    ///     required: true,
    ///     details: [
    ///         Detail(id: "detail-placeholder", key: "Placeholder", value: "___PROJECTNAME___"),
    ///         Detail(id: "detail-required", key: "Required", value: "true")
    ///     ]
    /// )
    ///
    /// let orgNameVar = Variable(
    ///     id: "var-orgname",
    ///     name: "Organization Name",
    ///     placeholder: "___ORGANIZATIONNAME___",
    ///     required: true,
    ///     details: [...]
    /// )
    ///
    /// let bundleIdVar = Variable(
    ///     id: "var-bundleid",
    ///     name: "Bundle Identifier",
    ///     placeholder: "___VARIABLE_bundleIdentifierPrefix:bundleIdentifier___.___VARIABLE_productName:RFC1034Identifier___",
    ///     required: true,
    ///     details: [
    ///         Detail(id: "detail-transformation", key: "Transformations", value: "bundleIdentifier, RFC1034Identifier")
    ///     ]
    /// )
    /// ```
    ///
    /// - Note: Variables can have transformations applied (`:identifier`, `:RFC1034Identifier`, `:bundleIdentifier`, etc.)
    public struct Variable: Hashable, Identifiable {
        public let id: String
        public let name: String
        public let placeholder: String
        public let required: Bool
        public let details: [Detail]

        public init(
            id: String,
            name: String,
            placeholder: String,
            required: Bool,
            details: [Detail]
        ) {
            self.id = id
            self.name = name
            self.placeholder = placeholder
            self.required = required
            self.details = details
        }
    }
}
