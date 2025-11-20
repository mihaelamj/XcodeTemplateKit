# Nodes - Complete Type Specification

## Type Name
`Nodes`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Nodes: Codable, Hashable, Sendable {
            public let nodes: [Nodes]?
    }
}
```

## Example Values
From template: **Generic Extension.xctemplate**

### Nodes
```
(
    "Info.plist:EXAppExtensionAttributes"
)
```

