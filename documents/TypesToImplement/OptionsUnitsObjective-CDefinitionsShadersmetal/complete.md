# OptionsUnitsObjective-CDefinitionsShadersmetal - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsShadersmetal`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsShadersmetal: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsObjective-CDefinitionsShadersmetalTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### Path
```
Shaders.metal
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

