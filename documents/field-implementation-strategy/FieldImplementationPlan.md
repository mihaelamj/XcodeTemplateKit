# Field Implementation Plan - Complete Analysis

## Objective

1. **Audit all fields** for complete implementation
2. **Convert string fields to enums** where appropriate
3. **Create field metadata system** with descriptions and examples accessible via protocol
4. **Store metadata in JSON** for easy access in UI and documentation
5. **Establish unique internal field names** for consistency

## Current State Analysis

### Fields Already Properly Typed (✅ Complete)

#### Enum Types Implemented
1. **TemplateKind** - 158+ cases, properly exhaustive
2. **BuildableType** - "None", "Test", "Hidden"
3. **PackageType** - swiftMacro, library, empty, commandPlugin, buildToolPlugin, unknown
4. **ImageSourceType** - FileTypeIcon, SystemSymbolName, BundleImageName, BundleIdentifier
5. **ProjectConfiguration** - Configurations, SharedSettings
6. **TemplateBooleanFormat** - objectiveCBoolean, swiftBoolean
7. **OptionType** - popup, checkbox, radio, text, staticValue

#### Well-Structured Types
8. **TemplateOptionJSON** - Complete with all subfields
9. **TemplateOptionUnit** - With components support
10. **TemplateOptionComponent** - Identifier + Name
11. **FileNode** - File structure representation

### Fields Currently as Strings (Need Enum Conversion)

#### 1. **AllowedTypes** (`[String]?`) - Currently line 340
**Problem:** Using raw strings for UTI types
**Should be:** Enum with known UTI types

```swift
public enum UniformTypeIdentifier: String, Codable {
    // Source Code
    case swiftSource = "public.swift-source"
    case objectiveCSource = "public.objective-c-source"
    case cSource = "public.c-source"
    case cPlusPlusSource = "public.c-plus-plus-source"
    case headerFile = "public.c-header"

    // Assets
    case image = "public.image"
    case audio = "public.audio"
    case video = "public.movie"

    // Data
    case json = "public.json"
    case xml = "public.xml"
    case plist = "com.apple.property-list"

    // Other
    case unknown(String)
}
```

**Current:** `allowedTypes: [String]?`
**Proposed:** `allowedTypes: [UniformTypeIdentifier]?`

#### 2. **Platforms** (`[String]?`) - Currently line 346
**Problem:** Using raw strings for platform identifiers
**Should be:** Enum with known platforms

```swift
public enum Platform: String, Codable, CaseIterable {
    case iOS = "com.apple.platform.iphoneos"
    case macOS = "com.apple.platform.macosx"
    case tvOS = "com.apple.platform.appletvos"
    case watchOS = "com.apple.platform.watchos"
    case visionOS = "com.apple.platform.xros"
    case catalyst = "com.apple.platform.maccatalyst"
    case unknown(String)

    public var displayName: String {
        switch self {
        case .iOS: return "iOS"
        case .macOS: return "macOS"
        case .tvOS: return "tvOS"
        case .watchOS: return "watchOS"
        case .visionOS: return "visionOS"
        case .catalyst: return "Mac Catalyst"
        case .unknown(let value): return "Unknown (\(value))"
        }
    }
}
```

**Current:** `platforms: [String]?`
**Proposed:** `platforms: [Platform]?`

### Fields Currently as Data (Need Proper Types)

#### 3. **Components** (`Data?`) - Currently line 355
**Status:** ⚠️ Partially implemented (TemplateOptionComponent exists but field is Data)
**Problem:** Stored as opaque Data blob
**Should be:** Proper structured type

```swift
public struct TemplateComponents: Codable {
    public let components: [ComponentDefinition]
}

public struct ComponentDefinition: Codable {
    public let identifier: String
    public let name: String
    public let nodes: [String]?
    public let definitions: [String: FileDefinition]?
    public let targets: [TargetDefinition]?
}
```

**Current:** `components: Data?`
**Proposed:** `components: TemplateComponents?`

#### 4. **Targets** (`Data?`) - Currently line 359
**Status:** ❌ Not implemented
**Problem:** Stored as opaque Data blob
**Should be:** Proper structured type

