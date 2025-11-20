# AllowedTypes - Complete Type Specification

## Type Name
`AllowedTypes`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct AllowedTypes: Codable, Hashable, Sendable {
            public let allowedTypes: [AllowedTypes]?
    }
}
```

## Example Values
From template: **Transient App Entity.xctemplate**

### AllowedTypes
```
(
    "public.swift-source"
)
```

