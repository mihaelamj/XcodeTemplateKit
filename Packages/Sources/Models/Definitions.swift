//
//  Definitions.swift
//  XcodeTemplateKit
//
//  Created on November 20, 2025.
//

import Foundation

extension Template.Model {
    /// Template definitions mapping file identifiers to their configuration.
    ///
    /// Definitions specify how files should be created, placed, and configured in the project.
    /// Each key represents a file identifier (matching entries in the `nodes` array), and the value
    /// can be either a string (for code snippets) or a structured file definition.
    ///
    /// ## Examples
    /// ```swift
    /// // Simple code snippet definition
    /// let definitions = Template.Definitions(definitions: [
    ///     "Info.plist:NSExtension": .string("<key>NSExtension</key>...")
    /// ])
    ///
    /// // Structured file definition
    /// let definitions = Template.Definitions(definitions: [
    ///     "MyFile.swift": .file(Template.FileDefinition(
    ///         path: "Sources/MyFile.swift",
    ///         group: .single("Sources"),
    ///         targetIndices: [0]
    ///     ))
    /// ])
    /// ```
    public struct Definitions: Codable, Hashable, Sendable {
        /// Dictionary mapping file identifiers to their definitions.
        public let definitions: [String: DefinitionValue]

        public init(definitions: [String: DefinitionValue]) {
            self.definitions = definitions
        }

        // MARK: - Codable

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let dict = try container.decode([String: DefinitionValueContainer].self)
            definitions = dict.mapValues(\.value)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            let dict = definitions.mapValues { DefinitionValueContainer(value: $0) }
            try container.encode(dict)
        }
    }
}

// MARK: - Helper type for polymorphic decoding

/// Helper type for polymorphic decoding of definition values.
private struct DefinitionValueContainer: Codable {
    let value: Template.Model.DefinitionValue

    init(value: Template.Model.DefinitionValue) {
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        // Try to decode as string first
        if let string = try? container.decode(String.self) {
            value = .string(string)
            return
        }

        // Otherwise decode as FileDefinition
        if let fileDefinition = try? container.decode(Template.Model.FileDefinition.self) {
            value = .file(fileDefinition)
            return
        }

        throw DecodingError.typeMismatch(
            Template.Model.DefinitionValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Expected String or FileDefinition dictionary"
            )
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch value {
        case .string(let string):
            try container.encode(string)
        case .file(let fileDefinition):
            try container.encode(fileDefinition)
        }
    }
}
