// Field Metadata Protocol Design
// This is a design document, not executable code

import Foundation

// MARK: - Protocol Definition

/// Provides metadata about a template field including description, examples, and validation rules.
///
/// This protocol enables:
/// - Programmatic access to field information
/// - UI generation from field metadata
/// - Automatic validation
/// - Test generation
/// - Documentation generation
///
/// ## Example
/// ```swift
/// // Access field metadata
/// let identifierMetadata = TemplateMetadata.Fields.Identifier.self
/// print(identifierMetadata.displayName)      // "Identifier"
/// print(identifierMetadata.fieldDescription) // "Unique template identifier..."
/// print(identifierMetadata.examples)         // ["com.apple.dt.unit...", ...]
///
/// // Use in UI
/// struct FieldEditor: View {
///     let field: any TemplateFieldMetadata.Type
///
///     var body: some View {
///         VStack {
///             Text(field.displayName)
///             Text(field.fieldDescription)
///             ForEach(field.examples, id: \.self) { example in
///                 Text("Example: \(example)")
///             }
///         }
///     }
/// }
/// ```
public protocol TemplateFieldMetadata {
    /// The internal field name used in JSON and Swift code.
    ///
    /// Uses camelCase convention.
    /// Example: "identifier", "allowedTypes", "hiddenFromChooser"
    static var fieldName: String { get }

    /// The key name used in TemplateInfo.plist files.
    ///
    /// Uses UpperCamelCase convention (Xcode standard).
    /// Example: "Identifier", "AllowedTypes", "HiddenFromChooser"
    static var plistKey: String { get }

    /// Human-readable display name for UI presentation.
    ///
    /// Example: "Identifier", "Allowed Types", "Hidden From Chooser"
    static var displayName: String { get }

    /// Detailed description of what this field does and how it's used.
    ///
    /// Should include:
    /// - Purpose of the field
    /// - When to use it
    /// - Impact on template behavior
    /// - Common use cases
    static var fieldDescription: String { get }

    /// Array of example values showing typical usage.
    ///
    /// Should include:
    /// - Common real-world examples from Apple templates
    /// - Edge cases if applicable
    /// - Both simple and complex examples
    static var examples: [String] { get }

    /// Whether this field is required in all templates.
    ///
    /// Required fields:
    /// - Identifier
    /// - Kind
    /// - Description
    ///
    /// All other fields are optional.
    static var isRequired: Bool { get }

    /// The Swift type of this field.
    ///
    /// Examples: "String", "[Platform]", "TemplateDefinitions", "Bool"
    static var swiftType: String { get }

    /// The field category for organization.
    static var category: FieldCategory { get }

    /// Boolean format for boolean fields (nil for non-boolean fields).
    ///
    /// - Objective-C format: "YES"/"NO" strings (HiddenFromChooser, HiddenFromLibrary)
    /// - Swift format: true/false booleans (Concrete, LocalizedByDefault, etc.)
    static var booleanFormat: BooleanFormat? { get }

    /// Validation rules for this field (nil if no special validation).
    static var validation: FieldValidation? { get }

    /// URL to detailed parsing rules documentation.
    static var parsingRulesUrl: String? { get }
}

// MARK: - Supporting Types

/// Field category for organizational purposes.
public enum FieldCategory: String, Codable {
    /// Required fields that must be present in every template.
    ///
    /// Fields: Identifier, Kind, Description
    case required

    /// Fields that define template structure and file creation.
    ///
    /// Fields: Nodes, Definitions
    case structure

    /// Fields related to template inheritance.
    ///
    /// Fields: Ancestors
    case inheritance

    /// Fields that define user input in template wizard.
    ///
    /// Fields: Options
    case userInput

    /// Fields that control template display in Xcode UI.
    ///
    /// Fields: Summary, SortOrder, Icon, Image, Title, etc.
    case display

    /// Boolean flag fields.
    ///
    /// Fields: Concrete, HiddenFromChooser, HiddenFromLibrary,
    /// LocalizedByDefault, ProjectOnly, SupportsSwiftPackage, etc.
    case boolean

