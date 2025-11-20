# AssociatedTargetSpecification - Value

**Template**: Framework.xctemplate
**Field Path**: `AssociatedTargetSpecification`

## Value

```
{
    AllowableProductTypes =     (
        "com.apple.product-type.application.on-demand-install-capable",
        "com.apple.product-type.application",
        "com.apple.product-type.app-extension.messages",
        "com.apple.product-type.watchkit2-extension"
    );
    AssociatedTargetIsDependent = 1;
    AssociatedTargetNeedsProductBuildPhaseInjection = 1;
    PopUpDescription = "The application target that will host this new framework. The application will be set up to link to and embed the new framework.";
    PopUpTitle = "Embed in Application:";
}
```
