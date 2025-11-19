# Build Settings - Parsing Rules

## Overview
Build settings appear in the `SharedSettings` and `BuildConfigurations` fields of target definitions. They configure how Xcode builds the target.

**Important**: This document describes the **data structure** for build settings, not their semantic interpretation. Build setting keys come directly from Xcode's build system. How these settings affect the build process is determined by Xcode, not by the parser. The parser's job is to accurately preserve build setting keys and values from the plist format.

## Type
**Dictionary** where keys are build setting names and values can be:
- String (most common)
- Bool (for YES/NO settings)
- Int (for numeric settings)
- Array (for list settings like linker flags)
- Dictionary (for complex nested settings)

## Structure
```
Dictionary<String, PropertyListValue>
  ↓
Key: Build setting name (e.g., "PRODUCT_NAME", "ENABLE_APP_SANDBOX")
Value: PropertyListValue (string, bool, int, array, or dictionary)
```

## Common Patterns

### Simple String Settings
```xml
<key>SharedSettings</key>
<dict>
    <key>PRODUCT_NAME</key>
    <string>$(TARGET_NAME)</string>

    <key>ASSETCATALOG_COMPILER_APPICON_NAME</key>
    <string>AppIcon</string>
</dict>
```

### Boolean Settings (String Format)
Note: In plists, booleans are often represented as strings "YES"/"NO":
```xml
<key>ENABLE_APP_SANDBOX</key>
<string>YES</string>

<key>ENABLE_HARDENED_RUNTIME</key>
<string>NO</string>
```

### Platform-Specific Settings
Settings can include platform conditionals using `[sdk=...]` syntax:
```xml
<key>INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]</key>
<string>YES</string>

<key>INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphonesimulator*]</key>
<string>YES</string>

<key>LD_RUNPATH_SEARCH_PATHS</key>
<string>@executable_path/Frameworks</string>

<key>LD_RUNPATH_SEARCH_PATHS[sdk=macosx*]</key>
<string>@executable_path/../Frameworks</string>
```

### Variable References
Settings can reference other settings or template variables:
```xml
<key>PRODUCT_NAME</key>
<string>$(TARGET_NAME)</string>

<key>PRODUCT_BUNDLE_IDENTIFIER</key>
<string>___VARIABLE_bundleIdentifierPrefix___.$(PRODUCT_NAME:rfc1034identifier)</string>
```

## Data Type Representation

The parser uses `PropertyListValue` enum to preserve type information:

### String Values
```swift
.string("AppIcon")
.string("$(TARGET_NAME)")
.string("YES")  // Even booleans are often strings in plists
```

### Boolean Values
```swift
.bool(true)   // Native plist boolean
.bool(false)
```

### Integer Values
```swift
.int(42)
```

### Array Values
```swift
.array([
    .string("-framework"),
    .string("UIKit")
])
```

### Dictionary Values
```swift
.dictionary([
    "Platform": .string("iOS"),
    "MinVersion": .string("15.0")
])
```

## Parsing Implementation

```swift
public enum PropertyListValue: Codable, Hashable, Sendable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case array([PropertyListValue])
    case dictionary([String: PropertyListValue])
}

public struct TargetDefinition: Codable {
    public let sharedSettings: [String: PropertyListValue]?
    public let buildConfigurations: [String: [String: PropertyListValue]]?
}
```

## Common Build Setting Categories

### Product Configuration
- `PRODUCT_NAME` - Product name
- `PRODUCT_BUNDLE_IDENTIFIER` - Bundle identifier
- `PRODUCT_MODULE_NAME` - Swift module name

### Compilation
- `SWIFT_VERSION` - Swift language version
- `SWIFT_DEFAULT_ACTOR_ISOLATION` - Actor isolation mode
- `ENABLE_STRICT_OBJC_MSGSEND` - Objective-C message sending

### Linking
- `LD_RUNPATH_SEARCH_PATHS` - Runtime library search paths
- `OTHER_LDFLAGS` - Additional linker flags

### Code Signing
- `CODE_SIGN_STYLE` - Automatic or Manual
- `CODE_SIGN_IDENTITY` - Signing identity
- `ENABLE_APP_SANDBOX` - App sandboxing

### Asset Compilation
- `ASSETCATALOG_COMPILER_APPICON_NAME` - App icon name
- `ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME` - Accent color

## Semantic Notes

### String vs Boolean Representation
- Xcode build settings historically used string values ("YES"/"NO") for booleans
- Modern plists may use native boolean values
- The parser preserves the original format
- Semantic interpretation (treating "YES" as true) is handled by code generation

### Platform Conditionals
- Keys like `SETTING[sdk=platform*]` define platform-specific values
- The `[sdk=...]` suffix is part of the key name
- Not parsed or interpreted by the parser
- Xcode's build system handles the conditional logic

### Variable Expansion
- Values like `$(TARGET_NAME)` and `___VARIABLE_name___` are preserved as-is
- No variable resolution or expansion during parsing
- Template processing happens later during project generation

## Field Usage in Targets

### SharedSettings
Applied to all build configurations (Debug, Release, etc.):
```xml
<key>Targets</key>
<array>
    <dict>
        <key>SharedSettings</key>
        <dict>
            <key>PRODUCT_NAME</key>
            <string>$(TARGET_NAME)</string>
        </dict>
    </dict>
</array>
```

### BuildConfigurations
Per-configuration settings:
```xml
<key>BuildConfigurations</key>
<dict>
    <key>Debug</key>
    <dict>
        <key>ENABLE_TESTABILITY</key>
        <string>YES</string>
    </dict>
    <key>Release</key>
    <dict>
        <key>ENABLE_TESTABILITY</key>
        <string>NO</string>
    </dict>
</dict>
```

## Parsing Requirements

1. ✅ **Preserve keys exactly** - Including platform conditionals
2. ✅ **Preserve value types** - String, bool, int, array, dictionary
3. ✅ **No validation** - Parser doesn't validate setting names or values
4. ✅ **No expansion** - Variables preserved as-is
5. ✅ **No interpretation** - Semantic meaning handled elsewhere

## Testing Requirements

```swift
func testBuildSettingsParsing() {
    // String values
    let stringSettings = ["PRODUCT_NAME": .string("MyApp")]

    // Boolean values (both formats)
    let boolSettings = [
        "ENABLE_APP_SANDBOX": .string("YES"),  // String format
        "ENABLE_TESTING": .bool(true)          // Boolean format
    ]

    // Platform conditionals preserved as keys
    let platformSettings = [
        "LD_RUNPATH_SEARCH_PATHS[sdk=macosx*]": .string("@executable_path/../Frameworks")
    ]

    // Variable references preserved
    let variableSettings = [
        "PRODUCT_BUNDLE_IDENTIFIER": .string("___VARIABLE_prefix___.$(PRODUCT_NAME)")
    ]
}
```

## Best Practices

**DO:**
- Preserve all keys exactly as found in plist
- Preserve value types (don't convert bool to string)
- Keep platform conditionals in key names
- Preserve variable syntax unchanged

**DON'T:**
- Validate setting names against known Xcode settings
- Expand variables during parsing
- Interpret platform conditionals
- Convert between value types (e.g., "YES" to true)

## Related Documentation

- **Targets Field**: Parent field containing SharedSettings
- **BuildConfigurations**: Per-configuration variant of SharedSettings
- **PropertyListValue**: Enum representing all possible value types
