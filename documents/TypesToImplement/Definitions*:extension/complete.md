# Definitions*:extension - Complete Type Specification

## Type Name
`Definitions*:extension`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitions*:extension: Codable, Hashable, Sendable {
            public let beginning: String?
            public let end: String?
    }
}
```

## Example Values
From template: **Base_DefinitionsLanguage.xctemplate**

### Beginning
```
@interface ___FILEBASENAME___ ()

```

### End
```
@end

```

