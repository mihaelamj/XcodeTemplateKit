# DefinitionsActions - Complete Type Specification

## Type Name
`DefinitionsActions`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsActions: Codable, Hashable, Sendable {
            public let sks: DefinitionsActionssks?
    }
}
```

## Example Values
From template: **SharedContent SpriteKit Game.xctemplate**

### sks
```
{
    Path = "Actions.sks";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

