# xcassets - Value

**Template**: SharedContent SceneKit Game.xctemplate
**Field Path**: `Definitions.Assets.xcassets`

## Value

```
{
    AssetGeneration =     (
                {
            Name = AppIcon;
            Platforms =             {
                iOS = "___VARIABLE_iOSPlatform___";
                macOS = "___VARIABLE_OSXPlatform___";
            };
            Type = appicon;
        },
                {
            Name = "tvOS App Icon & Top Shelf Image";
            Platforms =             {
                tvOS = "___VARIABLE_tvOSPlatform___";
            };
            Type = tvappicon;
        }
    );
    Path = "Assets.xcassets";
    SortOrder = 100;
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```
