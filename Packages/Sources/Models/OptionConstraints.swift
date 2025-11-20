import Foundation

/// Template option constraints configuration.
///
/// Option constraints specify validation rules and requirements for template options,
/// typically enforcing relationships between the template and its associated targets.
///
/// ## Examples
/// ```swift
/// // Require bundle identifier prefix if associated target exists
/// let constraints = OptionConstraints(constraints: [
///     OptionConstraint(
///         constraintType: .requirementIfAssociatedTarget,
///         identifier: "bundleIdentifierPrefix",
///         value: "___ASSOCIATEDTARGET_bundleIdentifier___"
///     )
/// ])
/// ```
public struct OptionConstraints: Codable, Hashable, Sendable {
    /// Array of option constraints.
    public let constraints: [OptionConstraint]

    public init(constraints: [OptionConstraint]) {
        self.constraints = constraints
    }

    // MARK: - Codable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        constraints = try container.decode([OptionConstraint].self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(constraints)
    }
}

/// Definition of a single option constraint.
public struct OptionConstraint: Codable, Hashable, Sendable {
    /// Type of constraint to apply.
    public let constraintType: ConstraintType

    /// The option identifier being constrained.
    public let identifier: String

    /// The required or expected value.
    public let value: String

    public init(
        constraintType: ConstraintType,
        identifier: String,
        value: String
    ) {
        self.constraintType = constraintType
        self.identifier = identifier
        self.value = value
    }

    enum CodingKeys: String, CodingKey {
        case constraintType = "ConstraintType"
        case identifier = "Identifier"
        case value = "Value"
    }
}

/// Type of option constraint.
public enum ConstraintType: Codable, Hashable, Sendable {
    /// Requires option value if associated target exists.
    case requirementIfAssociatedTarget

    /// Sets default value if associated target exists.
    case defaultIfAssociatedTarget

    /// Unknown constraint type (for forward compatibility).
    case unknown(String)

    /// Raw string value for this constraint type.
    public var rawValue: String {
        switch self {
        case .requirementIfAssociatedTarget:
            return "RequirementIfAssociatedTarget"
        case .defaultIfAssociatedTarget:
            return "DefaultIfAssociatedTarget"
        case .unknown(let value):
            return value
        }
    }

    /// Initialize from raw string value.
    public init(rawValue: String) {
        switch rawValue {
        case "RequirementIfAssociatedTarget":
            self = .requirementIfAssociatedTarget
        case "DefaultIfAssociatedTarget":
            self = .defaultIfAssociatedTarget
        default:
            self = .unknown(rawValue)
        }
    }

    // MARK: - Codable

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self.init(rawValue: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }

    public static func ==(lhs: ConstraintType, rhs: ConstraintType) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

extension ConstraintType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .requirementIfAssociatedTarget:
            return "Requirement If Associated Target"
        case .defaultIfAssociatedTarget:
            return "Default If Associated Target"
        case .unknown(let value):
            return "Unknown (\(value))"
        }
    }
}
