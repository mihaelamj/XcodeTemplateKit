# ProjectSharedSettings - Complete Type Specification

## Type Name
`ProjectSharedSettings`

## Field Count
48 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct ProjectSharedSettings: Codable, Hashable, Sendable {
            public let aLWAYS_SEARCH_USER_PATHS: String?
            public let aSSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS: String?
            public let cLANG_ANALYZER_NONNULL: String?
            public let cLANG_ANALYZER_NUMBER_OBJECT_CONVERSION: String?
            public let cLANG_CXX_LANGUAGE_STANDARD: String?
            public let cLANG_ENABLE_MODULES: String?
            public let cLANG_ENABLE_OBJC_ARC: String?
            public let cLANG_ENABLE_OBJC_WEAK: String?
            public let cLANG_WARN_BLOCK_CAPTURE_AUTORELEASING: String?
            public let cLANG_WARN_BOOL_CONVERSION: String?
            public let cLANG_WARN_COMMA: String?
            public let cLANG_WARN_CONSTANT_CONVERSION: String?
            public let cLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS: String?
            public let cLANG_WARN_DIRECT_OBJC_ISA_USAGE: String?
            public let cLANG_WARN_DOCUMENTATION_COMMENTS: String?
            public let cLANG_WARN_EMPTY_BODY: String?
            public let cLANG_WARN_ENUM_CONVERSION: String?
            public let cLANG_WARN_INFINITE_RECURSION: String?
            public let cLANG_WARN_INT_CONVERSION: String?
            public let cLANG_WARN_NON_LITERAL_NULL_CONVERSION: String?
            public let cLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF: String?
            public let cLANG_WARN_OBJC_LITERAL_CONVERSION: String?
            public let cLANG_WARN_OBJC_ROOT_CLASS: String?
            public let cLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER: String?
            public let cLANG_WARN_RANGE_LOOP_ANALYSIS: String?
            public let cLANG_WARN_STRICT_PROTOTYPES: String?
            public let cLANG_WARN_SUSPICIOUS_MOVE: String?
            public let cLANG_WARN_UNGUARDED_AVAILABILITY: String?
            public let cLANG_WARN_UNREACHABLE_CODE: String?
            public let cLANG_WARN__DUPLICATE_METHOD_MATCH: String?
            public let cOPY_PHASE_STRIP: String?
            public let cURRENT_PROJECT_VERSION: String?
            public let eNABLE_STRICT_OBJC_MSGSEND: String?
            public let eNABLE_USER_SCRIPT_SANDBOXING: String?
            public let gCC_C_LANGUAGE_STANDARD: String?
            public let gCC_NO_COMMON_BLOCKS: String?
            public let gCC_WARN_64_TO_32_BIT_CONVERSION: String?
            public let gCC_WARN_ABOUT_RETURN_TYPE: String?
            public let gCC_WARN_UNDECLARED_SELECTOR: String?
            public let gCC_WARN_UNINITIALIZED_AUTOS: String?
            public let gCC_WARN_UNUSED_FUNCTION: String?
            public let gCC_WARN_UNUSED_VARIABLE: String?
            public let iPHONEOS_DEPLOYMENT_TARGET: String?
            public let lOCALIZATION_PREFERS_STRING_CATALOGS: String?
            public let mACOSX_DEPLOYMENT_TARGET: String?
            public let mTL_FAST_MATH: String?
            public let vERSIONING_SYSTEM: String?
            public let vERSION_INFO_PREFIX: String?
    }
}
```

## Example Values
From template: **Base_ProjectSettings.xctemplate**

### ALWAYS_SEARCH_USER_PATHS
```
NO
```

### ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS
```
YES
```

### CLANG_ANALYZER_NONNULL
```
YES
```

### CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION
```
YES_AGGRESSIVE
```

### CLANG_CXX_LANGUAGE_STANDARD
```
gnu++20
```

### CLANG_ENABLE_MODULES
```
YES
```

### CLANG_ENABLE_OBJC_ARC
```
YES
```

### CLANG_ENABLE_OBJC_WEAK
```
YES
```

### CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING
```
YES
```

### CLANG_WARN_BOOL_CONVERSION
```
YES
```

### CLANG_WARN_COMMA
```
YES
```

### CLANG_WARN_CONSTANT_CONVERSION
```
YES
```

### CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS
```
YES
```

### CLANG_WARN_DIRECT_OBJC_ISA_USAGE
```
YES_ERROR
```

### CLANG_WARN_DOCUMENTATION_COMMENTS
```
YES
```

### CLANG_WARN_EMPTY_BODY
```
YES
```

### CLANG_WARN_ENUM_CONVERSION
```
YES
```

### CLANG_WARN_INFINITE_RECURSION
```
YES
```

### CLANG_WARN_INT_CONVERSION
```
YES
```

### CLANG_WARN_NON_LITERAL_NULL_CONVERSION
```
YES
```

### CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF
```
YES
```

### CLANG_WARN_OBJC_LITERAL_CONVERSION
```
YES
```

### CLANG_WARN_OBJC_ROOT_CLASS
```
YES_ERROR
```

### CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER
```
YES
```

### CLANG_WARN_RANGE_LOOP_ANALYSIS
```
YES
```

### CLANG_WARN_STRICT_PROTOTYPES
```
YES
```

### CLANG_WARN_SUSPICIOUS_MOVE
```
YES
```

### CLANG_WARN_UNGUARDED_AVAILABILITY
```
YES_AGGRESSIVE
```

### CLANG_WARN_UNREACHABLE_CODE
```
YES
```

### CLANG_WARN__DUPLICATE_METHOD_MATCH
```
YES
```

### COPY_PHASE_STRIP
```
NO
```

### CURRENT_PROJECT_VERSION
```
1
```

### ENABLE_STRICT_OBJC_MSGSEND
```
YES
```

### ENABLE_USER_SCRIPT_SANDBOXING
```
YES
```

### GCC_C_LANGUAGE_STANDARD
```
gnu17
```

### GCC_NO_COMMON_BLOCKS
```
YES
```

### GCC_WARN_64_TO_32_BIT_CONVERSION
```
YES
```

### GCC_WARN_ABOUT_RETURN_TYPE
```
YES_ERROR
```

### GCC_WARN_UNDECLARED_SELECTOR
```
YES
```

### GCC_WARN_UNINITIALIZED_AUTOS
```
YES_AGGRESSIVE
```

### GCC_WARN_UNUSED_FUNCTION
```
YES
```

### GCC_WARN_UNUSED_VARIABLE
```
YES
```

### IPHONEOS_DEPLOYMENT_TARGET
```
15.0
```

### LOCALIZATION_PREFERS_STRING_CATALOGS
```
YES
```

### MACOSX_DEPLOYMENT_TARGET
```
10.14
```

### MTL_FAST_MATH
```
YES
```

### VERSIONING_SYSTEM
```
apple-generic
```

### VERSION_INFO_PREFIX
```

```

