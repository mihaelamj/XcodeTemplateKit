# DefinitionsArtscnassets - Complete Type Specification

## Type Name
`DefinitionsArtscnassets`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsArtscnassets: Codable, Hashable, Sendable {
            public let path: String?
            public let sortOrder: Int?
            public let targetIdentifiers: [DefinitionsArtscnassetsTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent SceneKit Game.xctemplate**

### Path
```
Art.scnassets
```

### SortOrder
```
99
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

