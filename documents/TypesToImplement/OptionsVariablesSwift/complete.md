# OptionsVariablesSwift - Complete Type Specification

## Type Name
`OptionsVariablesSwift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsVariablesSwift: Codable, Hashable, Sendable {
            public let ibCustomModuleProvider: String?
            public let moduleNamePrefixForClasses: String?
    }
}
```

## Example Values
From template: **Language Choice.xctemplate**

### ibCustomModuleProvider
```
target
```

### moduleNamePrefixForClasses
```
$(PRODUCT_MODULE_NAME).
```

