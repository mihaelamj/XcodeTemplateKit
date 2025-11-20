# OptionsRequiredOptionsForValues - Complete Type Specification

## Type Name
`OptionsRequiredOptionsForValues`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsRequiredOptionsForValues: Codable, Hashable, Sendable {
            public let none: OptionsRequiredOptionsForValuesNone?
            public let swift Testing: OptionsRequiredOptionsForValuesSwift Testing?
            public let swiftData: OptionsRequiredOptionsForValuesSwiftData?
    }
}
```

## Example Values
From template: **Unit Testing Bundle.xctemplate**

### None
```
{
    languageChoice = Suppress;
}
```

### Swift Testing
```
{
    languageChoice = Swift;
}
```

### SwiftData
```
{
    appLifecycle = SwiftUI;
}
```

