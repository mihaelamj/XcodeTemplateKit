//
//  Detail.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Tree.Node {
    /// Detail information about an option or variable.
    ///
    /// Displays metadata like type, identifier, default value, placeholder, etc.
    ///
    /// ## Example
    /// ```swift
    /// let typeDetail = Detail(
    ///     id: "detail-type",
    ///     key: "Type",
    ///     value: "Popup"
    /// )
    ///
    /// let defaultDetail = Detail(
    ///     id: "detail-default",
    ///     key: "Default",
    ///     value: "SwiftUI"
    /// )
    /// ```
    public struct Detail: Hashable, Identifiable {
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
