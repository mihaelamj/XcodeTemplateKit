# OptionsUnitsSwiftDefinitionsShaders - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsShaders`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsShaders: Codable, Hashable, Sendable {
            public let metal: OptionsUnitsSwiftDefinitionsShadersmetal?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### metal
```
{
    Path = "Shaders.metal";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

