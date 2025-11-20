# Units - Value

**Template**: macOS Metal Game.xctemplate
**Field Path**: `Options[].Units`

## Value

```
{
    "Objective-C" =     {
        Definitions =         {
            "AppDelegate.m:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body" = "return YES;";
            "GameViewController.h" =             {
                Path = "GameViewController.h";
            };
            "GameViewController.m" =             {
                Path = "GameViewController.m";
            };
        };
        Nodes =         (
            "AppDelegate.m:implementation:methods:applicationShouldTerminateAfterLastWindowClosed(- (BOOL\\)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *\\)sender)",
            "AppDelegate.m:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body",
            "GameViewController.h",
            "GameViewController.m"
        );
    };
    Swift =     {
        Definitions =         {
            "AppDelegate.swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body" = "return true";
            "GameViewController.swift" =             {
                Path = "GameViewController.swift";
            };
        };
        Nodes =         (
            "AppDelegate.swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed(func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication\\) -> Bool)",
            "AppDelegate.swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body",
            "GameViewController.swift"
        );
        Targets =         (
                        {
                SharedSettings =                 {
                    "SWIFT_OBJC_BRIDGING_HEADER" = "___PARENTPACKAGENAME___ Shared/ShaderTypes.h";
                };
            }
        );
    };
}
```
