# OptionsVariables - Complete Type Specification

## Type Name
`OptionsVariables`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsVariables: Codable, Hashable, Sendable {
            public let objective-C: OptionsVariablesObjective-C?
            public let swift: OptionsVariablesSwift?
    }
}
```

## Example Values
From template: **Language Choice.xctemplate**

### Objective-C
```
{
    ibCustomModuleProvider = "";
    moduleNamePrefixForClasses = "";
}
```

### Swift
```
{
    ibCustomModuleProvider = target;
    moduleNamePrefixForClasses = "$(PRODUCT_MODULE_NAME).";
}
```

