# OptionsUnitsSwiftProject - Complete Type Specification

## Type Name
`OptionsUnitsSwiftProject`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftProject: Codable, Hashable, Sendable {
            public let configurations: OptionsUnitsSwiftProjectConfigurations?
    }
}
```

## Example Values
From template: **Base_ProjectSettings.xctemplate**

### Configurations
```
{
    Debug =     {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS" = "DEBUG $(inherited)";
        "SWIFT_OPTIMIZATION_LEVEL" = "-Onone";
    };
    Release =     {
        "SWIFT_COMPILATION_MODE" = wholemodule;
    };
}
```

