# OptionsUnitsObjective-CDefinitionsGameController - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsGameController`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsGameController: Codable, Hashable, Sendable {
            public let h: OptionsUnitsObjective-CDefinitionsGameControllerh?
            public let m: OptionsUnitsObjective-CDefinitionsGameControllerm?
    }
}
```

## Example Values
From template: **SharedContent SceneKit Game.xctemplate**

### h
```
{
    Path = "GameController.h";
    TargetIdentifiers =     (
    );
}
```

### m
```
{
    Path = "GameController.m";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

