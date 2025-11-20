# OptionsUnitstrue - Complete Type Specification

## Type Name
`OptionsUnitstrue`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitstrue: Codable, Hashable, Sendable {
            public let definitions: OptionsUnitstrueDefinitions?
            public let nodes: [OptionsUnitstrueNodes]?
    }
}
```

## Example Values
From template: **Framework Base.xctemplate**

### Definitions
```
{
    "___PACKAGENAMEASIDENTIFIER___.docc" =     {
        Path = "___PACKAGENAMEASIDENTIFIER___.docc";
        SortOrder = 99;
    };
}
```

### Nodes
```
(
    "___PACKAGENAMEASIDENTIFIER___.docc"
)
```

