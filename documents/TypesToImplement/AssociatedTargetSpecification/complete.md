# AssociatedTargetSpecification - Complete Type Specification

## Type Name
`AssociatedTargetSpecification`

## Field Count
7 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct AssociatedTargetSpecification: Codable, Hashable, Sendable {
            public let associatedTargetIsDependent: Int
            public let associatedTargetIsTargetToBeTested: Int?
            public let associatedTargetNeedsProductBuildPhaseInjection: Int
            public let popUpDescription: String
            public let popUpTitle: String
            public let associatedTargetSpecification: AssociatedTargetSpecification?
            public let allowableProductTypes: [AssociatedTargetSpecificationAllowableProductTypes]?
    }
}
```

## Example Values
From template: **Multiplatform UI Test Bundle Base.xctemplate**

### AssociatedTargetSpecification
```
{
    AllowableProductTypes =     (
        "com.apple.product-type.application"
    );
    AssociatedTargetIsTargetToBeTested = 1;
    PopUpDescription = "The application that this new test bundle will be testing. The new UI Tests will be associated with that target's scheme.";
    PopUpTitle = "Target to be Tested:";
}
```

### AllowableProductTypes
```
(
    "com.apple.product-type.application"
)
```

### AssociatedTargetIsDependent
```
1
```

### AssociatedTargetIsTargetToBeTested
```
1
```

### AssociatedTargetNeedsProductBuildPhaseInjection
```
1
```

### PopUpDescription
```
The application that this new test bundle will be testing. The new UI Tests will be associated with that target's scheme.
```

### PopUpTitle
```
Target to be Tested:
```

