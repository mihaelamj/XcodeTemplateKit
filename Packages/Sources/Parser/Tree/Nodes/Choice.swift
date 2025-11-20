//
//  Choice.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Individual choice within an option.
    ///
    /// Represents one selectable value for a popup or radio button.
    ///
    /// ## Example
    /// ```swift
    /// let swiftUIChoice = Choice(
    ///     id: "choice-swiftui",
    ///     name: "SwiftUI",
    ///     identifier: nil
    /// )
    ///
    /// let coreDataChoice = Choice(
    ///     id: "choice-coredata",
    ///     name: "Core Data",
    ///     identifier: "coredata"
    /// )
    /// ```
    public struct Choice: Hashable, Identifiable {
        public let id: String
        public let name: String
        public let identifier: String?

        public init(
            id: String,
            name: String,
            identifier: String?
        ) {
            self.id = id
            self.name = name
            self.identifier = identifier
        }
    }
}
