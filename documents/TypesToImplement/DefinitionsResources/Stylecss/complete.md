# DefinitionsResources/Stylecss - Complete Type Specification

## Type Name
`DefinitionsResources/Stylecss`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Stylecss: Codable, Hashable, Sendable {
            public let group: String?
            public let path: String?
            public let targetIdentifiers: [DefinitionsResources/StylecssTargetIdentifiers]?
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
Style.css
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

