# Template Property Analysis

**Generated:** 2025-11-19
**Purpose:** Document all available Xcode template properties and identify gaps in our implementation

## Executive Summary

- **Total Templates Analyzed:** 146
- **Unique Plist Keys Found:** 30
- **Currently Captured Fields:** 9
- **Missing/Unimplemented Fields:** 21
- **Coverage:** 30% of available metadata

## Currently Implemented Fields

Our `TemplateMetadata` struct currently captures:

| Field | Source Plist Key | Frequency | Status |
|-------|-----------------|-----------|--------|
| `id` | (derived from path) | 146/146 | ✅ Implemented |
| `name` | (derived from path) | 146/146 | ✅ Implemented |
| `path` | (file system) | 146/146 | ✅ Implemented |
| `kind` | `Identifier` or `Kind` | 146/146 | ✅ Implemented |
| `ancestors` | `Ancestors` | 66/146 | ✅ Implemented |
| `options` | `Options` | 76/146 | ✅ Implemented |
| `totalCombinations` | (computed) | 146/146 | ✅ Implemented |
| `fileStructure` | (file system scan) | 146/146 | ✅ Implemented |
| `rawContent` | (raw plist text) | 146/146 | ✅ Implemented |
| `rawContentType` | (detected format) | 146/146 | ✅ Implemented |

## All Available Plist Keys

Complete analysis of 146 templates:

| Plist Key | Frequency | Description | Priority |
|-----------|-----------|-------------|----------|
| **Kind** | 146/146 | Template type category | ✅ **Captured** |
| **Identifier** | 88/146 | Unique template ID (Project/Package only) | ✅ **Captured** |
| **Options** | 76/146 | User-configurable template options | ✅ **Captured** |
| **Description** | 72/146 | Detailed template description | 🔴 **Missing** - HIGH |
| **Ancestors** | 66/146 | Template inheritance chain | ✅ **Captured** |
| **Platforms** | 60/146 | Supported platforms (iOS, macOS, etc.) | 🔴 **Missing** - HIGH |
| **DefaultCompletionName** | 56/146 | Default file/class name | 🔴 **Missing** - MEDIUM |
| **Summary** | 53/146 | Short template summary | 🔴 **Missing** - MEDIUM |
| **Image** | 52/146 | Template icon/symbol | 🔴 **Missing** - LOW |
| **MainTemplateFile** | 50/146 | Primary template file path | 🔴 **Missing** - HIGH |
| **Targets** | 45/146 | Target configuration data | 🔴 **Missing** - HIGH |
| **Definitions** | 43/146 | Template variable definitions | 🔴 **Missing** - HIGH |
| **SortOrder** | 37/146 | Display order in Xcode | 🔴 **Missing** - LOW |
| **SupportsSwiftPackage** | 27/146 | Swift Package Manager support | 🔴 **Missing** - MEDIUM |
| **AllowedTypes** | 26/146 | Allowed file types | 🔴 **Missing** - MEDIUM |
| **Nodes** | 24/146 | Template node structure | 🔴 **Missing** - HIGH |
| **BuildableType** | 15/146 | Buildable target type | 🔴 **Missing** - MEDIUM |
| **Concrete** | 14/146 | Is concrete template (not base) | 🔴 **Missing** - LOW |
| **HiddenFromLibrary** | 10/146 | Hidden from template library | 🔴 **Missing** - LOW |
| **HiddenFromChooser** | 10/146 | Hidden from template chooser | 🔴 **Missing** - LOW |
| **Project** | 8/146 | Project-level configuration | 🔴 **Missing** - HIGH |
| **OptionConstraints** | 8/146 | Constraints on option combinations | 🔴 **Missing** - MEDIUM |
| **TargetOnly** | 7/146 | Target-only template flag | 🔴 **Missing** - LOW |
| **Title** | 6/146 | Template title override | 🔴 **Missing** - LOW |
| **NameOfInitialFileForEditor** | 6/146 | Initial file to open in editor | 🔴 **Missing** - LOW |
| **Name** | 6/146 | Template name override | 🔴 **Missing** - LOW |
| **Icon** | 6/146 | Icon file name | 🔴 **Missing** - LOW |
| **PackageType** | 5/146 | Swift Package type | 🔴 **Missing** - MEDIUM |
| **AssociatedTargetSpecification** | 5/146 | Associated target spec | 🔴 **Missing** - MEDIUM |
| **SuppressTopLevelGroup** | 2/146 | Suppress top-level group | 🔴 **Missing** - LOW |
| **LocalizedByDefault** | 2/146 | Localization flag | 🔴 **Missing** - LOW |
| **Components** | 2/146 | Template components | 🔴 **Missing** - MEDIUM |
| **ProjectOnly** | 1/146 | Project-only flag | 🔴 **Missing** - LOW |

