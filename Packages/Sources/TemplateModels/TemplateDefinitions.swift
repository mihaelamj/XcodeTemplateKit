import Foundation

/// Template definitions mapping file identifiers to their configuration.
///
/// Definitions specify how files should be created, placed, and configured in the project.
/// Each key represents a file identifier (matching entries in the `nodes` array), and the value
/// can be either a string (for code snippets) or a structured file definition.
///
/// ## Examples
/// ```swift
/// // Simple code snippet definition
/// let definitions = TemplateDefinitions(definitions: [
///     "Info.plist:NSExtension": .string("<key>NSExtension</key>...")
/// ])
///
/// // Structured file definition
/// let definitions = TemplateDefinitions(definitions: [
///     "MyFile.swift": .file(FileDefinition(
///         path: "Sources/MyFile.swift",
///         group: .single("Sources"),
///         targetIndices: [0]
///     ))
/// ])
/// ```
public struct TemplateDefinitions: Codable, Hashable, Sendable {
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

/// A definition value can be either a string (code snippet) or a structured file definition.
public enum DefinitionValue: Hashable, Sendable {
    case string(String)
    case file(FileDefinition)
}

/// Helper type for polymorphic decoding of definition values.
private struct DefinitionValueContainer: Codable {
    let value: DefinitionValue

    init(value: DefinitionValue) {
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
        if let fileDefinition = try? container.decode(FileDefinition.self) {
            value = .file(fileDefinition)
            return
        }

        throw DecodingError.typeMismatch(
            DefinitionValue.self,
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

/// Structured file definition specifying file placement and configuration.
public struct FileDefinition: Codable, Hashable, Sendable {
    /// Output file path relative to project root.
    public let path: String?

    /// Xcode group(s) containing the file.
    public let group: FileGroup?

    /// Target indices that should include this file (zero-based).
    public let targetIndices: [Int]?

    /// Content to prepend to file (e.g., header comments, imports).
    public let beginning: String?

    /// Content to append to file.
    public let end: String?

    /// Order in Xcode file list (lower numbers appear first).
    public let sortOrder: Int?

    /// Indentation level for code generation.
    public let indent: Int?

    /// Asset generation configuration (for .xcassets files).
    public let assetGeneration: [AssetGenerationConfig]?

    public init(
        path: String? = nil,
        group: FileGroup? = nil,
        targetIndices: [Int]? = nil,
        beginning: String? = nil,
        end: String? = nil,
        sortOrder: Int? = nil,
        indent: Int? = nil,
        assetGeneration: [AssetGenerationConfig]? = nil
    ) {
        self.path = path
        self.group = group
        self.targetIndices = targetIndices
        self.beginning = beginning
        self.end = end
        self.sortOrder = sortOrder
        self.indent = indent
        self.assetGeneration = assetGeneration
    }

    enum CodingKeys: String, CodingKey {
        case path = "Path"
        case group = "Group"
        case targetIndices = "TargetIndices"
        case beginning = "Beginning"
        case end = "End"
        case sortOrder = "SortOrder"
        case indent = "Indent"
        case assetGeneration = "AssetGeneration"
    }
}

/// Xcode group path for file organization.
public enum FileGroup: Codable, Hashable, Sendable {
    /// Single group name.
    case single(String)

    /// Nested group path.
    case path([String])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let string = try? container.decode(String.self) {
            self = .single(string)
        } else if let array = try? container.decode([String].self) {
            self = .path(array)
        } else {
            throw DecodingError.typeMismatch(
                FileGroup.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected String or Array"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .single(let value):
            try container.encode(value)
        case .path(let value):
            try container.encode(value)
        }
    }
}

/// Asset generation configuration for .xcassets files.
public struct AssetGenerationConfig: Codable, Hashable, Sendable {
    /// Asset name.
    public let name: String?

    /// Asset type (e.g., "appicon", "imageset").
    public let type: String?

    /// Platform availability flags.
    public let platforms: [String: String]?

    public init(
        name: String? = nil,
        type: String? = nil,
        platforms: [String: String]? = nil
    ) {
        self.name = name
        self.type = type
        self.platforms = platforms
    }

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case platforms = "Platforms"
    }
}
