# DefinitionsResources/Iconpng - Complete Type Specification

## Type Name
`DefinitionsResources/Iconpng`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Iconpng: Codable, Hashable, Sendable {
            public let group: String?
            public let path: String?
            public let targetIdentifiers: [DefinitionsResources/IconpngTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension App.xctemplate**

### Group
```
Resources
```

### Path
```
Icon.png
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

