# Swift - Value

**Template**: macOS Metal Game.xctemplate
**Field Path**: `Options[].Units.Swift`

## Value

```
{
    Definitions =     {
        "AppDelegate.swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body" = "return true";
        "GameViewController.swift" =         {
            Path = "GameViewController.swift";
        };
    };
    Nodes =     (
        "AppDelegate.swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed(func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication\\) -> Bool)",
        "AppDelegate.swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body",
        "GameViewController.swift"
    );
    Targets =     (
                {
            SharedSettings =             {
                "SWIFT_OBJC_BRIDGING_HEADER" = "___PARENTPACKAGENAME___ Shared/ShaderTypes.h";
            };
        }
    );
}
```
