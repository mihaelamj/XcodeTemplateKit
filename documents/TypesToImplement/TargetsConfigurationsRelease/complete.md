# TargetsConfigurationsRelease - Complete Type Specification

## Type Name
`TargetsConfigurationsRelease`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct TargetsConfigurationsRelease: Codable, Hashable, Sendable {
            public let dEBUG_INFORMATION_FORMAT: String?
            public let vALIDATE_PRODUCT: String?
    }
}
```

## Example Values
From template: **External Build System.xctemplate**

### DEBUG_INFORMATION_FORMAT
```
dwarf-with-dsym
```

### VALIDATE_PRODUCT
```
YES
```

