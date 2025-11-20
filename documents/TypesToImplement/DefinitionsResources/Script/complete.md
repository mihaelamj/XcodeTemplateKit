# DefinitionsResources/Script - Complete Type Specification

## Type Name
`DefinitionsResources/Script`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Script: Codable, Hashable, Sendable {
            public let js: DefinitionsResources/Scriptjs?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension App.xctemplate**

### js
```
{
    Group = Resources;
    Path = "Script.js";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