```swift
public struct TemplateTargets: Codable {
    public let targets: [TargetDefinition]
}

public struct TargetDefinition: Codable {
    public let name: String
    public let productType: ProductType
    public let buildPhases: [BuildPhase]?
    public let dependencies: [String]?
    public let buildSettings: [String: BuildSettingValue]?
}

public enum ProductType: String, Codable {
    case application = "com.apple.product-type.application"
    case framework = "com.apple.product-type.framework"
    case staticLibrary = "com.apple.product-type.library.static"
    case dynamicLibrary = "com.apple.product-type.library.dynamic"
    case bundle = "com.apple.product-type.bundle"
    case unitTestBundle = "com.apple.product-type.bundle.unit-test"
    case uiTestBundle = "com.apple.product-type.bundle.ui-testing"
    case appExtension = "com.apple.product-type.app-extension"
    case unknown(String)
}

public struct BuildPhase: Codable {
    public let type: BuildPhaseType
    public let files: [String]?
}

public enum BuildPhaseType: String, Codable {
    case sources = "Sources"
    case frameworks = "Frameworks"
    case resources = "Resources"
    case copyFiles = "CopyFiles"
    case runScript = "ShellScript"
    case headers = "Headers"
}

public enum BuildSettingValue: Codable {
    case string(String)
    case array([String])
    case bool(Bool)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let array = try? container.decode([String].self) {
            self = .array(array)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else {
            throw DecodingError.typeMismatch(
                BuildSettingValue.self,
                DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected String, Array, or Bool")
            )
        }
    }
}
```

**Current:** `targets: Data?`
**Proposed:** `targets: TemplateTargets?`

#### 5. **Definitions** (`Data?`) - Currently line 363
**Status:** ❌ Not implemented
**Problem:** Stored as opaque Data blob
**Should be:** Proper structured type

```swift
public struct TemplateDefinitions: Codable {
    public let definitions: [String: FileDefinition]
}

public struct FileDefinition: Codable {
    public let path: String?
    public let group: FileGroup?
    public let targetIndices: [Int]?
    public let beginning: String?
    public let end: String?
    public let sortOrder: Int?
}

public enum FileGroup: Codable {
    case single(String)
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
                DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected String or Array")
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
```

**Current:** `definitions: Data?`
**Proposed:** `definitions: TemplateDefinitions?`

#### 6. **OptionConstraints** (`Data?`) - Currently line 367
**Status:** ❌ Not implemented
**Problem:** Stored as opaque Data blob
**Should be:** Proper structured type

```swift
public struct TemplateOptionConstraints: Codable {
    public let constraints: [OptionConstraint]
}

public struct OptionConstraint: Codable {
    public let identifier: String
    public let requiredOptions: [String: String]?
    public let disabledWhen: [String: String]?
    public let hiddenWhen: [String: String]?
}
```

**Current:** `optionConstraints: Data?`
**Proposed:** `optionConstraints: TemplateOptionConstraints?`

### Simple String Fields (Properly Typed)

These are correctly String types:
- **identifier** (via kind) - ✅ Unique template ID
- **name** - ✅ Template name
- **path** - ✅ File system path
- **description** - ✅ User-facing description
- **summary** - ✅ Brief summary
- **associatedTargetSpecification** - ✅ Target spec ID
- **defaultCompletionName** - ✅ Default filename
- **icon** - ✅ Icon filename
- **mainTemplateFile** - ✅ Main file path
- **templateName** - ✅ Display name override
- **nameOfInitialFileForEditor** - ✅ Initial file to open
- **title** - ✅ Template title
- **nodes** - ✅ File paths (keep as `[String]` - contains placeholders)

### Boolean Fields (Properly Typed)

All correctly Bool:
- **hiddenFromChooser** - ✅
- **hiddenFromLibrary** - ✅
- **concrete** - ✅
- **localizedByDefault** - ✅
- **projectOnly** - ✅
- **supportsSwiftPackage** - ✅
- **suppressTopLevelGroup** - ✅
- **targetOnly** - ✅

### Integer Fields (Properly Typed)

