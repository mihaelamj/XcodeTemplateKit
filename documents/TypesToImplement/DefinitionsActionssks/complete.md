# DefinitionsActionssks - Complete Type Specification

## Type Name
`DefinitionsActionssks`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsActionssks: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [DefinitionsActionssksTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent SpriteKit Game.xctemplate**

### Path
```
Actions.sks
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

