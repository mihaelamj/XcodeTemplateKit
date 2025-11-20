# DefinitionsGameScene - Complete Type Specification

## Type Name
`DefinitionsGameScene`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsGameScene: Codable, Hashable, Sendable {
            public let sks: DefinitionsGameScenesks?
    }
}
```

## Example Values
From template: **SharedContent SpriteKit Game.xctemplate**

### sks
```
{
    Path = "GameScene.sks";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

