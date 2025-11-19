# Targets Field

## Current Status
**Stored as:** `Data?` (unparsed binary plist data)
**Occurrences:** 45 templates
**Priority:** High (common in project templates)

## Description
The `Targets` field defines the build targets for a project template. This is one of the most complex and important fields, as it specifies the entire target configuration including build settings, build phases, product types, and target relationships.

## Structure

```swift
Targets: [[String: Any]]
```

Array of target dictionaries. Each target can have many optional keys:

### Core Target Properties
- `Name` (String, optional): Target name (often uses `___PACKAGENAME___`)
- `TargetIdentifier` (String, optional): Unique identifier for the target
- `TargetType` (String, optional): Type of target (e.g., "Aggregate")
- `ProductType` (String, optional): Xcode product type (e.g., "com.apple.product-type.application")

### Build Configuration
- `SharedSettings` (Dictionary, optional): Build settings applied to all configurations
- `BuildConfigurations` (Dictionary, optional): Per-configuration settings (Debug, Release, etc.)

### Build Phases
- `BuildPhases` (Array, optional): Ordered list of build phases
  ```swift
  [{
    "Class": String  // "Sources", "Frameworks", "Resources", etc.
  }]
  ```

### Dependencies
- `Dependencies` (Array, optional): Target dependencies
- `Frameworks` (Array, optional): Framework dependencies

## Examples

### Simple Aggregate Target
```xml
<key>Targets</key>
<array>
  <dict>
    <key>Name</key>
    <string>___PACKAGENAME___</string>
    <key>SharedSettings</key>
    <dict>
      <key>PRODUCT_NAME</key>
      <string>$(TARGET_NAME)</string>
    </dict>
    <key>TargetIdentifier</key>
    <string>com.apple.dt.aggregateTarget</string>
    <key>TargetType</key>
    <string>Aggregate</string>
  </dict>
</array>
```

### Application Target with Build Phases
```xml
<key>Targets</key>
<array>
  <dict>
    <key>BuildPhases</key>
    <array>
      <dict>
        <key>Class</key>
        <string>Sources</string>
      </dict>
      <dict>
        <key>Class</key>
        <string>Frameworks</string>
      </dict>
      <dict>
        <key>Class</key>
        <string>Resources</string>
      </dict>
    </array>
    <key>ProductType</key>
    <string>com.apple.product-type.application</string>
  </dict>
</array>
```

### Complex Multi-Platform App Target
```xml
<key>Targets</key>
<array>
  <dict>
    <key>SharedSettings</key>
    <dict>
      <key>ENABLE_APP_SANDBOX</key>
      <string>YES</string>
      <key>ENABLE_USER_SELECTED_FILES</key>
      <string>readwrite</string>
      <key>INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphoneos*]</key>
      <string>YES</string>
      <key>INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphonesimulator*]</key>
      <string>YES</string>
      <key>INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]</key>
      <string>YES</string>
      <key>LD_RUNPATH_SEARCH_PATHS</key>
      <string>@executable_path/Frameworks</string>
      <key>LD_RUNPATH_SEARCH_PATHS[sdk=macosx*]</key>
      <string>@executable_path/../Frameworks</string>
      <key>REGISTER_APP_GROUPS</key>
      <string>YES</string>
    </dict>
  </dict>
</array>
```

## Field Variations Found

From analyzing 45 fixtures, the following keys have been observed:
- `Name`
- `TargetIdentifier`
- `TargetType`
- `ProductType`
- `SharedSettings` (dictionary of build settings)
- `BuildPhases` (array of phase dictionaries)
- `BuildConfigurations` (dictionary)
- `Dependencies` (array)
- `Frameworks` (array)

## Analysis

### Parsing Strategy: **Hybrid Approach**

**Rationale:**
- **Structured parsing** for the outer target structure (array of dictionaries)
- **Type-preserving storage** for `SharedSettings` and `BuildConfigurations` (too many possible keys)
- The build settings keys are not fixed - they include:
  - Standard Xcode build settings
  - Platform-specific settings with `[sdk=...]` suffixes
  - Custom project-specific settings
  - Over 100+ possible build setting keys

### Recommended Implementation

```swift
public struct TargetDefinition: Codable, Sendable {
    public let name: String?
    public let targetIdentifier: String?
    public let targetType: String?
    public let productType: String?
    public let sharedSettings: [String: PropertyListValue]?
    public let buildConfigurations: [String: [String: PropertyListValue]]?
    public let buildPhases: [BuildPhase]?
    public let dependencies: [[String: PropertyListValue]]?
    public let frameworks: [[String: PropertyListValue]]?

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
    }
}

public struct BuildPhase: Codable, Sendable {
    public let buildClass: String  // "Sources", "Frameworks", "Resources", etc.
    public let additionalProperties: [String: PropertyListValue]?

    enum CodingKeys: String, CodingKey {
        case buildClass = "Class"
    }
}

// Property list value type to handle heterogeneous dictionaries
public enum PropertyListValue: Codable, Sendable {
    case string(String)
    case int(Int)
    case bool(Bool)
    case array([PropertyListValue])
    case dictionary([String: PropertyListValue])
}

// In TemplateMetadata:
public let targets: [TargetDefinition]?
```

### Parsing Approach
Use standard `Decodable` with a custom `PropertyListValue` enum to handle heterogeneous build settings. No need for pointfree-parsing.

## Template Usage
The `Targets` field tells Xcode to:
1. Create one or more build targets
2. Configure each target with the specified product type
3. Apply build settings from `SharedSettings` and `BuildConfigurations`
4. Set up build phases in the specified order
5. Establish target dependencies

## Related Fields
- **Components**: Defines additional targets to be created
- **Project**: May contain project-level build settings
- **BuildableType**: Indicates if target is buildable
- **ProductType**: Related to target's `ProductType` key

## Implementation Notes
- Build settings can include platform conditionals: `KEY[sdk=iphoneos*]`
- Target names often use template variables: `___PACKAGENAME___`
- Product types follow reverse-DNS naming: `com.apple.product-type.application`
- Currently stored as raw `Data` to preserve the complex, variable structure
- **High priority** for structured parsing due to frequency (45 occurrences)

## Challenges
1. **Variable schema**: Build settings have hundreds of possible keys
2. **Platform conditionals**: Settings can have platform-specific variants
3. **Nested heterogeneous data**: Mix of strings, bools, arrays, dicts
4. **Template variables**: Need to preserve `___VAR___` syntax for later substitution

## Proposed Parsing Steps
1. Parse outer structure (target array) with `Decodable`
2. Use `PropertyListValue` enum for build settings to preserve types
3. Keep template variables as strings (don't try to resolve them)
4. Validate product types against known Xcode product types
5. Consider creating typed enums for well-known build phases