    /// Additional metadata fields.
    ///
    /// Fields: Platforms, AllowedTypes, BuildableType, PackageType, etc.
    case metadata

    /// Complex nested structure fields.
    ///
    /// Fields: Components, Targets, OptionConstraints, Project
    case complex
}

/// Boolean serialization format.
public enum BooleanFormat: String, Codable {
    /// Objective-C format: "YES"/"NO" strings.
    ///
    /// Used by: HiddenFromChooser, HiddenFromLibrary
    /// Serializes as: `<string>YES</string>` or `<string>NO</string>`
    case objectiveC

    /// Swift format: true/false XML booleans.
    ///
    /// Used by: Concrete, LocalizedByDefault, ProjectOnly, etc.
    /// Serializes as: `<true/>` or `<false/>`
    case swift
}

/// Validation rules for a field.
public struct FieldValidation: Codable {
    /// Regular expression pattern for string validation.
    public let pattern: String?

    /// Minimum length for string fields.
    public let minLength: Int?

    /// Maximum length for string fields.
    public let maxLength: Int?

    /// Whether this field's value must be globally unique.
    public let unique: Bool?

    /// Array of valid values (for enum-like fields).
    public let validValues: [String]?

    /// Minimum value for numeric fields.
    public let minValue: Int?

    /// Maximum value for numeric fields.
    public let maxValue: Int?
}

// MARK: - Field Metadata Container

extension TemplateMetadata {
    /// Container for all field metadata types.
    public enum Fields {}
}

// MARK: - Example Field Implementations

extension TemplateMetadata.Fields {
    /// Metadata for the Identifier field.
    public struct Identifier: TemplateFieldMetadata {
        public static let fieldName = "identifier"
        public static let plistKey = "Identifier"
        public static let displayName = "Identifier"
        public static let swiftType = "String"
        public static let category: FieldCategory = .required
        public static let isRequired = true
        public static let booleanFormat: BooleanFormat? = nil

        public static let fieldDescription = """
        Unique template identifier in reverse DNS notation. Must be globally unique \
        across all installed templates. Critical for template loading and inheritance.

        The identifier is used to:
        - Uniquely identify this template in Xcode's template system
        - Reference this template in Ancestors arrays for inheritance
        - Prevent conflicts with other templates

        Failure to use a unique identifier will cause silent template failures where \
        one template overrides another.
        """

        public static let examples = [
            "com.apple.dt.unit.multiPlatform.app",
            "com.apple.dt.unit.applicationBase",
            "com.company.template.mvvm-view",
            "org.project.fileTemplate.swiftui-screen",
        ]

        public static let validation: FieldValidation? = FieldValidation(
            pattern: "^[a-z][a-z0-9]*(\\.[a-z][a-z0-9-]*)+$",
            minLength: 10,
            maxLength: nil,
            unique: true,
            validValues: nil,
            minValue: nil,
            maxValue: nil
        )

        public static let parsingRulesUrl: String? = "field-parsing-rules/Identifier.md"
    }

    /// Metadata for the Kind field.
    public struct Kind: TemplateFieldMetadata {
        public static let fieldName = "kind"
        public static let plistKey = "Kind"
        public static let displayName = "Template Kind"
        public static let swiftType = "TemplateKind"
        public static let category: FieldCategory = .required
        public static let isRequired = true
        public static let booleanFormat: BooleanFormat? = nil

        public static let fieldDescription = """
        Template type specification. Determines whether this is a file template or \
        project template, and controls which additional fields are required/valid.

        Valid values:
        - Xcode.IDEFoundation.TextSubstitutionFileTemplateKind (File templates)
        - Xcode.Xcode3.ProjectTemplateUnitKind (Project templates)

        The Kind field:
        - Determines template category in Xcode UI
        - Controls which fields are valid (e.g., Targets only valid for project templates)
        - Can be inherited from ancestor templates
        """

