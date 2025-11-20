# DefinitionsArt - Complete Type Specification

## Type Name
`DefinitionsArt`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsArt: Codable, Hashable, Sendable {
            public let scnassets: DefinitionsArtscnassets?
    }
}
```

## Example Values
From template: **SharedContent SceneKit Game.xctemplate**

### scnassets
```
{
    Path = "Art.scnassets";
    SortOrder = 99;
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

