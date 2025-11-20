# ProjectConfigurationsDebug - Complete Type Specification

## Type Name
`ProjectConfigurationsDebug`

## Field Count
7 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct ProjectConfigurationsDebug: Codable, Hashable, Sendable {
            public let dEBUG_INFORMATION_FORMAT: String?
            public let eNABLE_TESTABILITY: String?
            public let gCC_DYNAMIC_NO_PIC: String?
            public let gCC_OPTIMIZATION_LEVEL: String?
            public let gCC_PREPROCESSOR_DEFINITIONS: String?
            public let mTL_ENABLE_DEBUG_INFO: String?
            public let oNLY_ACTIVE_ARCH: String?
    }
}
```

## Example Values
From template: **Base_ProjectSettings.xctemplate**

### DEBUG_INFORMATION_FORMAT
```
dwarf
```

### ENABLE_TESTABILITY
```
YES
```

### GCC_DYNAMIC_NO_PIC
```
NO
```

### GCC_OPTIMIZATION_LEVEL
```
0
```

### GCC_PREPROCESSOR_DEFINITIONS
```
DEBUG=1 $(inherited)
```

### MTL_ENABLE_DEBUG_INFO
```
INCLUDE_SOURCE
```

### ONLY_ACTIVE_ARCH
```
YES
```

