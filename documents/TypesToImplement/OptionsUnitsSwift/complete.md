# OptionsUnitsSwift - Complete Type Specification

## Type Name
`OptionsUnitsSwift`

## Field Count
5 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwift: Codable, Hashable, Sendable {
            public let definitions: OptionsUnitsSwiftDefinitions?
            public let nodes: [OptionsUnitsSwiftNodes]?
            public let project: OptionsUnitsSwiftProject?
            public let requiredOptions: OptionsUnitsSwiftRequiredOptions?
            public let targets: [OptionsUnitsSwiftTargets]?
    }
}
```

## Example Values
From template: **Base_ProjectSettings.xctemplate**

### Definitions
```
{
    "GameController.swift" =     {
        Path = "GameController.swift";
        TargetIdentifiers =         (
            "com.apple.dt.iosApplicationTarget",
            "com.apple.dt.tvosApplicationTarget",
            "com.apple.dt.osxApplicationTarget"
        );
    };
}
```

### Nodes
```
(
    "GameController.swift"
)
```

### Project
```
{
    Configurations =     {
        Debug =         {
            "SWIFT_ACTIVE_COMPILATION_CONDITIONS" = "DEBUG $(inherited)";
            "SWIFT_OPTIMIZATION_LEVEL" = "-Onone";
        };
        Release =         {
            "SWIFT_COMPILATION_MODE" = wholemodule;
        };
    };
}
```

### RequiredOptions
```
{
    appLifecycle = Cocoa;
}
```

### Targets
```
(
        {
        SharedSettings =         {
            "SWIFT_OBJC_BRIDGING_HEADER" = "___PARENTPACKAGENAME___ Shared/ShaderTypes.h";
        };
    }
)
```

