# Definitions - Value

**Template**: tvOS App Base.xctemplate
**Field Path**: `Options[].Units.Objective-C.Definitions`

## Value

```
{
    "*:implementation:methods:awakeFromNib:super" = "[super awakeFromNib];";
    "*:implementation:methods:viewDidLoad:super" = "[super viewDidLoad];\n// Do any additional setup after loading the view.";
    "AppDelegate.h:interface:window" = "@property (strong, nonatomic) UIWindow *window;\n";
    "AppDelegate.m:implementation:methods:applicationdidFinishLaunchingWithOptions:body" = "// Override point for customization after application launch.";
    "AppDelegate.m:implementation:methods:applicationdidFinishLaunchingWithOptions:return" = "return YES;";
    "main.m:main" =     {
        Beginning = "int main(int argc, char * argv[]) {";
        End = "}";
        Indent = 1;
    };
    "main.m:main:UIApplicationMain" = "NSString * appDelegateClassName;\n@autoreleasepool {\n    // Setup code that might create autoreleased objects goes here.\n    appDelegateClassName = NSStringFromClass([AppDelegate class]);\n}\nreturn UIApplicationMain(argc, argv, nil, appDelegateClassName);\n";
}
```
