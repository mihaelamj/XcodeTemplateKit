# DefinitionsResources/Baselproj/Main - Complete Type Specification

## Type Name
`DefinitionsResources/Baselproj/Main`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Baselproj/Main: Codable, Hashable, Sendable {
            public let html: DefinitionsResources/Baselproj/Mainhtml?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension App.xctemplate**

### html
```
{
    Group = Resources;
    Path = "Main.html";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

