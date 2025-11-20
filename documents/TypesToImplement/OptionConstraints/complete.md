# OptionConstraints - Complete Type Specification

## Type Name
`OptionConstraints`

## Field Count
4 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionConstraints: Codable, Hashable, Sendable {
            public let constraintType: String
            public let identifier: String
            public let value: String
            public let optionConstraints: [OptionConstraints]?
    }
}
```

## Example Values
From template: **UI Testing Bundle.xctemplate**

### OptionConstraints
```
(
        {
        ConstraintType = DefaultIfAssociatedTarget;
        Identifier = productName;
        Value = "___ASSOCIATEDTARGET_bundleName___UITests";
    }
)
```

### ConstraintType
```
DefaultIfAssociatedTarget
```

### Identifier
```
productName
```

### Value
```
___ASSOCIATEDTARGET_bundleName___UITests
```

