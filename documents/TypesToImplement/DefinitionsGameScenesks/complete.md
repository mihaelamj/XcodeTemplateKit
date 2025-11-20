# DefinitionsGameScenesks - Complete Type Specification

## Type Name
`DefinitionsGameScenesks`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsGameScenesks: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [DefinitionsGameScenesksTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent SpriteKit Game.xctemplate**

### Path
```
GameScene.sks
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

