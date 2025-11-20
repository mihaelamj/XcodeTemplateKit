# OptionsUnitsSwiftDefinitionsGameControllerswift - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsGameControllerswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsGameControllerswift: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsSwiftDefinitionsGameControllerswiftTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent SceneKit Game.xctemplate**

### Path
```
GameController.swift
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

