# OptionsUnitsSwiftDefinitionsShaderTypesh - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsShaderTypesh`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsShaderTypesh: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsSwiftDefinitionsShaderTypeshTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### Path
```
ShaderTypes.h
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

