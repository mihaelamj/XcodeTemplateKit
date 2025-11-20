# Targets - Complete Type Specification

## Type Name
`Targets`

## Field Count
13 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Targets: Codable, Hashable, Sendable {
            public let buildToolArgsString: String?
            public let buildToolPath: String?
            public let concrete: Int
            public let name: String
            public let productType: String
            public let targetIdentifier: String
            public let targetIdentifierToBeTested: String
            public let targetType: String?
            public let targets: [Targets]?
            public let buildPhases: [TargetsBuildPhases]?
            public let configurations: TargetsConfigurations?
            public let frameworks: [TargetsFrameworks]?
            public let sharedSettings: TargetsSharedSettings?
    }
}
```

## Example Values
From template: **External Build System.xctemplate**

### Targets
```
(
        {
        BuildToolArgsString = "$(ACTION)";
        BuildToolPath = "___VARIABLE_buildToolPath___";
        Configurations =         {
            Debug =             {
                "DEBUGGING_SYMBOLS" = YES;
                "DEBUG_INFORMATION_FORMAT" = dwarf;
                "GCC_GENERATE_DEBUGGING_SYMBOLS" = YES;
                "GCC_OPTIMIZATION_LEVEL" = 0;
            };
            Release =             {
                "DEBUG_INFORMATION_FORMAT" = "dwarf-with-dsym";
            };
        };
        SharedSettings =         {
            "OTHER_CFLAGS" = "";
            "OTHER_LDFLAGS" = "";
        };
        TargetIdentifier = "com.apple.dt.cocoaLegacyTarget";
        TargetType = Legacy;
    }
)
```

### BuildPhases
```
(
        {
        Class = Sources;
    },
        {
        Class = Frameworks;
    },
        {
        Class = Resources;
    }
)
```

### BuildToolArgsString
```
$(ACTION)
```

### BuildToolPath
```
___VARIABLE_buildToolPath___
```

### Concrete
```
0
```

### Configurations
```
{
    Debug =     {
        "DEBUGGING_SYMBOLS" = YES;
        "DEBUG_INFORMATION_FORMAT" = dwarf;
        "GCC_GENERATE_DEBUGGING_SYMBOLS" = YES;
        "GCC_OPTIMIZATION_LEVEL" = 0;
    };
    Release =     {
        "DEBUG_INFORMATION_FORMAT" = "dwarf-with-dsym";
    };
}
```

### Frameworks
```
(
    WidgetKit,
    SwiftUI
)
```

### Name
```
___PACKAGENAME___
```

### ProductType
```
com.apple.product-type.bundle.unit-test
```

### SharedSettings
```
{
    "OTHER_CFLAGS" = "";
    "OTHER_LDFLAGS" = "";
}
```

### TargetIdentifier
```
com.apple.dt.cocoaLegacyTarget
```

### TargetIdentifierToBeTested
```
com.apple.dt.iosApplicationTarget
```

### TargetType
```
Legacy
```

