# Field Incompletion Audit

## Current Status: 33 Fields Total

### ✅ Fully Complete (13 fields)

These fields have proper types and don't need changes:

1. **identifier** - String (derived from kind) - Unique template ID
2. **name** - String - Template display name
3. **path** - String - File system path
4. **kind** - TemplateKind enum (158+ cases) - Template type
5. **buildableType** - BuildableType enum (None/Test/Hidden)
6. **packageType** - PackageType enum (swiftMacro/library/etc)
7. **image** - ImageSourceType enum (FileTypeIcon/SystemSymbolName/etc)
8. **project** - ProjectConfiguration enum (Configurations/SharedSettings)
9. **sortOrder** - Int - Display order
10. **totalCombinations** - Int - Option combinations count
11. All **boolean fields** (8 fields): hiddenFromChooser, hiddenFromLibrary, concrete, localizedByDefault, projectOnly, supportsSwiftPackage, suppressTopLevelGroup, targetOnly
12. All **simple string fields** (10 fields): description, summary, associatedTargetSpecification, defaultCompletionName, icon, mainTemplateFile, templateName, nameOfInitialFileForEditor, title

### ⚠️ Partially Complete (2 fields)

**Problems:**
- Using strings instead of enums
- Lose type safety and autocomplete
- No validation of values

#### 1. platforms: [String]?
**Current:** Array of raw platform identifier strings
**Examples:**
```swift
platforms: ["com.apple.platform.iphoneos", "com.apple.platform.macosx"]
```

**Should be:**
```swift
public enum Platform: String, Codable {
    case iOS = "com.apple.platform.iphoneos"
    case macOS = "com.apple.platform.macosx"
    case tvOS = "com.apple.platform.appletvos"
    case watchOS = "com.apple.platform.watchos"
    case visionOS = "com.apple.platform.xros"
    case catalyst = "com.apple.platform.maccatalyst"
    case unknown(String)
}

platforms: [Platform]?
```

#### 2. allowedTypes: [String]?
**Current:** Array of raw UTI strings
**Examples:**
```swift
allowedTypes: ["public.swift-source", "public.objective-c-source"]
```

**Should be:**
```swift
public enum UniformTypeIdentifier: String, Codable {
    case swiftSource = "public.swift-source"
    case objectiveCSource = "public.objective-c-source"
    case cSource = "public.c-source"
    case cPlusPlusSource = "public.c-plus-plus-source"
    case headerFile = "public.c-header"
    case image = "public.image"
    case json = "public.json"
    case xml = "public.xml"
    case plist = "com.apple.property-list"
    case unknown(String)
}

allowedTypes: [UniformTypeIdentifier]?
```

### ❌ Incomplete (4 fields)

**Problems:**
- Stored as opaque `Data` blobs
- Cannot be inspected or modified programmatically
- No type safety
- Cannot serialize/deserialize properly

#### 3. definitions: Data?
**Current:** Opaque Data blob
**Should be:**
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
}

definitions: TemplateDefinitions?
```

**Usage in templates:**
Defines where files are placed and which targets they belong to.
```xml
<key>Definitions</key>
<dict>
    <key>___FILEBASENAME___.swift</key>
    <dict>
        <key>Path</key>
        <string>Sources/___FILEBASENAME___.swift</string>
        <key>Group</key>
        <string>Sources</string>
        <key>TargetIndices</key>
        <array>
            <integer>0</integer>
        </array>
    </dict>
</dict>
```

#### 4. targets: Data?
**Current:** Opaque Data blob
**Should be:**
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
}

targets: TemplateTargets?
```

**Usage in templates:**
Defines build targets for project templates.

#### 5. components: Data?
**Current:** Opaque Data blob
**Partially exists:** `TemplateOptionComponent` defined but field is still Data
**Should be:**
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

components: TemplateComponents?
```

**Usage in templates:**
Reusable template components that can be composed.

#### 6. optionConstraints: Data?
**Current:** Opaque Data blob
**Should be:**
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

optionConstraints: TemplateOptionConstraints?
```

**Usage in templates:**
Defines when options should be shown/hidden/enabled/disabled based on other option values.

### 🔧 Need Metadata Protocol (All 33 fields)

**Problem:**
- No programmatic way to get field descriptions
- No examples available in code
- Cannot generate UI from field metadata
- Cannot auto-generate tests from field specs

**Solution:**
Create `TemplateFieldMetadata` protocol and JSON storage.

## Priority Order

