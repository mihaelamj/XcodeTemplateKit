# DefinitionsAssets - Complete Type Specification

## Type Name
`DefinitionsAssets`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsAssets: Codable, Hashable, Sendable {
            public let xcassets: DefinitionsAssetsxcassets?
    }
}
```

## Example Values
From template: **Widget Extension.xctemplate**

### xcassets
```
{
    AssetGeneration =     (
                {
            Name = AppIcon;
            Platforms =             {
                iOS = true;
                macOS = true;
            };
            Type = appicon;
        }
    );
    Path = "Assets.xcassets";
    SortOrder = 100;
}
```

