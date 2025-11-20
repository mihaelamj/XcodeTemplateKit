# Components - Value

**Template**: Safari Extension App.xctemplate
**Field Path**: `Components`

## Value

```
(
        {
        Identifier = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared";
        Name = "Shared (App)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.safariExtension.shared";
        Name = "Shared (Extension)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS";
        Name = "iOS (App)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.macOS";
        Name = "macOS (App)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.safariExtension.iOS";
        Name = "iOS (Extension)";
        ProductBuildPhaseInjections =         (
                        {
                TargetIdentifier = "com.apple.dt.iosApplicationTarget";
            }
        );
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.safariExtension.macOS";
        Name = "macOS (Extension)";
        ProductBuildPhaseInjections =         (
                        {
                TargetIdentifier = "com.apple.dt.osxApplicationTarget";
            }
        );
    }
)
```
