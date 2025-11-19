# Build Settings Investigation

## Summary
Investigation of how major Xcode tooling projects handle build settings to inform our implementation strategy.

## Projects Analyzed

### 1. xcodebuild (https://github.com/mxcl/xcodebuild)
**Type**: GitHub Action wrapper for xcodebuild command
**Language**: TypeScript
**Relevance**: Limited - primarily a CI/CD tool, doesn't parse build settings

**Key Findings**:
- Wrapper around Apple's `xcodebuild` command-line tool
- Sets build settings via command-line arguments like `CODE_SIGN_IDENTITY=-`
- No internal representation of build settings structure
- Uses string-based setting injection

**Example**:
```typescript
// From lib.ts:415
export function getIdentity(identity: string, platform?: Platform): string | undefined {
  if (identity) {
    return `CODE_SIGN_IDENTITY="${identity}"`
  }
  if (platform == 'mac-catalyst') {
    return 'CODE_SIGN_IDENTITY=-'
  }
}
```

**Conclusion**: Not useful for understanding build settings structure.

---

### 2. XcodeGen (https://github.com/yonaskolb/XcodeGen)
**Type**: Xcode project generator from YAML specs
**Language**: Swift
**Relevance**: HIGH - Extensively parses and generates build settings

## XcodeGen Build Settings Architecture

### Core Type Definition

**From**: `Sources/ProjectSpec/Settings.swift`

```swift
public struct Settings: Equatable, JSONObjectConvertible {
    public var buildSettings: BuildSettings  // [String: Any]
    public var configSettings: [String: Settings]
    public var groups: [String]
}
```

**Key Insight**: `BuildSettings` is a type alias for `[String: Any]` (defined in XcodeProj dependency)

### No Type Safety for Values

XcodeGen does **NOT** use enums or typed values for build settings. They treat it as:
- **Keys**: Strings (setting names like "PRODUCT_NAME", "ENABLE_APP_SANDBOX")
- **Values**: `Any` - can be string, bool, array, etc.

This is **exactly the approach we took** with `PropertyListValue` enum!

### Build Settings Structure

```swift
// From Settings.swift:6-16
public struct Settings {
    public var buildSettings: BuildSettings      // Base settings
    public var configSettings: [String: Settings] // Per-config overrides (Debug/Release)
    public var groups: [String]                   // Preset groups
}
```

**Three-tier system**:
1. **Base settings**: Applied to all configurations
2. **Config-specific settings**: Overrides per configuration (Debug, Release, etc.)
3. **Groups**: References to preset files

### Settings Presets

**From**: `Sources/XcodeGenKit/SettingsPresetFile.swift`

```swift
public enum SettingsPresetFile {
    case config(ConfigType)                      // Debug/Release presets
    case platform(Platform)                      // iOS/macOS/etc presets
    case supportedDestination(SupportedDestination)
    case product(PBXProductType)                 // App/Framework/etc presets
    case productPlatform(PBXProductType, Platform)
    case base                                     // Common base settings
}
```

XcodeGen ships with preset YAML files containing common build settings for:
- **Platforms**: iOS, macOS, tvOS, watchOS, visionOS
- **Product types**: Application, Framework, Static Library, etc.
- **Configurations**: Debug, Release
- **Combinations**: e.g., "iOS Application Debug"

### Example Settings Handling

**From**: `Sources/XcodeGenKit/SettingsBuilder.swift:10-39`

```swift
public func getProjectBuildSettings(config: Config) -> BuildSettings {
    var buildSettings: BuildSettings = [:]

    // Set SDKROOT if single platform
    if let firstPlatform = targets.first?.platform,
       targets.allSatisfy({ $0.platform == firstPlatform }) {
        buildSettings["SDKROOT"] = firstPlatform.sdkRoot
    }

    // Apply presets
    if let type = config.type, options.settingPresets.applyProject {
        buildSettings += SettingsPresetFile.base.getBuildSettings()
        buildSettings += SettingsPresetFile.config(type).getBuildSettings()
    }

    // Apply custom platform versions
    for platform in Platform.allCases {
        if let version = options.deploymentTarget.version(for: platform) {
            buildSettings[platform.deploymentTargetSetting] = version.deploymentTarget
        }
    }

    // Merge with config-specific settings
    buildSettings += getBuildSettings(settings: settings, config: config)

    return buildSettings
}
```

### Settings Merging Strategy

**From**: `Sources/ProjectSpec/Settings.swift:106-123`

