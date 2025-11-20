# Swift - Value

**Template**: tvOS App Base.xctemplate
**Field Path**: `Options[].Units.Swift`

## Value

```
{
    Definitions =     {
        "*:implementation:methods:awakeFromNib:super" = "super.awakeFromNib()";
        "*:implementation:methods:viewDidLoad:super" = "super.viewDidLoad()\n// Do any additional setup after loading the view.";
        "AppDelegate.swift:UIApplicationMain" = "@main";
        "AppDelegate.swift:implementation:methods:applicationdidFinishLaunchingWithOptions:body" = "// Override point for customization after application launch.";
        "AppDelegate.swift:implementation:methods:applicationdidFinishLaunchingWithOptions:return" = "return true";
        "AppDelegate.swift:implementation:properties:window" = "var window: UIWindow?";
    };
    Nodes =     (
        "AppDelegate.swift:comments",
        "AppDelegate.swift:imports:importCocoa",
        "AppDelegate.swift:UIApplicationMain",
        "AppDelegate.swift:implementation(AppDelegate: UIResponder, UIApplicationDelegate)",
        "AppDelegate.swift:implementation:properties:window",
        "AppDelegate.swift:implementation:methods:applicationdidFinishLaunchingWithOptions(func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?\\) -> Bool)",
        "AppDelegate.swift:implementation:methods:applicationdidFinishLaunchingWithOptions:body",
        "AppDelegate.swift:implementation:methods:applicationdidFinishLaunchingWithOptions:return",
        "AppDelegate.swift:implementation:methods:applicationWillResignActive(func applicationWillResignActive(_ application: UIApplication\\))",
        "AppDelegate.swift:implementation:methods:applicationWillResignActive:comments",
        "AppDelegate.swift:implementation:methods:applicationDidEnterBackground(func applicationDidEnterBackground(_ application: UIApplication\\))",
        "AppDelegate.swift:implementation:methods:applicationDidEnterBackground:comments",
        "AppDelegate.swift:implementation:methods:applicationWillEnterForeground(func applicationWillEnterForeground(_ application: UIApplication\\))",
        "AppDelegate.swift:implementation:methods:applicationWillEnterForeground:comments",
        "AppDelegate.swift:implementation:methods:applicationDidBecomeActive(func applicationDidBecomeActive(_ application: UIApplication\\))",
        "AppDelegate.swift:implementation:methods:applicationDidBecomeActive:comments",
        "AppDelegate.swift:implementation:methods:applicationWillTerminate(func applicationWillTerminate(_ application: UIApplication\\))",
        "AppDelegate.swift:implementation:methods:applicationWillTerminate:comments"
    );
}
```
