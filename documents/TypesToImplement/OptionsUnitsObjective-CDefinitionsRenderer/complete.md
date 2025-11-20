# OptionsUnitsObjective-CDefinitionsRenderer - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsRenderer`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsRenderer: Codable, Hashable, Sendable {
            public let h: OptionsUnitsObjective-CDefinitionsRendererh?
            public let m: OptionsUnitsObjective-CDefinitionsRendererm?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### h
```
{
    Path = "Renderer.h";
    TargetIdentifiers =     (
    );
}
```

### m
```
{
    Path = "Renderer.m";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

