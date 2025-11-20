# OptionsUnitsObjective-CDefinitionsRendererm - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsRendererm`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsRendererm: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsObjective-CDefinitionsRenderermTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### Path
```
Renderer.m
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

