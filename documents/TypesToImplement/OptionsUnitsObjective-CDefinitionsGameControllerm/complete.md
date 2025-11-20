# OptionsUnitsObjective-CDefinitionsGameControllerm - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsGameControllerm`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsGameControllerm: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsObjective-CDefinitionsGameControllermTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent SceneKit Game.xctemplate**

### Path
```
GameController.m
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

