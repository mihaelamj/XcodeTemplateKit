# TargetsConfigurations - Complete Type Specification

## Type Name
`TargetsConfigurations`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct TargetsConfigurations: Codable, Hashable, Sendable {
            public let debug: TargetsConfigurationsDebug?
            public let release: TargetsConfigurationsRelease?
    }
}
```

## Example Values
From template: **External Build System.xctemplate**

### Debug
```
{
    "DEBUGGING_SYMBOLS" = YES;
    "DEBUG_INFORMATION_FORMAT" = dwarf;
    "GCC_GENERATE_DEBUGGING_SYMBOLS" = YES;
    "GCC_OPTIMIZATION_LEVEL" = 0;
}
```

### Release
```
{
    "DEBUG_INFORMATION_FORMAT" = "dwarf-with-dsym";
}
```

