# m:main:UIApplicationMain - Value

**Template**: iOS App Base.xctemplate
**Field Path**: `Options[].Units.Objective-C.Definitions.main.m:main:UIApplicationMain`

## Value

```
NSString * appDelegateClassName;
@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
    appDelegateClassName = NSStringFromClass([AppDelegate class]);
}
return UIApplicationMain(argc, argv, nil, appDelegateClassName);

```
