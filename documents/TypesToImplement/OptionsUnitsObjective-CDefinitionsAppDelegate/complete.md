# OptionsUnitsObjective-CDefinitionsAppDelegate - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsAppDelegate`

## Field Count
6 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsAppDelegate: Codable, Hashable, Sendable {
            public let h:interface:window: String?
            public let m:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body: String
            public let m:implementation:methods:applicationdidFinishLaunchingWithOptions:body: String?
            public let m:implementation:methods:applicationdidFinishLaunchingWithOptions:return: String?
            public let h: OptionsUnitsObjective-CDefinitionsAppDelegateh?
            public let m: OptionsUnitsObjective-CDefinitionsAppDelegatem?
    }
}
```

## Example Values
From template: **macOS Safari Extension App.xctemplate**

### h
```
{
    Path = "AppDelegate.h";
    SortOrder = 1;
}
```

### h:interface:window
```
@property (strong, nonatomic) UIWindow *window;

```

### m
```
{
    Path = "AppDelegate.m";
    SortOrder = 2;
}
```

### m:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body
```
return YES;
```

### m:implementation:methods:applicationdidFinishLaunchingWithOptions:body
```
// Override point for customization after application launch.
```

### m:implementation:methods:applicationdidFinishLaunchingWithOptions:return
```
return YES;
```

