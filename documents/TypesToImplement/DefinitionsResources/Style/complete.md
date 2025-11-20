# DefinitionsResources/Style - Complete Type Specification

## Type Name
`DefinitionsResources/Style`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Style: Codable, Hashable, Sendable {
            public let css: DefinitionsResources/Stylecss?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension App.xctemplate**

### css
```
{
    Group = Resources;
    Path = "Style.css";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

