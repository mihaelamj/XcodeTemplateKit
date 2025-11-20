# OptionsUnitsObjective-CDefinitionsViewControllerm - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsViewControllerm`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsViewControllerm: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsObjective-CDefinitionsViewControllermTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension App.xctemplate**

### Path
```
ViewController.m
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

