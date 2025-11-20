# OptionsUnitsSceneKit - Complete Type Specification

## Type Name
`OptionsUnitsSceneKit`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSceneKit: Codable, Hashable, Sendable {
            public let components: [OptionsUnitsSceneKitComponents]?
    }
}
```

## Example Values
From template: **Game.xctemplate**

### Components
```
(
        {
        Identifier = "com.apple.dt.unit.crossPlatformSceneKitGame_sharedComponent";
        Name = "___PACKAGENAME___ Shared";
    }
)
```

