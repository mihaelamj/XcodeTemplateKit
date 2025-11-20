# Definitions - Complete Type Specification

## Type Name
`Definitions`

## Field Count
21 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitions: Codable, Hashable, Sendable {
            public let *:class:*: String?
            public let *:comments: String?
            public let *:implementation:methods:applicationDidBecomeActive:comments: String?
            public let *:implementation:methods:applicationDidEnterBackground:comments: String?
            public let *:implementation:methods:applicationDidFinishLaunching:comments: String?
            public let *:implementation:methods:applicationWillEnterForeground:comments: String?
            public let *:implementation:methods:applicationWillResignActive:comments: String?
            public let *:implementation:methods:applicationWillTerminate:comments: String
            public let *:implementation:synthesize:*: String?
            public let *:imports:importFramework:*: String?
            public let *:imports:importHeader:*: String?
            public let definitions: Definitions?
            public let *:extension: Definitions*:extension?
            public let *:implementation: Definitions*:implementation?
            public let *:implementation:methods: Definitions*:implementation:methods?
            public let *:implementation:methods:*: Definitions*:implementation:methods:*?
            public let *:implementation:methods:init: Definitions*:implementation:methods:init?
            public let *:implementation:properties: Definitions*:implementation:properties?
            public let *:implementation:synthesize: Definitions*:implementation:synthesize?
            public let *:imports: Definitions*:imports?
            public let *:interface: Definitions*:interface?
    }
}
```

## Example Values
From template: **Base_DefinitionsLanguage.xctemplate**

### Definitions
```
{
    "Info.plist:EXAppExtensionAttributes" = "<key>EXAppExtensionAttributes</key>\n    <dict>\n        <key>EXExtensionPointIdentifier</key>\n        <string>com.example.example-extension</string>\n    </dict>\n";
}
```

### *:class:*
```
@class ___*___;

```

### *:comments
```
//___FILEHEADER___

```

### *:extension
```
{
    Beginning = "@interface ___FILEBASENAME___ ()\n";
    End = "@end\n";
}
```

### *:implementation
```
{
    Beginning = "@implementation ___FILEBASENAME___\n";
    End = "@end";
}
```

### *:implementation:methods
```
{
    Beginning = "";
    End = "";
}
```

### *:implementation:methods:*
```
{
    Beginning = "___*___ {";
    End = "}\n\n";
    Indent = 1;
}
```

### *:implementation:methods:applicationDidBecomeActive:comments
```
// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
```

### *:implementation:methods:applicationDidEnterBackground:comments
```
// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

```

### *:implementation:methods:applicationDidFinishLaunching:comments
```
// Insert code here to initialize your application
```

### *:implementation:methods:applicationWillEnterForeground:comments
```
// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
```

### *:implementation:methods:applicationWillResignActive:comments
```
// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

```

### *:implementation:methods:applicationWillTerminate:comments
```
// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
```

### *:implementation:methods:init
```
{
    Beginning = "- (instancetype)init {\n    self = [super init];\n    if (self) {";
    End = "    }\n    return self;\n}\n";
    Indent = 2;
}
```

### *:implementation:properties
```
{
    Beginning = "";
    End = "\n\n";
}
```

### *:implementation:synthesize
```
{
    End = "\n";
}
```

### *:implementation:synthesize:*
```
@synthesize ___*___;
```

### *:imports
```
{
    Beginning = "";
    End = "\n";
}
```

### *:imports:importFramework:*
```
#import <___*___/___*___.h>
```

### *:imports:importHeader:*
```
#import "___*___"
```

### *:interface
```
{
    Beginning = "@interface ___*___\n";
    End = "\n@end\n";
}
```

