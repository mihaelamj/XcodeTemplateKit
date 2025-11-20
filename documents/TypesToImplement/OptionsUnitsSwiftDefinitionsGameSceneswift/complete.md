# OptionsUnitsSwiftDefinitionsGameSceneswift - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsGameSceneswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsGameSceneswift: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsSwiftDefinitionsGameSceneswiftTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent SpriteKit Game.xctemplate**

### Path
```
GameScene.swift
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

