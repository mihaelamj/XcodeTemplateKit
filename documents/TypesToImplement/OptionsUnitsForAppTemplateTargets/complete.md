# OptionsUnitsForAppTemplateTargets - Complete Type Specification

## Type Name
`OptionsUnitsForAppTemplateTargets`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsForAppTemplateTargets: Codable, Hashable, Sendable {
            public let sharedSettings: OptionsUnitsForAppTemplateTargetsSharedSettings?
    }
}
```

## Example Values
From template: **iOS Safari Extension.xctemplate**

### SharedSettings
```
{
    "PRODUCT_BUNDLE_IDENTIFIER" = "___VARIABLE_bundleIdentifier:bundleIdentifier___.Extension";
}
```

