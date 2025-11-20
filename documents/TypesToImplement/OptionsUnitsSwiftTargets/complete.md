# OptionsUnitsSwiftTargets - Complete Type Specification

## Type Name
`OptionsUnitsSwiftTargets`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftTargets: Codable, Hashable, Sendable {
            public let concrete: Int?
            public let targetIdentifier: String?
            public let sharedSettings: OptionsUnitsSwiftTargetsSharedSettings?
    }
}
```

## Example Values
From template: **macOS Metal Game.xctemplate**

### Concrete
```
0
```

### SharedSettings
```
{
    "SWIFT_OBJC_BRIDGING_HEADER" = "___PARENTPACKAGENAME___ Shared/ShaderTypes.h";
}
```

### TargetIdentifier
```
com.apple.dt.iosApplicationTarget
```

