import Foundation

/// Template targets configuration for project templates.
///
/// Targets define build targets that will be created in the generated project,
/// including their build settings, build phases, dependencies, and product types.
///
/// ## Examples
/// ```swift
/// // Simple application target
/// let targets = TemplateTargets(targets: [
///     TargetDefinition(
///         productType: "com.apple.product-type.application",
///         buildPhases: [
///             BuildPhase(buildClass: "Sources"),
///             BuildPhase(buildClass: "Frameworks"),
///             BuildPhase(buildClass: "Resources")
///         ]
///     )
/// ])
/// ```
public struct TemplateTargets: Codable, Hashable, Sendable {
    /// Array of target definitions.
    public let targets: [TargetDefinition]

    public init(targets: [TargetDefinition]) {
        self.targets = targets
    }

    // MARK: - Codable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        targets = try container.decode([TargetDefinition].self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(targets)
    }
}

/// Definition of a single build target.
public struct TargetDefinition: Codable, Hashable, Sendable {
    /// Target name (often uses template variables like ___PACKAGENAME___).
    public let name: String?

    /// Unique identifier for the target.
    public let targetIdentifier: String?

    /// Type of target (e.g., "Aggregate").
    public let targetType: String?

    /// Xcode product type (e.g., "com.apple.product-type.application").
    public let productType: String?

    /// Build settings applied to all configurations.
    public let sharedSettings: [String: PropertyListValue]?

    /// Per-configuration build settings (Debug, Release, etc.).
    public let buildConfigurations: [String: [String: PropertyListValue]]?

    /// Ordered list of build phases.
    public let buildPhases: [BuildPhase]?

    /// Target dependencies.
    public let dependencies: [PropertyListValue]?

    /// Framework dependencies (array of strings or dictionaries).
    public let frameworks: [PropertyListValue]?

    /// Whether this target is concrete (can be instantiated).
    public let concrete: Bool?

    public init(
        name: String? = nil,
        targetIdentifier: String? = nil,
        targetType: String? = nil,
        productType: String? = nil,
        sharedSettings: [String: PropertyListValue]? = nil,
        buildConfigurations: [String: [String: PropertyListValue]]? = nil,
        buildPhases: [BuildPhase]? = nil,
        dependencies: [PropertyListValue]? = nil,
        frameworks: [PropertyListValue]? = nil,
        concrete: Bool? = nil
    ) {
        self.name = name
        self.targetIdentifier = targetIdentifier
        self.targetType = targetType
        self.productType = productType
        self.sharedSettings = sharedSettings
        self.buildConfigurations = buildConfigurations
        self.buildPhases = buildPhases
        self.dependencies = dependencies
        self.frameworks = frameworks
        self.concrete = concrete
    }

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case targetIdentifier = "TargetIdentifier"
        case targetType = "TargetType"
        case productType = "ProductType"
        case sharedSettings = "SharedSettings"
        case buildConfigurations = "BuildConfigurations"
        case buildPhases = "BuildPhases"
        case dependencies = "Dependencies"
        case frameworks = "Frameworks"
        case concrete = "Concrete"
    }
}

/// Build phase configuration.
public struct BuildPhase: Codable, Hashable, Sendable {
    /// Build phase class (e.g., "Sources", "Frameworks", "Resources").
    public let buildClass: String

    public init(buildClass: String) {
        self.buildClass = buildClass
    }

    enum CodingKeys: String, CodingKey {
        case buildClass = "Class"
    }
}

/// Property list value type that can represent any plist value.
///
/// This enum handles the heterogeneous nature of build settings and other
/// dictionary values in target configurations, where values can be strings,
/// numbers, booleans, arrays, or nested dictionaries.
public enum PropertyListValue: Codable, Hashable, Sendable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case array([PropertyListValue])
    case dictionary([String: PropertyListValue])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        // Try to decode in order of specificity
        if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else if let double = try? container.decode(Double.self) {
            self = .double(double)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let array = try? container.decode([PropertyListValue].self) {
            self = .array(array)
        } else if let dict = try? container.decode([String: PropertyListValue].self) {
            self = .dictionary(dict)
        } else {
            throw DecodingError.typeMismatch(
                PropertyListValue.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected a plist-compatible type"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        case .array(let value):
            try container.encode(value)
        case .dictionary(let value):
            try container.encode(value)
        }
    }
}
