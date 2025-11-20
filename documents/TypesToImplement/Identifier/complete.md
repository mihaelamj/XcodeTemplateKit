# Identifier - Complete Type Specification

## Type Name
`Identifier`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Identifier: Codable, Hashable, Sendable {
            public let identifier: String
    }
}
```

## Example Values
From template: **External Build System.xctemplate**

### Identifier
```
com.apple.dt.unit.externalBuildSystem
```

