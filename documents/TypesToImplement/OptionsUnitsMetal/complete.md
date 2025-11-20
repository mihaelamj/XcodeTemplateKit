# OptionsUnitsMetal - Complete Type Specification

## Type Name
`OptionsUnitsMetal`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsMetal: Codable, Hashable, Sendable {
            public let components: [OptionsUnitsMetalComponents]?
    }
}
```

## Example Values
From template: **Game.xctemplate**

### Components
```
(
        {
        Identifier = "com.apple.dt.unit.crossPlatformMetalGame_sharedComponent";
        Name = "___PACKAGENAME___ Shared";
    }
)
```

