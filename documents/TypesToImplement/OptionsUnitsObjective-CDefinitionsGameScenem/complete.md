# OptionsUnitsObjective-CDefinitionsGameScenem - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsGameScenem`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsGameScenem: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsObjective-CDefinitionsGameScenemTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent SpriteKit Game.xctemplate**

### Path
```
GameScene.m
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

