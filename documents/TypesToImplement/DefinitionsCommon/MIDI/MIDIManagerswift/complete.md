# DefinitionsCommon/MIDI/MIDIManagerswift - Complete Type Specification

## Type Name
`DefinitionsCommon/MIDI/MIDIManagerswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsCommon/MIDI/MIDIManagerswift: Codable, Hashable, Sendable {
            public let path: String?
            public let group: [DefinitionsCommon/MIDI/MIDIManagerswiftGroup]?
    }
}
```

## Example Values
From template: **Audio Unit Extension App.xctemplate**

### Group
```
(
    Common,
    MIDI
)
```

### Path
```
Common/MIDI/MIDIManager.swift
```

