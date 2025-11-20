# OptionsUnitsSwiftDefinitionsAppDelegate - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsAppDelegate`

## Field Count
7 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsAppDelegate: Codable, Hashable, Sendable {
            public let swift:NSApplicationMain: String?
            public let swift:UIApplicationMain: String?
            public let swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body: String
            public let swift:implementation:methods:applicationdidFinishLaunchingWithOptions:body: String?
            public let swift:implementation:methods:applicationdidFinishLaunchingWithOptions:return: String?
            public let swift:implementation:properties:window: String?
            public let swift: OptionsUnitsSwiftDefinitionsAppDelegateswift?
    }
}
```

## Example Values
From template: **macOS Safari Extension App.xctemplate**

### swift
```
{
    Path = "AppDelegate.swift";
    SortOrder = 1;
}
```

### swift:NSApplicationMain
```
@main
```

### swift:UIApplicationMain
```
@main
```

### swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body
```
return true
```

### swift:implementation:methods:applicationdidFinishLaunchingWithOptions:body
```
// Override point for customization after application launch.
```

### swift:implementation:methods:applicationdidFinishLaunchingWithOptions:return
```
return true
```

### swift:implementation:properties:window
```
var window: UIWindow?
```

