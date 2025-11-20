# OptionsUnitsSwiftDefinitionsShadersmetal - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsShadersmetal`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsShadersmetal: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsSwiftDefinitionsShadersmetalTargetIdentifiers]?
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