- **sortOrder** - ✅
- **totalCombinations** - ✅

## Proposed Field Metadata System

### 1. Protocol Definition

```swift
/// Provides metadata about a template field including description and examples.
public protocol TemplateFieldMetadata {
    /// The unique internal field name (matches JSON key).
    static var fieldName: String { get }

    /// The display name shown in UI.
    static var displayName: String { get }

    /// Detailed description of what this field does.
    static var fieldDescription: String { get }

    /// Example value(s) for this field.
    static var examples: [String] { get }

    /// Whether this field is required in templates.
    static var isRequired: Bool { get }

    /// Which boolean format this field uses (if applicable).
    static var booleanFormat: TemplateBooleanFormat.Type? { get }

    /// Field type category.
    static var category: FieldCategory { get }
}

public enum FieldCategory {
    case required           // Identifier, Kind, Description
    case structure          // Nodes, Definitions
    case inheritance        // Ancestors
    case userInput          // Options
    case display            // Summary, SortOrder, etc.
    case boolean            // All boolean flags
    case metadata           // Additional info
    case complex            // Components, Targets, etc.
}
```

### 2. Field Metadata Implementations

```swift
extension TemplateMetadata {
    public enum Fields {}
}

extension TemplateMetadata.Fields {
    public struct Identifier: TemplateFieldMetadata {
        public static let fieldName = "identifier"
        public static let displayName = "Identifier"
        public static let fieldDescription = """
            Unique template identifier in reverse DNS notation. Must be globally unique \
            across all installed templates. Critical for template loading and inheritance.
            """
        public static let examples = [
            "com.apple.dt.unit.multiPlatform.app",
            "com.company.template.mvvm-view",
            "org.project.fileTemplate.swiftui-screen"
        ]
        public static let isRequired = true
        public static let booleanFormat: TemplateBooleanFormat.Type? = nil
        public static let category: FieldCategory = .required
    }

    public struct Kind: TemplateFieldMetadata {
        public static let fieldName = "kind"
        public static let displayName = "Kind"
        public static let fieldDescription = """
            Template type specification. Determines whether this is a file template or \
            project template, and controls which additional fields are required/valid.
            """
        public static let examples = [
            "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind",
            "Xcode.Xcode3.ProjectTemplateUnitKind"
        ]
        public static let isRequired = true
        public static let booleanFormat: TemplateBooleanFormat.Type? = nil
        public static let category: FieldCategory = .required
    }

    public struct Description: TemplateFieldMetadata {
        public static let fieldName = "description"
        public static let displayName = "Description"
        public static let fieldDescription = """
            User-facing description shown in Xcode template chooser dialog. Should be \
            concise (1-2 sentences) and describe what the template creates.
            """
        public static let examples = [
            "A SwiftUI view with an observable view model following MVVM architecture.",
            "Creates a Codable model with JSON encoding/decoding support.",
            "Swift file with basic structure and import statements."
        ]
        public static let isRequired = true
        public static let booleanFormat: TemplateBooleanFormat.Type? = nil
        public static let category: FieldCategory = .required
    }

    // ... Continue for all fields
}
```

### 3. JSON Metadata Storage

