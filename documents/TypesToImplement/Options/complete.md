# Options - Complete Type Specification

## Type Name
`Options`

## Field Count
18 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Options: Codable, Hashable, Sendable {
            public let default: String
            public let description: String
            public let emptyReplacement: String
            public let identifier: String
            public let name: String
            public let notPersisted: String
            public let override: String
            public let placeholder: String?
            public let required: String
            public let sortOrder: Int
            public let type: String
            public let value: String?
            public let options: [Options]?
            public let requiredOptionsForValues: OptionsRequiredOptionsForValues?
            public let units: OptionsUnits?
            public let valueTitles: [OptionsValueTitles]?
            public let values: [OptionsValues]?
            public let variables: OptionsVariables?
    }
}
```

## Example Values
From template: **XCTest Unit Test.xctemplate**

### Options
```
(
)
```

### Default
```
Grid Tile Set
```

### Description
```
Name of the unit test class
```

### EmptyReplacement
```
ProductName
```

### Identifier
```
productName
```

### Name
```
Class:
```

### NotPersisted
```
Yes
```

### Override
```
Swift
```

### Placeholder
```
Your Company
```

### Required
```
Yes
```

### RequiredOptionsForValues
```
{
    None =     {
        languageChoice = Suppress;
    };
    "Swift Testing" =     {
        languageChoice = Swift;
    };
}
```

### SortOrder
```
100
```

### Type
```
text
```

### Units
```
{
    "Objective-C" =     {
        Definitions =         {
            "GameController.h" =             {
                Path = "GameController.h";
                TargetIdentifiers =                 (
                );
            };
            "GameController.m" =             {
                Path = "GameController.m";
                TargetIdentifiers =                 (
                    "com.apple.dt.iosApplicationTarget",
                    "com.apple.dt.tvosApplicationTarget",
                    "com.apple.dt.osxApplicationTarget"
                );
            };
        };
        Nodes =         (
            "GameController.h",
            "GameController.m"
        );
    };
    Swift =     {
        Definitions =         {
            "GameController.swift" =             {
                Path = "GameController.swift";
                TargetIdentifiers =                 (
                    "com.apple.dt.iosApplicationTarget",
                    "com.apple.dt.tvosApplicationTarget",
                    "com.apple.dt.osxApplicationTarget"
                );
            };
        };
        Nodes =         (
            "GameController.swift"
        );
    };
}
```

### Value
```
XCTest
```

### ValueTitles
```
(
    None,
    XCTest,
    "Swift Testing"
)
```

### Values
```
(
    "Grid Tile Set",
    "Isometric Tile Set",
    "Hexagonal Tile Set",
    "Empty Tile Set"
)
```

### Variables
```
{
}
```

