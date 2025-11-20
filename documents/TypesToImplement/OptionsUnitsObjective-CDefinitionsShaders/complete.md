# OptionsUnitsObjective-CDefinitionsShaders - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsShaders`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsShaders: Codable, Hashable, Sendable {
            public let metal: OptionsUnitsObjective-CDefinitionsShadersmetal?
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

