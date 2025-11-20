# DefinitionsResources/Baselproj/Mainhtml - Complete Type Specification

## Type Name
`DefinitionsResources/Baselproj/Mainhtml`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Baselproj/Mainhtml: Codable, Hashable, Sendable {
            public let group: String?
            public let path: String?
            public let targetIdentifiers: [DefinitionsResources/Baselproj/MainhtmlTargetIdentifiers]?
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
Main.html
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