```json
{
  "templateFields": [
    {
      "fieldName": "identifier",
      "displayName": "Identifier",
      "category": "required",
      "type": "String",
      "isRequired": true,
      "description": "Unique template identifier in reverse DNS notation. Must be globally unique across all installed templates. Critical for template loading and inheritance.",
      "examples": [
        "com.apple.dt.unit.multiPlatform.app",
        "com.company.template.mvvm-view",
        "org.project.fileTemplate.swiftui-screen"
      ],
      "validation": {
        "pattern": "^[a-z][a-z0-9]*(\\.[a-z][a-z0-9-]*)+$",
        "minLength": 10,
        "unique": true
      },
      "parsingRulesUrl": "documents/field-parsing-rules/Identifier.md"
    },
    {
      "fieldName": "kind",
      "displayName": "Kind",
      "category": "required",
      "type": "TemplateKind",
      "isRequired": true,
      "description": "Template type specification. Determines whether this is a file template or project template.",
      "examples": [
        "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind",
        "Xcode.Xcode3.ProjectTemplateUnitKind"
      ],
      "validValues": [
        "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind",
        "Xcode.Xcode3.ProjectTemplateUnitKind"
      ],
      "parsingRulesUrl": "documents/field-parsing-rules/Kind.md"
    },
    {
      "fieldName": "platforms",
      "displayName": "Platforms",
      "category": "metadata",
      "type": "[Platform]",
      "isRequired": false,
      "description": "Array of platform identifiers that this template supports. Restricts template availability to specific platforms.",
      "examples": [
        ["com.apple.platform.iphoneos", "com.apple.platform.macosx"],
        ["com.apple.platform.iphoneos"],
        ["com.apple.platform.xros"]
      ],
      "validValues": [
        "com.apple.platform.iphoneos",
        "com.apple.platform.macosx",
        "com.apple.platform.appletvos",
        "com.apple.platform.watchos",
        "com.apple.platform.xros",
        "com.apple.platform.maccatalyst"
      ]
    },
    {
      "fieldName": "allowedTypes",
      "displayName": "Allowed Types",
      "category": "metadata",
      "type": "[UniformTypeIdentifier]",
      "isRequired": false,
      "description": "Array of UTI types that restrict where this template can be used.",
      "examples": [
        ["public.swift-source"],
        ["public.objective-c-source", "public.c-source"]
      ],
      "validValues": [
        "public.swift-source",
        "public.objective-c-source",
        "public.c-source",
        "public.c-plus-plus-source",
        "public.c-header",
        "public.image",
        "public.audio",
        "public.movie",
        "public.json",
        "public.xml",
        "com.apple.property-list"
      ]
    },
    {
      "fieldName": "hiddenFromChooser",
      "displayName": "Hidden From Chooser",
      "category": "boolean",
      "type": "Bool",
      "isRequired": false,
      "booleanFormat": "objectiveC",
      "description": "Hides template from Xcode's template chooser UI. Used for base templates or internal templates.",
      "examples": ["YES", "NO"],
      "serialization": {
        "format": "string",
        "trueValue": "YES",
        "falseValue": "NO"
      }
    },
    {
      "fieldName": "concrete",
      "displayName": "Concrete",
      "category": "boolean",
      "type": "Bool",
      "isRequired": false,
      "booleanFormat": "swift",
      "description": "Whether template is concrete (user-selectable) vs abstract (inheritance only).",
      "examples": ["true", "false"],
      "serialization": {
        "format": "boolean",
        "trueValue": "<true/>",
        "falseValue": "<false/>"
      }
    }
  ]
}
```

## Implementation Plan

### Phase 1: Enum Conversions (High Priority)

**Goal:** Convert string arrays to proper enum types

1. ✅ Create `Platform` enum
2. ✅ Create `UniformTypeIdentifier` enum
3. ✅ Update `TemplateMetadata.platforms` type
4. ✅ Update `TemplateMetadata.allowedTypes` type
5. ✅ Update all parsing code
6. ✅ Update all test fixtures
7. ✅ Run tests to verify

**Estimated Impact:** ~300 lines of code, 33 test files to update

### Phase 2: Complex Type Implementations (High Priority)

**Goal:** Replace Data fields with proper types

1. ✅ Implement `TemplateDefinitions` + `FileDefinition`
2. ✅ Implement `TemplateTargets` + `TargetDefinition` + related types
3. ✅ Implement `TemplateComponents` + `ComponentDefinition`
4. ✅ Implement `TemplateOptionConstraints` + `OptionConstraint`
5. ✅ Update `TemplateMetadata` field types
6. ✅ Update parsing/serialization logic
7. ✅ Create comprehensive tests

**Estimated Impact:** ~800 lines of code, new test coverage needed

### Phase 3: Field Metadata System (Medium Priority)

**Goal:** Create metadata system for UI/documentation

1. ✅ Define `TemplateFieldMetadata` protocol
2. ✅ Create field metadata implementations for all 33 fields
3. ✅ Generate JSON metadata file
4. ✅ Create loading/access utilities
5. ✅ Integrate with UI components
6. ✅ Update documentation generator

