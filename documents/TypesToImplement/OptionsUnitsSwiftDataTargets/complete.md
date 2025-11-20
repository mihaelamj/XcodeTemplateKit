# OptionsUnitsSwiftDataTargets - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDataTargets`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDataTargets: Codable, Hashable, Sendable {
            public let targetIdentifier: String?
            public let sharedSettings: OptionsUnitsSwiftDataTargetsSharedSettings?
    }
}
```

## Example Values
From template: **Multiplatform SwiftUI Document App.xctemplate**

### SharedSettings
```
{
}
```

### TargetIdentifier
```
com.apple.dt.applicationTarget
```

