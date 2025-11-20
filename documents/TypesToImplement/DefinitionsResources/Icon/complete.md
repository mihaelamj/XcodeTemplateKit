# DefinitionsResources/Icon - Complete Type Specification

## Type Name
`DefinitionsResources/Icon`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsResources/Icon: Codable, Hashable, Sendable {
            public let png: DefinitionsResources/Iconpng?
    }
}
```

## Example Values
From template: **SharedContent Safari Extension App.xctemplate**

### png
```
{
    Group = Resources;
    Path = "Icon.png";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

