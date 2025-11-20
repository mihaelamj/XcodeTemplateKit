# OptionsUnitsForAppTemplate - Complete Type Specification

## Type Name
`OptionsUnitsForAppTemplate`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsForAppTemplate: Codable, Hashable, Sendable {
            public let targets: [OptionsUnitsForAppTemplateTargets]?
    }
}
```

## Example Values
From template: **iOS Safari Extension.xctemplate**

### Targets
```
(
        {
        SharedSettings =         {
            "PRODUCT_BUNDLE_IDENTIFIER" = "___VARIABLE_bundleIdentifier:bundleIdentifier___.Extension";
        };
    }
)
```

