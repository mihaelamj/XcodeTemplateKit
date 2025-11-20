# Objective-C - Value

**Template**: tvOS App Base.xctemplate
**Field Path**: `Options[].Units.Objective-C`

## Value

```
{
    Definitions =     {
        "*:implementation:methods:awakeFromNib:super" = "[super awakeFromNib];";
        "*:implementation:methods:viewDidLoad:super" = "[super viewDidLoad];\n// Do any additional setup after loading the view.";
        "AppDelegate.h:interface:window" = "@property (strong, nonatomic) UIWindow *window;\n";
        "AppDelegate.m:implementation:methods:applicationdidFinishLaunchingWithOptions:body" = "// Override point for customization after application launch.";
        "AppDelegate.m:implementation:methods:applicationdidFinishLaunchingWithOptions:return" = "return YES;";
        "main.m:main" =         {
            Beginning = "int main(int argc, char * argv[]) {";
            End = "}";
            Indent = 1;
        };
        "main.m:main:UIApplicationMain" = "NSString * appDelegateClassName;\n@autoreleasepool {\n    // Setup code that might create autoreleased objects goes here.\n    appDelegateClassName = NSStringFromClass([AppDelegate class]);\n}\nreturn UIApplicationMain(argc, argv, nil, appDelegateClassName);\n";
    };
    Nodes =     (
        "main.m:comments",
        "main.m:imports:importCocoa",
        "main.m:imports:importHeader:AppDelegate.h",
        "main.m:main:UIApplicationMain",
        "AppDelegate.h:comments",
        "AppDelegate.h:imports:importCocoa",
        "AppDelegate.h:interface(AppDelegate : UIResponder <UIApplicationDelegate>)",
        "AppDelegate.h:interface:window",
        "AppDelegate.m:comments",
        "AppDelegate.m:imports:importHeader:AppDelegate.h",
        "AppDelegate.m:extension",
        "AppDelegate.m:implementation:synthesize",
        "AppDelegate.m:implementation:methods:applicationdidFinishLaunchingWithOptions(- (BOOL\\)application:(UIApplication *\\)application didFinishLaunchingWithOptions:(NSDictionary *\\)launchOptions)",
        "AppDelegate.m:implementation:methods:applicationdidFinishLaunchingWithOptions:body",
        "AppDelegate.m:implementation:methods:applicationdidFinishLaunchingWithOptions:return",
        "AppDelegate.m:implementation:methods:applicationWillResignActive(- (void\\)applicationWillResignActive:(UIApplication *\\)application)",
        "AppDelegate.m:implementation:methods:applicationWillResignActive:comments",
        "AppDelegate.m:implementation:methods:applicationDidEnterBackground(- (void\\)applicationDidEnterBackground:(UIApplication *\\)application)",
        "AppDelegate.m:implementation:methods:applicationDidEnterBackground:comments",
        "AppDelegate.m:implementation:methods:applicationWillEnterForeground(- (void\\)applicationWillEnterForeground:(UIApplication *\\)application)",
        "AppDelegate.m:implementation:methods:applicationWillEnterForeground:comments",
        "AppDelegate.m:implementation:methods:applicationDidBecomeActive(- (void\\)applicationDidBecomeActive:(UIApplication *\\)application)",
        "AppDelegate.m:implementation:methods:applicationDidBecomeActive:comments",
        "AppDelegate.m:implementation:methods:applicationWillTerminate(- (void\\)applicationWillTerminate:(UIApplication *\\)application)",
        "AppDelegate.m:implementation:methods:applicationWillTerminate:comments"
    );
}
```
