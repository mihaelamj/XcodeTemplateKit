# DefinitionsModel/AudioUnitHostModelswift - Complete Type Specification

## Type Name
`DefinitionsModel/AudioUnitHostModelswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsModel/AudioUnitHostModelswift: Codable, Hashable, Sendable {
            public let path: String?
            public let group: [DefinitionsModel/AudioUnitHostModelswiftGroup]?
    }
}
```

## Example Values
From template: **Audio Unit Extension App.xctemplate**

### Group
```
(
    Model
)
```

### Path
```
Model/AudioUnitHostModel.swift
```