        public static let examples = [
            "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind",
            "Xcode.Xcode3.ProjectTemplateUnitKind",
            "com.apple.dt.unit.multiPlatform.app",
        ]

        public static let validation: FieldValidation? = FieldValidation(
            pattern: nil,
            minLength: nil,
            maxLength: nil,
            unique: false,
            validValues: [
                "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind",
                "Xcode.Xcode3.ProjectTemplateUnitKind",
            ],
            minValue: nil,
            maxValue: nil
        )

        public static let parsingRulesUrl: String? = "field-parsing-rules/Kind.md"
    }

    /// Metadata for the Platforms field.
    public struct Platforms: TemplateFieldMetadata {
        public static let fieldName = "platforms"
        public static let plistKey = "Platforms"
        public static let displayName = "Supported Platforms"
        public static let swiftType = "[Platform]"
        public static let category: FieldCategory = .metadata
        public static let isRequired = false
        public static let booleanFormat: BooleanFormat? = nil

        public static let fieldDescription = """
        Array of platform identifiers that this template supports. Restricts template \
        availability to specific platforms in Xcode's template chooser.

        When specified:
        - Template only appears when creating projects for listed platforms
        - Omitting this field makes template available for all platforms
        - Can be inherited and merged from ancestor templates

        Common use cases:
        - Platform-specific templates (iOS-only, macOS-only)
        - Multi-platform templates explicitly listing supported platforms
        - Excluding certain platforms from template availability
        """

        public static let examples = [
            "[\"com.apple.platform.iphoneos\", \"com.apple.platform.macosx\"]",
            "[\"com.apple.platform.iphoneos\"]",
            "[\"com.apple.platform.xros\"]",
            "[\"com.apple.platform.iphoneos\", \"com.apple.platform.appletvos\", \"com.apple.platform.watchos\"]",
        ]

        public static let validation: FieldValidation? = FieldValidation(
            pattern: nil,
            minLength: nil,
            maxLength: nil,
            unique: false,
            validValues: [
                "com.apple.platform.iphoneos",
                "com.apple.platform.macosx",
                "com.apple.platform.appletvos",
                "com.apple.platform.watchos",
                "com.apple.platform.xros",
                "com.apple.platform.maccatalyst",
            ],
            minValue: nil,
            maxValue: nil
        )

        public static let parsingRulesUrl: String? = nil // TODO: Create parsing rules
    }

    /// Metadata for the HiddenFromChooser field.
    public struct HiddenFromChooser: TemplateFieldMetadata {
        public static let fieldName = "hiddenFromChooser"
        public static let plistKey = "HiddenFromChooser"
        public static let displayName = "Hidden From Chooser"
        public static let swiftType = "Bool"
        public static let category: FieldCategory = .boolean
        public static let isRequired = false
        public static let booleanFormat: BooleanFormat? = .objectiveC

        public static let fieldDescription = """
        Hides template from Xcode's template chooser UI. Used for base templates or \
        internal templates that should only be used via inheritance.

        When set to YES:
        - Template does not appear in Xcode's New File/Project dialog
        - Template can still be referenced in Ancestors arrays
        - Typically used for abstract base templates

        Note: Uses Objective-C boolean format ("YES"/"NO" strings) for historical reasons.
        """

        public static let examples = [
            "YES",
            "NO",
        ]

        public static let validation: FieldValidation? = FieldValidation(
            pattern: nil,
            minLength: nil,
            maxLength: nil,
            unique: false,
            validValues: ["YES", "NO"],
            minValue: nil,
            maxValue: nil
        )

        public static let parsingRulesUrl: String? = nil // TODO: Create parsing rules
    }

    /// Metadata for the Concrete field.
    public struct Concrete: TemplateFieldMetadata {
        public static let fieldName = "concrete"
        public static let plistKey = "Concrete"
        public static let displayName = "Concrete Template"
        public static let swiftType = "Bool"
        public static let category: FieldCategory = .boolean
        public static let isRequired = false
        public static let booleanFormat: BooleanFormat? = .swift

