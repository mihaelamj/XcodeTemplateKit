# OptionsUnitsSpriteKit - Complete Type Specification

## Type Name
`OptionsUnitsSpriteKit`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSpriteKit: Codable, Hashable, Sendable {
            public let components: [OptionsUnitsSpriteKitComponents]?
    }
}
```

## Example Values
From template: **Game.xctemplate**

### Components
```
(
        {
        Identifier = "com.apple.dt.unit.crossPlatformSpriteKitGame_sharedComponent";
        Name = "___PACKAGENAME___ Shared";
    }
)
```

