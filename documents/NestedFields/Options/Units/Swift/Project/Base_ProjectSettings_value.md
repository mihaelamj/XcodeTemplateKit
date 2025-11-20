# Project - Value

**Template**: Base_ProjectSettings.xctemplate
**Field Path**: `Options[].Units.Swift.Project`

## Value

```
{
    Configurations =     {
        Debug =         {
            "SWIFT_ACTIVE_COMPILATION_CONDITIONS" = "DEBUG $(inherited)";
            "SWIFT_OPTIMIZATION_LEVEL" = "-Onone";
        };
        Release =         {
            "SWIFT_COMPILATION_MODE" = wholemodule;
        };
    };
}
```
