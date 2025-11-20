//
//  Choices.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Container for option choices.
    ///
    /// Groups all possible values for a popup or radio button option.
    ///
    /// ## Example
    /// ```swift
    /// let interfaceChoices = Choices(
    ///     id: "choices-interface",
    ///     choices: [
    ///         Choice(id: "choice-1", name: "SwiftUI", identifier: nil),
    ///         Choice(id: "choice-2", name: "UIKit", identifier: nil)
    ///     ]
    /// )
    ///
    /// let storageChoices = Choices(
    ///     id: "choices-storage",
    ///     choices: [
    ///         Choice(id: "choice-none", name: "None", identifier: nil),
    ///         Choice(id: "choice-coredata", name: "Core Data", identifier: nil),
    ///         Choice(id: "choice-swiftdata", name: "SwiftData", identifier: nil)
    ///     ]
    /// )
    /// ```
    public struct Choices: Hashable, Identifiable {
        public let id: String
        public let choices: [Choice]

        public init(
            id: String,
            choices: [Choice]
        ) {
            self.id = id
            self.choices = choices
        }
    }
}