**Estimated Impact:** ~600 lines of code, JSON file generation

### Phase 4: Documentation & Testing (Medium Priority)

**Goal:** Complete parsing rules and tests

1. ✅ Complete remaining field parsing rules (7/33 done)
2. ✅ Generate parser tests from metadata
3. ✅ Generate generator tests from metadata
4. ✅ Create round-trip tests
5. ✅ Update field-parsing-rules README

**Estimated Impact:** 26 new .md files, test generation scripts

### Phase 5: Point-Free Parsing Integration (Low Priority)

**Goal:** Use composable parsers for complex fields

1. ⏳ Add swift-parsing dependency
2. ⏳ Create parser/printer for Targets
3. ⏳ Create parser/printer for Components
4. ⏳ Create parser/printer for Definitions
5. ⏳ Create parser/printer for OptionConstraints
6. ⏳ Integration tests

**Estimated Impact:** ~400 lines of parsing code

## Summary of Incomplete Fields

| Field | Current Type | Proposed Type | Status | Priority |
|-------|--------------|---------------|--------|----------|
| `platforms` | `[String]?` | `[Platform]?` | ❌ String array | HIGH |
| `allowedTypes` | `[String]?` | `[UniformTypeIdentifier]?` | ❌ String array | HIGH |
| `definitions` | `Data?` | `TemplateDefinitions?` | ❌ Opaque blob | HIGH |
| `targets` | `Data?` | `TemplateTargets?` | ❌ Opaque blob | HIGH |
| `components` | `Data?` | `TemplateComponents?` | ⚠️ Partial | HIGH |
| `optionConstraints` | `Data?` | `TemplateOptionConstraints?` | ❌ Opaque blob | MEDIUM |

## Fields Without Metadata (Need Protocol Implementation)

All 33 fields need `TemplateFieldMetadata` protocol implementation:

### Required Fields (3)
- ✅ identifier - Has parsing rules
- ✅ kind - Has parsing rules
- ✅ description - Has parsing rules

### Optional Fields (30)
- ✅ ancestors - Has parsing rules
- ✅ options - Has parsing rules
- ✅ nodes - Has parsing rules
- ✅ definitions - Has parsing rules
- ✅ units - Has parsing rules
- ⏳ summary - Need parsing rules
- ⏳ platforms - Need parsing rules (and enum conversion)
- ⏳ allowedTypes - Need parsing rules (and enum conversion)
- ⏳ sortOrder - Need parsing rules
- ⏳ concrete - Need parsing rules
- ⏳ hiddenFromChooser - Need parsing rules
- ⏳ hiddenFromLibrary - Need parsing rules
- ⏳ name - Need parsing rules
- ⏳ mainTemplateFile - Need parsing rules
- ⏳ components - Need parsing rules (and type implementation)
- ⏳ targets - Need parsing rules (and type implementation)
- ⏳ optionConstraints - Need parsing rules (and type implementation)
- ⏳ All remaining fields...

## Next Steps

1. **Agree on field names** - Establish JSON field naming convention
2. **Create Platform enum** - Implement with all Apple platforms
3. **Create UniformTypeIdentifier enum** - Implement with common UTIs
4. **Implement complex types** - Definitions, Targets, Components, OptionConstraints
5. **Create TemplateFieldMetadata protocol** - Design metadata system
6. **Generate JSON metadata** - Export all field metadata to JSON
7. **Complete parsing rules** - Write remaining 26 field documentation files
8. **Generate tests** - Auto-generate tests from metadata
9. **UI integration** - Use metadata in SwiftUI views
10. **Point-Free parsing** - Integrate for complex field types

## Expected Benefits

1. **Type Safety** - Compile-time guarantees instead of runtime string checks
2. **Autocomplete** - IDE suggestions for platform names, UTI types
3. **Documentation** - Field metadata accessible programmatically
4. **UI Generation** - Field editors generated from metadata
5. **Validation** - Automatic validation from metadata rules
6. **Testing** - Auto-generated tests from field specifications
7. **Maintainability** - Single source of truth for field information
