# DefinitionsShaders - Complete Type Specification

## Type Name
`DefinitionsShaders`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsShaders: Codable, Hashable, Sendable {
            public let metal: DefinitionsShadersmetal?
    }
}
```

## Example Values
From template: **Compositor Services.xctemplate**

### metal
```
{
    OmitFromProjectStructure = 1;
    Path = "Shaders.metal";
}
```

