# DefinitionsCommon/Audio/SimplePlayEngineswift - Complete Type Specification

## Type Name
`DefinitionsCommon/Audio/SimplePlayEngineswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsCommon/Audio/SimplePlayEngineswift: Codable, Hashable, Sendable {
            public let path: String?
            public let group: [DefinitionsCommon/Audio/SimplePlayEngineswiftGroup]?
    }
}
```

## Example Values
From template: **Audio Unit Extension App.xctemplate**

### Group
```
(
    Common,
    Audio
)
```

### Path
```
Common/Audio/SimplePlayEngine.swift
```

