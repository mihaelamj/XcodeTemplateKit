# TargetsConfigurationsDebug - Complete Type Specification

## Type Name
`TargetsConfigurationsDebug`

## Field Count
4 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct TargetsConfigurationsDebug: Codable, Hashable, Sendable {
            public let dEBUGGING_SYMBOLS: String?
            public let dEBUG_INFORMATION_FORMAT: String?
            public let gCC_GENERATE_DEBUGGING_SYMBOLS: String?
            public let gCC_OPTIMIZATION_LEVEL: String?
    }
}
```

## Example Values
From template: **External Build System.xctemplate**

### DEBUGGING_SYMBOLS
```
YES
```

### DEBUG_INFORMATION_FORMAT
```
dwarf
```

### GCC_GENERATE_DEBUGGING_SYMBOLS
```
YES
```

### GCC_OPTIMIZATION_LEVEL
```
0
```

