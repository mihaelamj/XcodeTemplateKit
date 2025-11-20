# OptionsUnitsSwiftProjectConfigurationsDebug - Complete Type Specification

## Type Name
`OptionsUnitsSwiftProjectConfigurationsDebug`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftProjectConfigurationsDebug: Codable, Hashable, Sendable {
            public let sWIFT_ACTIVE_COMPILATION_CONDITIONS: String?
            public let sWIFT_OPTIMIZATION_LEVEL: String?
    }
}
```

## Example Values
From template: **Base_ProjectSettings.xctemplate**

### SWIFT_ACTIVE_COMPILATION_CONDITIONS
```
DEBUG $(inherited)
```

### SWIFT_OPTIMIZATION_LEVEL
```
-Onone
```