## Missing High-Priority Fields

### 1. Description (72/146 templates)

**Example:**
```json
{
  "Description": "This template creates an empty project with no files or targets."
}
```

**Use Case:** Display in template browser, help text
**Impact:** Users can't see what template does without this
**Recommendation:** Add `description: String?` to `TemplateMetadata`

### 2. Platforms (60/146 templates)

**Example:**
```json
{
  "Platforms": ["com.apple.platform.iphoneos", "com.apple.platform.macosx"]
}
```

**Use Case:** Filter templates by platform, validate compatibility
**Impact:** Can't filter iOS-only vs macOS-only templates
**Recommendation:** Add `platforms: [String]?` to `TemplateMetadata`

### 3. MainTemplateFile (50/146 templates)

**Example:**
```json
{
  "MainTemplateFile": "main.swift"
}
```

**Use Case:** Identify primary template file for processing
**Impact:** Can't determine which file is the "main" template
**Recommendation:** Add `mainTemplateFile: String?` to `TemplateMetadata`

### 4. Targets (45/146 templates)

**Example:**
```json
{
  "Targets": [
    {
      "Name": "___PACKAGENAME___",
      "ProductType": "com.apple.product-type.application"
    }
  ]
}
```

**Use Case:** Understand target structure, product types
**Impact:** Missing critical build configuration data
**Recommendation:** Add `targets: [[String: Any]]?` to `TemplateMetadata`

### 5. Definitions (43/146 templates)

**Example:**
```json
{
  "Definitions": {
    "main.swift": {
      "SomeKey": "SomeValue"
    }
  }
}
```

**Use Case:** Template variable definitions per file
**Impact:** Missing variable configuration
**Recommendation:** Add `definitions: [String: [String: Any]]?` to `TemplateMetadata`

### 6. Nodes (24/146 templates)

**Example:**
```json
{
  "Nodes": [
    "Info.plist",
    "___FILEBASENAME___.swift"
  ]
}
```

**Use Case:** Template file node structure
**Impact:** Missing structured file organization
**Recommendation:** Add `nodes: [String]?` or parse into structured format

### 7. Project (8/146 templates)

**Example:**
```json
{
  "Project": {
    "Configurations": {
      "Debug": {
        "SWIFT_VERSION": "5.0"
      }
    }
  }
}
```

**Use Case:** Project-level build settings
**Impact:** Missing crucial build configuration
**Recommendation:** Add `project: [String: Any]?` to `TemplateMetadata`

## Missing Medium-Priority Fields

### 1. DefaultCompletionName (56/146 templates)
- Default name for new file/class
- Used in file creation dialogs
- **Recommendation:** Add `defaultCompletionName: String?`

### 2. Summary (53/146 templates)
- Short one-line description
- Used in template picker
- **Recommendation:** Add `summary: String?`

### 3. SupportsSwiftPackage (27/146 templates)
- Swift Package Manager compatibility
- **Recommendation:** Add `supportsSwiftPackage: Bool?`

### 4. AllowedTypes (26/146 templates)
- Allowed file types (e.g., "public.swift-source")
- **Recommendation:** Add `allowedTypes: [String]?`

