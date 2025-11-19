import Foundation

/// Template components configuration for project templates with extensions.
///
/// Components specify sub-targets or extensions that should be added to a project,
/// such as app extensions that need to be embedded in the main app target.
///
/// ## Examples
/// ```swift
/// // Safari extension component
/// let components = TemplateComponents(components: [
///     TemplateComponent(
///         identifier: "com.apple.dt.unit.safariextension",
///         name: "___PACKAGENAME___ Extension",
///         productBuildPhaseInjections: [
///             ProductBuildPhaseInjection(
///                 targetIdentifier: "com.apple.dt.applicationTarget"
///             )
///         ]
///     )
/// ])
/// ```
public struct TemplateComponents: Codable, Hashable, Sendable {
    /// Array of component definitions.
    public let components: [TemplateComponent]

    public init(components: [TemplateComponent]) {
        self.components = components
    }

    // MARK: - Codable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        components = try container.decode([TemplateComponent].self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(components)
    }
}

/// Definition of a single template component (sub-target or extension).
public struct TemplateComponent: Codable, Hashable, Sendable {
    /// Template identifier for the component target.
    public let identifier: String

    /// Component name (often uses template variables like ___PACKAGENAME___Extension).
    public let name: String

    /// Specifies where this component's product should be injected.
    public let productBuildPhaseInjections: [ProductBuildPhaseInjection]?

    public init(
        identifier: String,
        name: String,
        productBuildPhaseInjections: [ProductBuildPhaseInjection]? = nil
    ) {
        self.identifier = identifier
        self.name = name
        self.productBuildPhaseInjections = productBuildPhaseInjections
    }

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case productBuildPhaseInjections = "ProductBuildPhaseInjections"
    }
}

/// Specifies where a component's product should be injected into another target.
public struct ProductBuildPhaseInjection: Codable, Hashable, Sendable {
    /// Target identifier where the product should be injected.
    public let targetIdentifier: String

    public init(targetIdentifier: String) {
        self.targetIdentifier = targetIdentifier
    }

    enum CodingKeys: String, CodingKey {
        case targetIdentifier = "TargetIdentifier"
    }
}