### Phase 1: Enum Conversions (HIGH - Quick wins)
1. Create `Platform` enum
2. Create `UniformTypeIdentifier` enum
3. Update `TemplateMetadata.platforms` type
4. Update `TemplateMetadata.allowedTypes` type
5. Update parsing/serialization code
6. Update tests

**Impact:** Immediate type safety, better autocomplete, validation
**Effort:** ~2-3 hours
**Files affected:** ~5 source files, ~33 test files

### Phase 2: Complex Type Implementation (HIGH - Big impact)
1. Implement `TemplateDefinitions` + `FileDefinition` + `FileGroup`
2. Implement `TemplateTargets` + all related types
3. Implement `TemplateComponents` + `ComponentDefinition`
4. Implement `TemplateOptionConstraints` + `OptionConstraint`
5. Update `TemplateMetadata` to use new types
6. Update parser to decode properly
7. Update generator to encode properly
8. Create comprehensive tests

**Impact:** Full type safety for complex fields, proper serialization
**Effort:** ~1-2 days
**Files affected:** ~10 source files, extensive new tests

### Phase 3: Field Metadata System (MEDIUM - Nice to have)
1. Design `TemplateFieldMetadata` protocol
2. Implement metadata for all 33 fields
3. Generate JSON metadata file
4. Create metadata access utilities
5. Integrate with UI
6. Generate documentation from metadata

**Impact:** Programmatic field info, auto-generated UI/docs/tests
**Effort:** ~1 day
**Files affected:** ~5 source files, 1 JSON file, UI updates

### Phase 4: Complete Documentation (MEDIUM)
1. Write parsing rules for remaining 26 fields
2. Update README in field-parsing-rules
3. Link metadata to parsing rules

**Impact:** Complete documentation coverage
**Effort:** ~1 day
**Files affected:** 26 new .md files

### Phase 5: Point-Free Parsing (LOW - Optional enhancement)
1. Add swift-parsing dependency
2. Create composable parsers for complex types
3. Replace manual decoding with parser/printer approach

**Impact:** More robust parsing, better error messages, bidirectional
**Effort:** ~1-2 days
**Files affected:** Parser implementation

## Field Naming Convention

### Internal Field Names (JSON keys)
Use camelCase matching Swift property names:
- `identifier`
- `kind`
- `description`
- `platforms`
- `allowedTypes`
- `hiddenFromChooser`
- `concrete`
- etc.

### Plist Keys (TemplateInfo.plist)
Use UpperCamelCase (Xcode convention):
- `Identifier`
- `Kind`
- `Description`
- `Platforms`
- `AllowedTypes`
- `HiddenFromChooser`
- `Concrete`
- etc.

### Display Names (UI)
Use human-readable titles:
- "Identifier"
- "Template Kind"
- "Description"
- "Supported Platforms"
- "Allowed Types"
- "Hidden From Chooser"
- "Concrete Template"
- etc.

## Metadata JSON Structure

```json
{
  "version": "1.0",
  "fields": [
    {
      "fieldName": "identifier",
      "plistKey": "Identifier",
      "displayName": "Identifier",
      "type": "String",
      "category": "required",
      "isRequired": true,
      "description": "Unique template identifier in reverse DNS notation.",
      "examples": [
        "com.apple.dt.unit.multiPlatform.app",
        "com.company.template.mvvm-view"
      ],
      "validation": {
        "pattern": "^[a-z][a-z0-9]*(\\.[a-z][a-z0-9-]*)+$",
        "minLength": 10,
        "unique": true
      },
      "parsingRulesUrl": "field-parsing-rules/Identifier.md"
    }
  ]
}
```

## Summary Table

| Field | Current Type | Target Type | Status | Priority | Effort |
|-------|--------------|-------------|--------|----------|--------|
| platforms | `[String]?` | `[Platform]?` | ⚠️ Partial | HIGH | Low |
| allowedTypes | `[String]?` | `[UniformTypeIdentifier]?` | ⚠️ Partial | HIGH | Low |
| definitions | `Data?` | `TemplateDefinitions?` | ❌ Incomplete | HIGH | Medium |
| targets | `Data?` | `TemplateTargets?` | ❌ Incomplete | HIGH | High |
| components | `Data?` | `TemplateComponents?` | ❌ Incomplete | HIGH | Medium |
| optionConstraints | `Data?` | `TemplateOptionConstraints?` | ❌ Incomplete | MEDIUM | Low |
| All 33 fields | Various | +Metadata | 🔧 Need Protocol | MEDIUM | Medium |

**Total Incomplete:** 6 fields need type improvements
**Total Need Metadata:** 33 fields need metadata protocol
