# DefinitionsInfoplist - Complete Type Specification

## Type Name
`DefinitionsInfoplist`

## Field Count
6 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsInfoplist: Codable, Hashable, Sendable {
            public let beginning: String?
            public let end: String?
            public let indent: Int?
            public let sortOrder: Int?
            public let substituteMacros: Int?
            public let targetIdentifiers: [DefinitionsInfoplistTargetIdentifiers]?
    }
}
```

## Example Values
From template: **Base_DefinitionsInfoPlist.xctemplate**

### Beginning
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>

```

### End
```
</dict>
</plist>
```

### Indent
```
1
```

### SortOrder
```
200
```

### SubstituteMacros
```
1
```

### TargetIdentifiers
```
(
)
```

