# Definitions*:implementation - Complete Type Specification

## Type Name
`Definitions*:implementation`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitions*:implementation: Codable, Hashable, Sendable {
            public let beginning: String?
            public let end: String?
    }
}
```

## Example Values
From template: **Base_DefinitionsLanguage.xctemplate**

### Beginning
```
@implementation ___FILEBASENAME___

```

### End
```
@end
```

