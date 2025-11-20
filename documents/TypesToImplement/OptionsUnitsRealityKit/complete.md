# OptionsUnitsRealityKit - Complete Type Specification

## Type Name
`OptionsUnitsRealityKit`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsRealityKit: Codable, Hashable, Sendable {
            public let components: [OptionsUnitsRealityKitComponents]?
    }
}
```

## Example Values
From template: **Game.xctemplate**

### Components
```
(
        {
        Identifier = "com.apple.dt.unit.crossPlatformRealityKitGame";
        Name = "___PACKAGENAME___";
    }
)
```

