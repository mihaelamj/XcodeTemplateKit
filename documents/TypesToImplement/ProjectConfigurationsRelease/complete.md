# ProjectConfigurationsRelease - Complete Type Specification

## Type Name
`ProjectConfigurationsRelease`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct ProjectConfigurationsRelease: Codable, Hashable, Sendable {
            public let dEBUG_INFORMATION_FORMAT: String?
            public let eNABLE_NS_ASSERTIONS: String?
            public let mTL_ENABLE_DEBUG_INFO: String?
    }
}
```

## Example Values
From template: **Base_ProjectSettings.xctemplate**

### DEBUG_INFORMATION_FORMAT
```
dwarf-with-dsym
```

### ENABLE_NS_ASSERTIONS
```
NO
```

### MTL_ENABLE_DEBUG_INFO
```
NO
```

