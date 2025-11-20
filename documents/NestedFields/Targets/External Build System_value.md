# Targets - Value

**Template**: External Build System.xctemplate
**Field Path**: `Targets`

## Value

```
(
        {
        BuildToolArgsString = "$(ACTION)";
        BuildToolPath = "___VARIABLE_buildToolPath___";
        Configurations =         {
            Debug =             {
                "DEBUGGING_SYMBOLS" = YES;
                "DEBUG_INFORMATION_FORMAT" = dwarf;
                "GCC_GENERATE_DEBUGGING_SYMBOLS" = YES;
                "GCC_OPTIMIZATION_LEVEL" = 0;
            };
            Release =             {
                "DEBUG_INFORMATION_FORMAT" = "dwarf-with-dsym";
            };
        };
        SharedSettings =         {
            "OTHER_CFLAGS" = "";
            "OTHER_LDFLAGS" = "";
        };
        TargetIdentifier = "com.apple.dt.cocoaLegacyTarget";
        TargetType = Legacy;
    }
)
```
