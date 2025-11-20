# Definitions*:implementation:methods:* - Complete Type Specification

## Type Name
`Definitions*:implementation:methods:*`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitions*:implementation:methods:*: Codable, Hashable, Sendable {
            public let beginning: String?
            public let end: String?
            public let indent: Int?
    }
}
```

## Example Values
From template: **Base_DefinitionsLanguage.xctemplate**

### Beginning
```
___*___ {
```

### End
```
}


```

### Indent
```
1
```

