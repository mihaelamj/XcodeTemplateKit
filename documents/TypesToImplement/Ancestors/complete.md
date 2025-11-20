# Ancestors - Complete Type Specification

## Type Name
`Ancestors`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Ancestors: Codable, Hashable, Sendable {
            public let ancestors: [Ancestors]?
    }
}
```

## Example Values
From template: **External Build System.xctemplate**

### Ancestors
```
(
    "com.apple.dt.unit.base"
)
```

