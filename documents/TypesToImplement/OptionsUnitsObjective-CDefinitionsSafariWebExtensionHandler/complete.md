# OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandler - Complete Type Specification

## Type Name
`OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandler`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandler: Codable, Hashable, Sendable {
            public let h: OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandlerh?
            public let m: OptionsUnitsObjective-CDefinitionsSafariWebExtensionHandlerm?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension.xctemplate**

### h
```
{
    Path = "SafariWebExtensionHandler.h";
}
```

### m
```
{
    Path = "SafariWebExtensionHandler.m";
    TargetIdentifiers =     (
        "com.apple.dt.safariExtension.iOS",
        "com.apple.dt.safariExtension.macOS"
    );
}
```

