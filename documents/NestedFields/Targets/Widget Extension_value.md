# Targets - Value

**Template**: Widget Extension.xctemplate
**Field Path**: `Targets`

## Value

```
(
        {
        Frameworks =         (
            WidgetKit,
            SwiftUI
        );
        Name = "___PACKAGENAME___Extension";
        SharedSettings =         {
            "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME" = AccentColor;
            "ASSETCATALOG_COMPILER_WIDGET_BACKGROUND_COLOR_NAME" = WidgetBackground;
            "ENABLE_APP_SANDBOX" = YES;
        };
        TargetIdentifier = "com.apple.dt.widgetExtension.multiplatform";
    }
)
```
