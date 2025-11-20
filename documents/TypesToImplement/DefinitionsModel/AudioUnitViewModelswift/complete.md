# DefinitionsModel/AudioUnitViewModelswift - Complete Type Specification

## Type Name
`DefinitionsModel/AudioUnitViewModelswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsModel/AudioUnitViewModelswift: Codable, Hashable, Sendable {
            public let path: String?
            public let group: [DefinitionsModel/AudioUnitViewModelswiftGroup]?
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
Model/AudioUnitViewModel.swift
```

