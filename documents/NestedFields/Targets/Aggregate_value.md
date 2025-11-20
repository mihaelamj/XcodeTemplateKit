# Targets - Value

**Template**: Aggregate.xctemplate
**Field Path**: `Targets`

## Value

```
(
        {
        Name = "___PACKAGENAME___";
        SharedSettings =         {
            "PRODUCT_NAME" = "$(TARGET_NAME)";
        };
        TargetIdentifier = "com.apple.dt.aggregateTarget";
        TargetType = Aggregate;
    }
)
```