### 5. BuildableType (15/146 templates)
- Buildable target type
- **Recommendation:** Add `buildableType: String?`

### 6. OptionConstraints (8/146 templates)
- Constraints on option combinations
- **Recommendation:** Add to OptionJSON structure

### 7. PackageType (5/146 templates)
- Swift Package type classification
- **Recommendation:** Add `packageType: String?`

### 8. AssociatedTargetSpecification (5/146 templates)
- Associated target specification
- **Recommendation:** Add `associatedTargetSpec: String?`

### 9. Components (2/146 templates)
- Template component structure
- **Recommendation:** Add `components: [String: Any]?`

## Missing Low-Priority Fields

These are less critical for initial implementation:

- **Image** (52/146) - Template icon/SF Symbol
- **SortOrder** (37/146) - Display order
- **Concrete** (14/146) - Concrete vs base template flag
- **HiddenFromLibrary/HiddenFromChooser** (10/146 each) - Visibility flags
- **TargetOnly** (7/146) - Target-only flag
- **Title/Name** (6/146 each) - Name overrides
- **Icon** (6/146) - Icon file
- **NameOfInitialFileForEditor** (6/146) - Initial editor file
- **SuppressTopLevelGroup** (2/146) - Group suppression
- **LocalizedByDefault** (2/146) - Localization
- **ProjectOnly** (1/146) - Project-only flag

## Current Option Parsing Gaps

We currently extract from `Options` array:
- ✅ `Identifier`
- ✅ `Name`
- ✅ `Type`
- ✅ `Default`
- ✅ `Units` (choices)

**Missing Option fields:**
- 🔴 `Description` - Option description
- 🔴 `Required` - Is option required
- 🔴 `NotPersisted` - Don't persist in project
- 🔴 `EmptyReplacement` - Default for empty value
- 🔴 `FallbackHeader` - Fallback header text
- 🔴 `SortOrder` - Display order
- 🔴 `Values` - Predefined values
- 🔴 `MainTemplateFile` - Template file association

## Recommendations

### Phase 1: Critical Fields (Immediate)
1. Add `description: String?`
2. Add `platforms: [String]?`
3. Add `mainTemplateFile: String?`
4. Add `targets: [[String: Any]]?`
5. Add `definitions: [String: Any]?`
6. Add `nodes: [String]?`
7. Add `project: [String: Any]?`

### Phase 2: Important Fields (Next)
1. Add `summary: String?`
2. Add `defaultCompletionName: String?`
3. Add `supportsSwiftPackage: Bool?`
4. Add `allowedTypes: [String]?`
5. Enhance `TemplateOptionJSON` with missing fields

### Phase 3: Nice-to-Have (Future)
1. Add visibility flags (`hiddenFromLibrary`, `hiddenFromChooser`)
2. Add UI metadata (`image`, `icon`, `sortOrder`)
3. Add advanced configuration (`buildableType`, `packageType`)

## Implementation Strategy

### 1. Extend TemplateMetadata

```swift
public struct TemplateMetadata: Codable, Identifiable, Hashable, Sendable {
    // Existing fields
    public let id: String
    public let name: String
    public let path: String
    public let kind: TemplateKind
    public let ancestors: [TemplateKind]?
    public let options: [TemplateOptionJSON]
    public let totalCombinations: Int
    public let fileStructure: [FileNode]?
    public let rawContent: String?
    public let rawContentType: String?

    // Phase 1: Critical fields
    public let description: String?
    public let summary: String?
    public let platforms: [String]?
    public let mainTemplateFile: String?
    public let targets: [[String: AnyCodable]]?
    public let definitions: [String: AnyCodable]?
    public let nodes: [String]?
    public let project: [String: AnyCodable]?

    // Phase 2: Important fields
    public let defaultCompletionName: String?
    public let supportsSwiftPackage: Bool?
    public let allowedTypes: [String]?
    public let buildableType: String?

    // Phase 3: Nice-to-have fields
    public let image: TemplateImage?
    public let sortOrder: Int?
    public let concrete: Bool?
    public let hiddenFromLibrary: Bool?
    public let hiddenFromChooser: Bool?
}
```