```swift
extension Dictionary where Key == String, Value: Any {
    public func merged(_ dictionary: [Key: Value]) -> [Key: Value] {
        var mergedDictionary = self
        mergedDictionary.merge(dictionary)
        return mergedDictionary
    }

    public mutating func merge(_ dictionary: [Key: Value]) {
        for (key, value) in dictionary {
            self[key] = value  // Simple overwrite, no deep merging
        }
    }
}

public func += (lhs: inout BuildSettings, rhs: BuildSettings?) {
    guard let rhs = rhs else { return }
    lhs.merge(rhs)  // Convenience operator for merging
}
```

**Merging behavior**: Simple dictionary merge - later values overwrite earlier ones.

### JSON Serialization

**From**: `Sources/ProjectSpec/Settings.swift:130-141`

```swift
extension Settings: JSONEncodable {
    public func toJSONValue() -> Any {
        if groups.count > 0 || configSettings.count > 0 {
            return [
                "base": buildSettings,
                "groups": groups,
                "configs": configSettings.mapValues { $0.toJSONValue() },
            ]
        }
        return buildSettings  // Simplified form when no groups/configs
    }
}
```

Two serialization formats:
1. **Simple**: Just the dictionary when no groups/configs
2. **Extended**: Object with `base`, `groups`, `configs` keys

## Comparison with Our Implementation

| Aspect | XcodeGen | Our Implementation | Match? |
|--------|----------|-------------------|--------|
| **Value Type** | `Any` | `PropertyListValue` enum | ✅ Equivalent |
| **Keys** | String | String | ✅ |
| **Type Safety** | None | Enum variants | ✅ Better |
| **Config Support** | Yes (`configSettings`) | Yes (`buildConfigurations`) | ✅ |
| **Merging** | Simple overwrite | N/A (just parsing) | ✅ |
| **Platform Conditionals** | Keys like `KEY[sdk=ios*]` | Keys preserved as-is | ✅ |
| **Variable Expansion** | Not during parsing | Not during parsing | ✅ |

## Key Takeaways

### 1. No Known Build Settings Enum Exists
Neither project attempts to enumerate all possible build settings. This validates our approach of keeping it flexible.

### 2. Heterogeneous Value Types
Build settings contain:
- Strings: `"$(TARGET_NAME)"`, `"YES"`, `"AppIcon"`
- Bools: `true`, `false` (rarely, usually strings)
- Arrays: `["flag1", "flag2"]` (for linker flags, etc.)
- Dictionaries: Nested structures

Our `PropertyListValue` enum handles all of these correctly.

### 3. Platform Conditionals in Keys
Settings like `INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]` have the conditional **in the key name**, not as separate metadata.

XcodeGen treats these as regular string keys - no special parsing.

### 4. No Semantic Validation
Neither tool validates:
- Setting names against known Xcode settings
- Value types (e.g., "should ENABLE_APP_SANDBOX be a bool?")
- Setting compatibility with platforms/product types

This is handled by Xcode itself at build time.

### 5. Simple Merge Strategy
Settings merge is simple dictionary merge - last writer wins. No complex inheritance or composition rules.

## Recommendations for Our Implementation

### ✅ Current Approach is Correct

Our `PropertyListValue` enum is the right choice:

```swift
public enum PropertyListValue: Codable, Hashable, Sendable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case array([PropertyListValue])
    case dictionary([String: PropertyListValue])
}
```

This provides:
- **Type preservation**: Unlike `Any`, we track what type each value is
- **Serialization**: Codable support for round-tripping
- **Type safety**: Enum prevents invalid value types

### ✅ Keep Settings as [String: PropertyListValue]

Don't create enums for setting names. The space is too large and Apple adds new settings regularly.

### ✅ Preserve Keys Exactly

Platform conditionals like `KEY[sdk=platform*]` should stay in key names, not parsed out.

### ✅ No Validation

Don't validate setting names or values. That's Xcode's job.

### Future Enhancements (Optional)

If we ever want to add convenience/validation:

1. **Setting Name Constants** (low value):
   ```swift
   extension String {
       static let productName = "PRODUCT_NAME"
       static let bundleIdentifier = "PRODUCT_BUNDLE_IDENTIFIER"
       // ... hundreds more
   }
   ```

2. **Preset Templates** (like XcodeGen):
   - Ship common setting combinations
   - iOS App defaults, macOS Framework defaults, etc.

3. **Validation Helpers** (optional):
   ```swift
   extension PropertyListValue {
       func asString() throws -> String { ... }
       func asBool() throws -> Bool { ... }
   }
   ```

But these are **not needed for template parsing** - they're for code generation/manipulation.

## Conclusion

Our implementation using `PropertyListValue` is:
- ✅ Aligned with industry practice (XcodeGen uses similar approach)
- ✅ More type-safe than alternatives (enum vs `Any`)
- ✅ Flexible enough for all Xcode build settings
- ✅ Preserves all information from plist format
- ✅ Ready for bidirectional serialization

No changes needed to our approach.
