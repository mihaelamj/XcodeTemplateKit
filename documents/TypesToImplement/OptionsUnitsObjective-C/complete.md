# OptionsUnitsObjective-C - Complete Type Specification

## Type Name
`OptionsUnitsObjective-C`

## Field Count
4 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-C: Codable, Hashable, Sendable {
            public let definitions: OptionsUnitsObjective-CDefinitions?
            public let nodes: [OptionsUnitsObjective-CNodes]?
            public let requiredOptions: OptionsUnitsObjective-CRequiredOptions?
            public let targets: [OptionsUnitsObjective-CTargets]?
    }
}
```

## Example Values
From template: **iOS App Base.xctemplate**

### Definitions
```
{
    "GameController.h" =     {
        Path = "GameController.h";
        TargetIdentifiers =         (
        );
    };
    "GameController.m" =     {
        Path = "GameController.m";
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
    "GameController.h",
    "GameController.m"
)
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
            "INFOPLIST_KEY_UILaunchStoryboardName" = LaunchScreen;
            "INFOPLIST_KEY_UIMainStoryboardFile" = Main;
        };
        TargetIdentifier = "com.apple.dt.iosApplicationTarget";
    }
)
```