### 2. Enhance TemplateOptionJSON

```swift
public struct TemplateOptionJSON: Codable, Sendable, Hashable {
    // Existing
    public let name: String
    public let type: String
    public let identifier: String
    public let defaultValue: String
    public let choices: [String]?

    // Add missing
    public let description: String?
    public let required: Bool?
    public let notPersisted: Bool?
    public let emptyReplacement: String?
    public let sortOrder: Int?
}
```

### 3. Update Scanner

Update `parseTemplate(at:templateType:)` in `TemplateScanner.swift` to extract new fields:

```swift
private func parseTemplate(at path: String, templateType: String) -> TemplateMetadata? {
    // ... existing code ...

    return TemplateMetadata(
        // ... existing fields ...
        description: plist["Description"] as? String,
        summary: plist["Summary"] as? String,
        platforms: plist["Platforms"] as? [String],
        mainTemplateFile: plist["MainTemplateFile"] as? String,
        targets: plist["Targets"] as? [[String: Any]],
        definitions: plist["Definitions"] as? [String: Any],
        nodes: plist["Nodes"] as? [String],
        project: plist["Project"] as? [String: Any],
        defaultCompletionName: plist["DefaultCompletionName"] as? String,
        supportsSwiftPackage: plist["SupportsSwiftPackage"] as? Bool,
        allowedTypes: plist["AllowedTypes"] as? [String],
        buildableType: plist["BuildableType"] as? String,
        image: parseTemplateImage(plist["Image"]),
        sortOrder: plist["SortOrder"] as? Int,
        concrete: plist["Concrete"] as? Bool,
        hiddenFromLibrary: plist["HiddenFromLibrary"] as? Bool,
        hiddenFromChooser: plist["HiddenFromChooser"] as? Bool
    )
}
```

## Test Coverage Requirements

After implementing Phase 1 fields:

1. Add tests verifying Description parsing
2. Add tests verifying Platforms array parsing
3. Add tests verifying MainTemplateFile extraction
4. Add tests verifying Targets structure preservation
5. Add tests verifying Definitions parsing
6. Add tests verifying Nodes array parsing
7. Add tests verifying Project configuration parsing

## Impact Assessment

### Before (Current State)
- Capturing: **30% of available metadata** (9/30 fields)
- Template descriptions: ❌ Not available
- Platform filtering: ❌ Not possible
- Target configuration: ❌ Not captured
- Variable definitions: ❌ Missing

### After Phase 1
- Capturing: **57% of available metadata** (17/30 fields)
- Template descriptions: ✅ Available
- Platform filtering: ✅ Possible
- Target configuration: ✅ Captured
- Variable definitions: ✅ Available

### After Phase 2
- Capturing: **73% of available metadata** (22/30 fields)
- All critical fields: ✅ Available
- Swift Package support: ✅ Detected
- Default names: ✅ Available
- File type restrictions: ✅ Captured

### After Phase 3
- Capturing: **100% of available metadata** (30/30 fields)
- Complete parity with Xcode templates
- Full UI metadata available
- All visibility flags captured

## Conclusion

Our current implementation captures the essential fields for basic template enumeration and parsing. However, **70% of template metadata is currently missing**, including critical fields like:

- Template descriptions and summaries
- Platform compatibility information
- Target configurations
- Build settings
- Variable definitions

Implementing these fields in phases will significantly enhance the utility of the template parser and enable:

1. Better template discovery and filtering
2. Complete template generation from metadata
3. Platform-specific template handling
4. Full variable substitution support
5. Rich UI presentation with descriptions and icons

**Recommended Next Steps:**
1. Implement Phase 1 (Critical Fields)
2. Update TemplateInventory.json generation
3. Add comprehensive tests
4. Update documentation
5. Move to Phase 2 implementation
