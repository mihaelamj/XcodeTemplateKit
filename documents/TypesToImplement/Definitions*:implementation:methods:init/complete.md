# Definitions*:implementation:methods:init - Complete Type Specification

## Type Name
`Definitions*:implementation:methods:init`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitions*:implementation:methods:init: Codable, Hashable, Sendable {
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
- (instancetype)init {
    self = [super init];
    if (self) {
```

### End
```
    }
    return self;
}

```

### Indent
```
2
```

