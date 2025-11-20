# OptionsUnitsObjective-CDefinitionsGameScene - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsGameScene`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsGameScene: Codable, Hashable, Sendable {
            public let h: OptionsUnitsObjective-CDefinitionsGameSceneh?
            public let m: OptionsUnitsObjective-CDefinitionsGameScenem?
    }
}
```

## Example Values
From template: **SharedContent SpriteKit Game.xctemplate**

### h
```
{
    Path = "GameScene.h";
    TargetIdentifiers =     (
    );
}
```

### m
```
{
    Path = "GameScene.m";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

