# OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandlerm - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandlerm`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandlerm: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandlermTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension.xctemplate**

### Path
```
SafariWebExtensionHandler.m
```

### TargetIdentifiers
```
(
    "com.apple.dt.safariExtension.iOS",
    "com.apple.dt.safariExtension.macOS"
)
```

