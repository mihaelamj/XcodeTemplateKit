# OptionsUnitsRenderer - Complete Type Specification

## Type Name
`OptionsUnitsRenderer`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsRenderer: Codable, Hashable, Sendable {
            public let definitions: OptionsUnitsRendererDefinitions?
            public let nodes: [OptionsUnitsRendererNodes]?
            public let requiredOptions: OptionsUnitsRendererRequiredOptions?
    }
}
```

## Example Values
From template: **Compositor Services.xctemplate**

### Definitions
```
{
    "Renderer.swift" =     {
        OmitFromProjectStructure = 1;
        Path = "Metal/Mixed-Full/Renderer.swift";
    };
}
```

### Nodes
```
(
    "Renderer.swift"
)
```

### RequiredOptions
```
{
    immersiveSpaceStyle = Full;
    secondarySceneType = Metal;
}
```