        public static let fieldDescription = """
        Whether template is concrete (user-selectable) vs abstract (inheritance only).

        When set to false:
        - Template is abstract (similar to HiddenFromChooser)
        - Used only as a base for other templates
        - Cannot be instantiated directly

        When set to true or omitted:
        - Template appears in Xcode's chooser
        - Can be instantiated directly by users

        Note: Uses Swift boolean format (true/false) unlike HiddenFromChooser.
        """

        public static let examples = [
            "true",
            "false",
        ]

        public static let validation: FieldValidation? = nil

        public static let parsingRulesUrl: String? = nil // TODO: Create parsing rules
    }

    // TODO: Implement metadata for remaining 28 fields:
    // - description
    // - summary
    // - ancestors
    // - options
    // - nodes
    // - definitions
    // - targets
    // - components
    // - optionConstraints
    // - allowedTypes
    // - sortOrder
    // - buildableType
    // - defaultCompletionName
    // - hiddenFromLibrary
    // - icon
    // - image
    // - mainTemplateFile
    // - templateName
    // - nameOfInitialFileForEditor
    // - packageType
    // - project
    // - localizedByDefault
    // - projectOnly
    // - supportsSwiftPackage
    // - suppressTopLevelGroup
    // - targetOnly
    // - title
    // - associatedTargetSpecification
}

// MARK: - Metadata Access Utilities

/// Provides access to all field metadata.
public enum TemplateFieldMetadataRegistry {
    /// All registered field metadata types.
    public static let allFields: [any TemplateFieldMetadata.Type] = [
        TemplateMetadata.Fields.Identifier.self,
        TemplateMetadata.Fields.Kind.self,
        TemplateMetadata.Fields.Platforms.self,
        TemplateMetadata.Fields.HiddenFromChooser.self,
        TemplateMetadata.Fields.Concrete.self,
        // TODO: Add remaining fields
    ]

    /// Get field metadata by internal field name.
    public static func field(named name: String) -> (any TemplateFieldMetadata.Type)? {
        allFields.first { $0.fieldName == name }
    }

    /// Get field metadata by plist key.
    public static func field(plistKey: String) -> (any TemplateFieldMetadata.Type)? {
        allFields.first { $0.plistKey == plistKey }
    }

    /// Get all required fields.
    public static var requiredFields: [any TemplateFieldMetadata.Type] {
        allFields.filter(\.isRequired)
    }

    /// Get fields by category.
    public static func fields(in category: FieldCategory) -> [any TemplateFieldMetadata.Type] {
        allFields.filter { $0.category == category }
    }
}

// MARK: - JSON Export

/// JSON representation of field metadata for export.
public struct FieldMetadataJSON: Codable {
    public let version: String
    public let generatedAt: String
    public let fields: [FieldJSON]

    public struct FieldJSON: Codable {
        public let fieldName: String
        public let plistKey: String
        public let displayName: String
        public let swiftType: String
        public let category: String
        public let isRequired: Bool
        public let description: String
        public let examples: [String]
        public let booleanFormat: String?
        public let validation: FieldValidation?
        public let parsingRulesUrl: String?
    }

    /// Generate JSON from all registered fields.
    public static func generate() -> FieldMetadataJSON {
        let fields = TemplateFieldMetadataRegistry.allFields.map { field in
            FieldJSON(
                fieldName: field.fieldName,
                plistKey: field.plistKey,
                displayName: field.displayName,
                swiftType: field.swiftType,
                category: field.category.rawValue,
                isRequired: field.isRequired,
                description: field.fieldDescription,
                examples: field.examples,
                booleanFormat: field.booleanFormat?.rawValue,
                validation: field.validation,
                parsingRulesUrl: field.parsingRulesUrl
            )
        }

        return FieldMetadataJSON(
            version: "1.0",
            generatedAt: ISO8601DateFormatter().string(from: Date()),
            fields: fields
        )
    }
}
