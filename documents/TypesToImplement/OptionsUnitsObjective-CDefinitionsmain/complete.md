# OptionsUnitsObjective-CDefinitionsmain - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsmain`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsmain: Codable, Hashable, Sendable {
            public let m:main:NSApplicationMain: String?
            public let m:main:UIApplicationMain: String?
            public let m:main: OptionsUnitsObjective-CDefinitionsmainm:main?
    }
}
```

## Example Values
From template: **macOS Safari Extension App.xctemplate**

### m:main
```
{
    Beginning = "int main(int argc, char * argv[]) {";
    End = "}";
    Indent = 1;
}
```

### m:main:NSApplicationMain
```
@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
}
return NSApplicationMain(argc, argv);
```

### m:main:UIApplicationMain
```
NSString * appDelegateClassName;
@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
    appDelegateClassName = NSStringFromClass([AppDelegate class]);
}
return UIApplicationMain(argc, argv, nil, appDelegateClassName);

```

