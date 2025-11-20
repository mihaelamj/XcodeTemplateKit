# OptionsUnitsSwiftDefinitionsRendererswift - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsRendererswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsRendererswift: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsSwiftDefinitionsRendererswiftTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### Path
```
Renderer.swift
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

