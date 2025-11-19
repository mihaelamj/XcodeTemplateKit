# Boolean Property Formats in Xcode Templates

This document catalogs all boolean properties found in Xcode templates and their serialization formats.

## Executive Summary

Xcode templates use TWO different formats for boolean values:

1. **Objective-C Boolean Format**: `<string>YES</string>` and `<string>NO</string>` (legacy)
2. **Swift Boolean Format**: `<true/>` and `<false/>` (modern XML boolean)

This distinction is **critical** for template creation - when writing templates, you must use the correct format for each property.

These formats are represented in code by the `TemplateBooleanFormat` enum:
```swift
public enum TemplateBooleanFormat {
    case objectiveCBoolean(Bool)  // YES/NO string format
    case swiftBoolean(Bool)        // <true/>/<false/> XML format
}
```

## Properties Using Objective-C Boolean Format (YES/NO)

### Top-Level Template Properties

- **HiddenFromChooser**: Controls template visibility in Xcode template chooser
- **HiddenFromLibrary**: Controls template visibility in Xcode library

### Build Settings in Options/Definitions

The following build settings use YES/NO string format when embedded in Options or Definitions dictionaries:

- ALLOW_TARGET_PLATFORM_SPECIALIZATION
- ALWAYS_SEARCH_USER_PATHS
- ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS
- BUILD_LIBRARY_FOR_DISTRIBUTION
- CLANG_ANALYZER_NONNULL
- CLANG_ENABLE_MODULES
- CLANG_ENABLE_OBJC_ARC
- CLANG_ENABLE_OBJC_WEAK
- CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING
- CLANG_WARN_BOOL_CONVERSION
- CLANG_WARN_COMMA
- CLANG_WARN_CONSTANT_CONVERSION
- CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS
- CLANG_WARN_DOCUMENTATION_COMMENTS
- CLANG_WARN_EMPTY_BODY
- CLANG_WARN_ENUM_CONVERSION
- CLANG_WARN_INFINITE_RECURSION
- CLANG_WARN_INT_CONVERSION
- CLANG_WARN_NON_LITERAL_NULL_CONVERSION
- CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF
- CLANG_WARN_OBJC_LITERAL_CONVERSION
- CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER
- CLANG_WARN_RANGE_LOOP_ANALYSIS
- CLANG_WARN_STRICT_PROTOTYPES
- CLANG_WARN_SUSPICIOUS_MOVE
- CLANG_WARN_UNREACHABLE_CODE
- CLANG_WARN__DUPLICATE_METHOD_MATCH
- COMBINE_HIDPI_IMAGES
- COPY_PHASE_STRIP
- DEBUGGING_SYMBOLS
- DEFINES_MODULE
- ENABLE_APP_SANDBOX
- ENABLE_HARDENED_RUNTIME
- ENABLE_MODULE_VERIFIER
- ENABLE_NS_ASSERTIONS
- ENABLE_OUTGOING_NETWORK_CONNECTIONS
- ENABLE_PREVIEWS
- ENABLE_STRICT_OBJC_MSGSEND
- ENABLE_TESTABILITY
- ENABLE_USER_SCRIPT_SANDBOXING
- GCC_DYNAMIC_NO_PIC
- GCC_GENERATE_DEBUGGING_SYMBOLS
- GCC_NO_COMMON_BLOCKS
- GCC_WARN_64_TO_32_BIT_CONVERSION
- GCC_WARN_UNDECLARED_SELECTOR
- GCC_WARN_UNUSED_FUNCTION
- GCC_WARN_UNUSED_VARIABLE
- GENERATE_INFOPLIST_FILE
- INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphoneos*]
- INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphonesimulator*]
- INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents
- INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphoneos*]
- INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphonesimulator*]
- INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]
- INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphonesimulator*]
- INFOPLIST_KEY_UIStatusBarHidden
- INFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphoneos*]
- INFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphonesimulator*]
- LOCALIZATION_PREFERS_STRING_CATALOGS
- MTL_ENABLE_DEBUG_INFO
- MTL_FAST_MATH
- ONLY_ACTIVE_ARCH
- REGISTER_APP_GROUPS
- RUN_CLANG_STATIC_ANALYZER
- SKIP_INSTALL
- STRING_CATALOG_GENERATE_SYMBOLS
- SWIFT_APPROACHABLE_CONCURRENCY
- SWIFT_EMIT_LOC_STRINGS
- SWIFT_INSTALL_MODULE
- SWIFT_INSTALL_OBJC_HEADER
- SWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY
- VALIDATE_PRODUCT

