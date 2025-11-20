# OptionsUnitsSwiftDefinitionsRenderer - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsRenderer`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsRenderer: Codable, Hashable, Sendable {
            public let swift: OptionsUnitsSwiftDefinitionsRendererswift?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### swift
```
{
    Path = "Renderer.swift";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

