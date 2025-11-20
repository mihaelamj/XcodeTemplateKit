//
//  Section.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

// Typealias to avoid name collision with nested Template type
public typealias TreeNode = Template.Parser.Tree.Node

extension Template.Parser.Tree.Node {
    /// Section within a template (Properties, Options, or Variables).
    ///
    /// Organizes template data into logical sections for display.
    ///
    /// ## Example
    /// ```swift
    /// let propertiesSection = Section(
    ///     id: "section-properties",
    ///     type: .properties,
    ///     items: [
    ///         .property(Property(id: "prop-name", key: "Name", value: "App")),
    ///         .property(Property(id: "prop-kind", key: "Kind", value: "Xcode.Xcode3.ProjectTemplateUnitKind")),
    ///         .property(Property(id: "prop-ancestors", key: "Ancestors", value: "com.apple.dt.unit.base"))
    ///     ]
    /// )
    ///
    /// let optionsSection = Section(
    ///     id: "section-options",
    ///     type: .options,
    ///     items: [
    ///         .option(Option(
    ///             id: "option-interface",
    ///             name: "Interface",
    ///             identifier: "interfaceChoice",
    ///             type: .popup,
    ///             defaultValue: "SwiftUI",
    ///             details: [...],
    ///             choices: Choices(choices: [
    ///                 Choice(id: "choice-swiftui", name: "SwiftUI", identifier: nil),
    ///                 Choice(id: "choice-uikit", name: "UIKit", identifier: nil)
    ///             ])
    ///         ))
    ///     ]
    /// )
    /// ```
    public struct Section: Hashable, Identifiable {
        public enum SectionType: String, Hashable {
            case properties
            case options
            case variables
        }

        public let id: String
        public let type: SectionType
        public let items: [TreeNode]

        public var displayName: String {
            switch type {
            case .properties: return "Properties"
            case .options: return "Options"
            case .variables: return "Variables"
            }
        }

        public init(
            id: String,
            type: SectionType,
            items: [TreeNode]
        ) {
            self.id = id
            self.type = type
            self.items = items
        }
    }
}