## Properties Using Swift Boolean Format (<true/>/<false/>)

The following template metadata properties use modern Swift/XML boolean format:

- **Concrete**: Whether template is concrete (instantiable) or abstract
- **LocalizedByDefault**: Whether template content is localized by default
- **ProjectOnly**: Whether template is only for project-level usage
- **SupportsSwiftPackage**: Whether template supports Swift Package Manager
- **SuppressTopLevelGroup**: Whether to suppress top-level group creation
- **TargetOnly**: Whether template is only for target-level usage

## Implementation Notes

### Current Parser Implementation

Our `TemplateScanner` correctly handles both formats using the `TemplateBooleanFormat` enum:

```swift
// For HiddenFromChooser and HiddenFromLibrary (Objective-C Boolean Format)
let hiddenFromChooser = (plist["HiddenFromChooser"] as? String)
    .flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }
    .map { $0.boolValue }

let hiddenFromLibrary = (plist["HiddenFromLibrary"] as? String)
    .flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }
    .map { $0.boolValue }

// For other boolean fields (Swift Boolean Format)
let concrete = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0).boolValue }
let localizedByDefault = (plist["LocalizedByDefault"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0).boolValue }
let projectOnly = (plist["ProjectOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0).boolValue }
let supportsSwiftPackage = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0).boolValue }
let suppressTopLevelGroup = (plist["SuppressTopLevelGroup"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0).boolValue }
let targetOnly = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0).boolValue }
```

Note: The current implementation extracts boolean values directly. The `TemplateBooleanFormat` enum is available for use when implementing template writing/creation functionality.

### Template Creation Requirements

When creating new templates or writing templates programmatically, you MUST:

1. **For HiddenFromChooser and HiddenFromLibrary**: Use `<string>YES</string>` or `<string>NO</string>`
   ```xml
   <key>HiddenFromChooser</key>
   <string>YES</string>
   ```

2. **For Concrete, LocalizedByDefault, etc.**: Use `<true/>` or `<false/>`
   ```xml
   <key>Concrete</key>
   <true/>
   ```

3. **For build settings in Options/Definitions**: Use `<string>YES</string>` or `<string>NO</string>`
   ```xml
   <key>ENABLE_TESTABILITY</key>
   <string>YES</string>
   ```

### Why Two Formats?

The dual format reflects the evolution from Objective-C to Swift conventions:

- **Objective-C Boolean Format (YES/NO)**: Legacy format from Objective-C era
  - `HiddenFromChooser`/`HiddenFromLibrary`: These predate proper boolean support in property lists
  - **Build settings**: Xcode build settings have always used YES/NO strings (ENABLE_TESTABILITY, etc.)
  - Maintained for backward compatibility with older Xcode versions

- **Swift Boolean Format (<true/>/<false/>)**: Modern property list standard
  - `Concrete` and other metadata fields: Use standard XML boolean format
  - Introduced with XML property list format specification
  - Preferred for new template properties

## Testing Coverage

All boolean properties are tested with comprehensive fixtures:

- **HiddenFromChooserTests**: 30 tests covering all templates with this field
- **HiddenFromLibraryTests**: 30 tests covering all templates with this field
- **ConcreteTests**: 15 tests covering project templates
- **LocalizedByDefaultTests**: 9 tests covering localized templates
- **ProjectOnlyTests**: Tests for project-specific templates
- **SupportsSwiftPackageTests**: Tests for SPM-compatible templates
- **SuppressTopLevelGroupTests**: Tests for group suppression
- **TargetOnlyTests**: Tests for target-specific templates

## Future Work

When implementing template creation/writing functionality:

1. Use `TemplateBooleanFormat` enum to ensure type-safe serialization:
   ```swift
   // Serialize Objective-C boolean
   let hidden = TemplateBooleanFormat.objectiveCBoolean(true)
   plist["HiddenFromChooser"] = hidden.toObjectiveCString()  // "YES"

   // Serialize Swift boolean
   let concrete = TemplateBooleanFormat.swiftBoolean(true)
   plist["Concrete"] = concrete.boolValue  // PropertyListSerialization handles <true/>
   ```

2. Add validation layer to prevent incorrect format usage (e.g., warn if HiddenFromChooser uses Swift format)

3. Consider adding swift-parsing parsers for additional validation when reading templates
