//
//  DefinitionValue.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// A definition value can be either a string (code snippet) or a structured file definition.
    public enum DefinitionValue: Hashable, Sendable {
        case string(String)
        case file(FileDefinition)
    }
}
