# OptionsUnitsObjective-CTargets - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CTargets`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CTargets: Codable, Hashable, Sendable {
            public let targetIdentifier: String?
            public let sharedSettings: OptionsUnitsObjective-CTargetsSharedSettings?
    }
}
```

## Example Values
From template: **iOS App Base.xctemplate**

### SharedSettings
```
{
    "INFOPLIST_KEY_UILaunchStoryboardName" = LaunchScreen;
    "INFOPLIST_KEY_UIMainStoryboardFile" = Main;
}
```

### TargetIdentifier
```
com.apple.dt.iosApplicationTarget
```

