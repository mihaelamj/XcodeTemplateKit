# Definitions___PACKAGENAME:identifier___entitlements - Complete Type Specification

## Type Name
`Definitions___PACKAGENAME:identifier___entitlements`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitions___PACKAGENAME:identifier___entitlements: Codable, Hashable, Sendable {
            public let path: String?
            public let sortOrder: Int?
            public let targetIdentifiers: [Definitions___PACKAGENAME:identifier___entitlementsTargetIdentifiers]?
    }
}
```

## Example Values
From template: **Audio Unit Extension App.xctemplate**

### Path
```
App.entitlements
```

### SortOrder
```
1000
```

### TargetIdentifiers
```
(
)
```

