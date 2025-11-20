# OptionsUnitsSwiftDefinitionsSafariWebExtensionHandlerswift - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsSafariWebExtensionHandlerswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsSafariWebExtensionHandlerswift: Codable, Hashable, Sendable {
            public let path: String?
            public let targetIdentifiers: [OptionsUnitsSwiftDefinitionsSafariWebExtensionHandlerswiftTargetIdentifiers]?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension.xctemplate**

### Path
```
SafariWebExtensionHandler.swift
```

### TargetIdentifiers
```
(
    "com.apple.dt.safariExtension.iOS",
    "com.apple.dt.safariExtension.macOS"
)
```

