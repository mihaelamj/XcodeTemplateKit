# DefinitionsCommon/Audio/Synthaif - Complete Type Specification

## Type Name
`DefinitionsCommon/Audio/Synthaif`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsCommon/Audio/Synthaif: Codable, Hashable, Sendable {
            public let path: String?
            public let group: [DefinitionsCommon/Audio/SynthaifGroup]?
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
Common/Audio/Synth.aif
```

