//
//  Option.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Template option that user can configure.
    ///
    /// Represents a configurable option from TemplateInfo.plist Options array.
    /// Options can be popup menus, checkboxes, radio buttons, text fields, or static values.
    ///
    /// ## Example
    /// ```swift
    /// let interfaceOption = Option(
    ///     id: "option-interface",
    ///     name: "Interface",
    ///     identifier: "interfaceChoice",
    ///     type: .popup,
    ///     defaultValue: "SwiftUI",
    ///     details: [
    ///         Detail(id: "detail-type", key: "Type", value: "Popup"),
    ///         Detail(id: "detail-identifier", key: "Identifier", value: "interfaceChoice"),
    ///         Detail(id: "detail-default", key: "Default", value: "SwiftUI")
    ///     ],
    ///     choices: Choices(
    ///         id: "choices-interface",
    ///         choices: [
    ///             Choice(id: "choice-swiftui", name: "SwiftUI", identifier: nil),
    ///             Choice(id: "choice-uikit", name: "UIKit", identifier: nil)
    ///         ]
    ///     )
    /// )
    ///
    /// let testsOption = Option(
    ///     id: "option-tests",
    ///     name: "Include Tests",
    ///     identifier: "includeTests",
    ///     type: .checkbox,
    ///     defaultValue: "true",
    ///     details: [...],
    ///     choices: nil  // Checkboxes don't have choices
    /// )
    /// ```
    public struct Option: Hashable, Identifiable {
        public let id: String
        public let name: String
        public let identifier: String
        public let type: Models.Template.Model.OptionType
        public let defaultValue: String
        public let details: [Detail]
        public let choices: Choices?

        public init(
            id: String,
            name: String,
            identifier: String,
            type: Models.Template.Model.OptionType,
            defaultValue: String,
            details: [Detail],
            choices: Choices?
        ) {
            self.id = id
            self.name = name
            self.identifier = identifier
            self.type = type
            self.defaultValue = defaultValue
            self.details = details
            self.choices = choices
        }
    }
}
