# OptionsUnitsSwiftProjectConfigurations - Complete Type Specification

## Type Name
`OptionsUnitsSwiftProjectConfigurations`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftProjectConfigurations: Codable, Hashable, Sendable {
            public let debug: OptionsUnitsSwiftProjectConfigurationsDebug?
            public let release: OptionsUnitsSwiftProjectConfigurationsRelease?
    }
}
```

## Example Values
From template: **Base_ProjectSettings.xctemplate**

### Debug
```
{
    "SWIFT_ACTIVE_COMPILATION_CONDITIONS" = "DEBUG $(inherited)";
    "SWIFT_OPTIMIZATION_LEVEL" = "-Onone";
}
```

### Release
```
{
    "SWIFT_COMPILATION_MODE" = wholemodule;
}
```

