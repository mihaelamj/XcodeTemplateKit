# Project - Complete Type Specification

## Type Name
`Project`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Project: Codable, Hashable, Sendable {
            public let project: Project?
            public let configurations: ProjectConfigurations?
            public let sharedSettings: ProjectSharedSettings?
    }
}
```

## Example Values
From template: **Empty.xctemplate**

### Project
```
{
    Configurations =     {
        Debug =         {
        };
        Release =         {
        };
    };
}
```

### Configurations
```
{
    Debug =     {
    };
    Release =     {
    };
}
```

### SharedSettings
```
{
    "IPHONEOS_DEPLOYMENT_TARGET" = "15.0";
}
```

