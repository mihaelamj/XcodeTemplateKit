# DefinitionsCommon/Audio/Synth - Complete Type Specification

## Type Name
`DefinitionsCommon/Audio/Synth`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsCommon/Audio/Synth: Codable, Hashable, Sendable {
            public let aif: DefinitionsCommon/Audio/Synthaif?
    }
}
```

## Example Values
From template: **Audio Unit Extension App.xctemplate**

### aif
```
{
    Group =     (
        Common,
        Audio
    );
    Path = "Common/Audio/Synth.aif";
}
```

