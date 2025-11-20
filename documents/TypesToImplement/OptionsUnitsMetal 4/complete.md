# OptionsUnitsMetal 4 - Complete Type Specification

## Type Name
`OptionsUnitsMetal 4`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsMetal 4: Codable, Hashable, Sendable {
            public let components: [OptionsUnitsMetal 4Components]?
    }
}
```

## Example Values
From template: **Game.xctemplate**

### Components
```
(
        {
        Identifier = "com.apple.dt.unit.crossPlatformMetal4Game_sharedComponent";
        Name = "___PACKAGENAME___ Shared";
    }
)
```

