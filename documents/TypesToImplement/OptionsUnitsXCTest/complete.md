# OptionsUnitsXCTest - Complete Type Specification

## Type Name
`OptionsUnitsXCTest`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsXCTest: Codable, Hashable, Sendable {
            public let definitions: OptionsUnitsXCTestDefinitions?
            public let nodes: [OptionsUnitsXCTestNodes]?
            public let requiredOptions: OptionsUnitsXCTestRequiredOptions?
    }
}
```

## Example Values
From template: **Framework Testing Bundle.xctemplate**

### Definitions
```
{
    "___PACKAGENAMEASIDENTIFIER___.swift" =     {
        Path = "UnitTest-XCTest.swift";
    };
}
```

### Nodes
```
(
    "___PACKAGENAMEASIDENTIFIER___.swift"
)
```

### RequiredOptions
```
{
    languageChoice = Swift;
}
```

