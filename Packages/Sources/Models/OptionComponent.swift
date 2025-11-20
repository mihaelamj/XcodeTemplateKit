//
//  OptionComponent.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Component in an option unit (e.g., test targets to be created).
    ///
    /// Example: When selecting "Swift Testing", it creates unit and UI test targets.
    public struct OptionComponent: Codable, Hashable, Sendable {
        /// Template identifier for the component.
        public let identifier: String

        /// Component name (often uses template variables).
        public let name: String

        public init(identifier: String, name: String) {
            self.identifier = identifier
            self.name = name
        }

        enum CodingKeys: String, CodingKey {
            case identifier = "Identifier"
            case name = "Name"
        }
    }
}
