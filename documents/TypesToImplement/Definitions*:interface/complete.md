# Definitions*:interface - Complete Type Specification

## Type Name
`Definitions*:interface`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitions*:interface: Codable, Hashable, Sendable {
            public let beginning: String?
            public let end: String?
    }
}
```

## Example Values
From template: **Base_DefinitionsLanguage.xctemplate**

### Beginning
```
@interface ___*___

```

### End
```

@end

```

