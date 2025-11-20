# DefinitionsResources/Scriptjs - Complete Type Specification

## Type Name
`DefinitionsResources/Scriptjs`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Scriptjs: Codable, Hashable, Sendable {
            public let group: String?
            public let path: String?
            public let targetIdentifiers: [DefinitionsResources/ScriptjsTargetIdentifiers]?
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
Script.js
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

