//
//  TemplateKind.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Template kind node (e.g., App, Game, Framework).
    ///
    /// Groups all templates of a specific kind. Each kind can have multiple template instances.
    ///
    /// ## Example
    /// ```swift
    /// let kindNode = TemplateKind(
    ///     id: "kind-com.apple.dt.unit.multiPlatform.app",
    ///     kind: .app,
    ///     templates: [
    ///         Template(
    ///             id: "/path/to/App.xctemplate",
    ///             name: "App",
    ///             path: "/Applications/Xcode.app/.../App.xctemplate",
    ///             kind: .app,
    ///             sections: [...]
    ///         )
    ///     ]
    /// )
    /// ```
    public struct TemplateKind: Hashable, Identifiable {
        public let id: String
        public let kind: Models.Template.Model.Kind
        public let templates: [Template]

        public var displayName: String {
            kind.displayName
        }

        public init(
            id: String,
            kind: Models.Template.Model.Kind,
            templates: [Template]
        ) {
            self.id = id
            self.kind = kind
            self.templates = templates
        }
    }
}
