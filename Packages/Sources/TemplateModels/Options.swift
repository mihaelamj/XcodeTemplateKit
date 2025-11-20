import Foundation

/// Template option configuration from Options array.
///
/// Options allow users to configure templates through UI inputs like text fields,
/// checkboxes, and popup menus. Each option can have values, constraints, and units.
///
/// ## Examples
/// ```swift
/// // Simple text option
/// let nameOption = Option(
///     identifier: "productName",
///     name: "Product Name:",
///     type: "text",
///     defaultValue: "MyApp"
/// )
///
/// // Popup with values and units
/// let testingOption = Option(
///     identifier: "testingSystem",
///     name: "Testing System:",
///     type: "popup",
///     defaultValue: "None",
///     values: ["None", "XCTest", "Swift Testing"],
///     units: [
///         "XCTest": OptionUnit(components: [...]),
///         "Swift Testing": OptionUnit(components: [...])
///     ]
/// )
/// ```
public struct Option: Codable, Hashable, Sendable {
    /// Unique identifier for this option (e.g., "productName", "languageChoice").
    public let identifier: String

    /// Display label shown in UI (e.g., "Product Name:", "Language:").
    public let name: String

    /// Input type: "text", "popup", "checkbox", "static", "class".
    public let type: String

    /// Default value for this option.
    public let defaultValue: String

    /// Detailed description shown in UI.
    public let description: String?

    /// Override existing option value from ancestor templates.
    public let override: String?

    /// Whether this option should not be persisted to user defaults.
    public let notPersisted: Bool?

    /// Whether this option is required.
    public let required: Bool?

    /// Replacement text when option value is empty.
    public let emptyReplacement: String?

    /// UI sort order for displaying options.
    public let sortOrder: Int?

    /// Available values for popup/choice options.
    public let values: [String]?

    /// Display titles for each value (parallel to values array).
    public let valueTitles: [String]?

    /// Constraint mapping: value -> (otherOptionId -> requiredValue).
    ///
    /// Example: `{"Swift": {"testingSystem": "Swift Testing"}}`
    /// means when this option is "Swift", testingSystem must be "Swift Testing".
    public let requiredOptionsForValues: [String: [String: String]]?

    /// Unit configurations per value (e.g., test targets to create per testing system).
    public let units: [String: OptionUnit]?

    // Legacy field for backward compatibility
    public var choices: [String]? {
        values
    }

    public init(
        identifier: String,
        name: String = "",
        type: String = "text",
        defaultValue: String = "",
        description: String? = nil,
        override: String? = nil,
        notPersisted: Bool? = nil,
        required: Bool? = nil,
        emptyReplacement: String? = nil,
        sortOrder: Int? = nil,
        values: [String]? = nil,
        valueTitles: [String]? = nil,
        requiredOptionsForValues: [String: [String: String]]? = nil,
        units: [String: OptionUnit]? = nil
    ) {
        self.identifier = identifier
        self.name = name
        self.type = type
        self.defaultValue = defaultValue
        self.description = description
        self.override = override
        self.notPersisted = notPersisted
        self.required = required
        self.emptyReplacement = emptyReplacement
        self.sortOrder = sortOrder
        self.values = values
        self.valueTitles = valueTitles
        self.requiredOptionsForValues = requiredOptionsForValues
        self.units = units
    }

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case type = "Type"
        case defaultValue = "Default"
        case description = "Description"
        case override = "Override"
        case notPersisted = "NotPersisted"
        case required = "Required"
        case emptyReplacement = "EmptyReplacement"
        case sortOrder = "SortOrder"
        case values = "Values"
        case valueTitles = "ValueTitles"
        case requiredOptionsForValues = "RequiredOptionsForValues"
        case units = "Units"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(String.self, forKey: .identifier)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? "text"
        defaultValue = try container.decodeIfPresent(String.self, forKey: .defaultValue) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description)
        override = try container.decodeIfPresent(String.self, forKey: .override)
        notPersisted = try container.decodeIfPresent(Bool.self, forKey: .notPersisted)
        required = try container.decodeIfPresent(Bool.self, forKey: .required)
        emptyReplacement = try container.decodeIfPresent(String.self, forKey: .emptyReplacement)
        sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder)
        values = try container.decodeIfPresent([String].self, forKey: .values)
        valueTitles = try container.decodeIfPresent([String].self, forKey: .valueTitles)
        requiredOptionsForValues = try container.decodeIfPresent([String: [String: String]].self, forKey: .requiredOptionsForValues)
        units = try container.decodeIfPresent([String: OptionUnit].self, forKey: .units)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(identifier, forKey: .identifier)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(defaultValue, forKey: .defaultValue)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(override, forKey: .override)
        try container.encodeIfPresent(notPersisted, forKey: .notPersisted)
        try container.encodeIfPresent(required, forKey: .required)
        try container.encodeIfPresent(emptyReplacement, forKey: .emptyReplacement)
        try container.encodeIfPresent(sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(values, forKey: .values)
        try container.encodeIfPresent(valueTitles, forKey: .valueTitles)
        try container.encodeIfPresent(requiredOptionsForValues, forKey: .requiredOptionsForValues)
        try container.encodeIfPresent(units, forKey: .units)
    }
}

/// Unit value for an option (e.g., "Swift" or "Objective-C" for language choice).
///
/// Units can contain complex nested structures like Components, Definitions, and Targets.
/// For now, we only decode Components. Definitions and Targets will be added later.
public struct OptionUnit: Codable, Hashable, Sendable {
    /// Components to create for this unit (e.g., test targets).
    public let components: [OptionComponent]?

    public init(components: [OptionComponent]? = nil) {
        self.components = components
    }

    enum CodingKeys: String, CodingKey {
        case components = "Components"
    }
}

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
