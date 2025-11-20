# OptionsUnitsForAppTemplateTargetsSharedSettings - Complete Type Specification

## Type Name
`OptionsUnitsForAppTemplateTargetsSharedSettings`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsForAppTemplateTargetsSharedSettings: Codable, Hashable, Sendable {
            public let pRODUCT_BUNDLE_IDENTIFIER: String?
    }
}
```

## Example Values
From template: **iOS Safari Extension.xctemplate**

### PRODUCT_BUNDLE_IDENTIFIER
```
___VARIABLE_bundleIdentifier:bundleIdentifier___.Extension
```

