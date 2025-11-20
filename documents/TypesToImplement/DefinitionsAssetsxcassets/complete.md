# DefinitionsAssetsxcassets - Complete Type Specification

## Type Name
`DefinitionsAssetsxcassets`

## Field Count
5 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsAssetsxcassets: Codable, Hashable, Sendable {
            public let omitFromProjectStructure: Int?
            public let path: String
            public let sortOrder: Int
            public let assetGeneration: [DefinitionsAssetsxcassetsAssetGeneration]?
            public let targetIdentifiers: [DefinitionsAssetsxcassetsTargetIdentifiers]?
    }
}
```

## Example Values
From template: **Widget Extension.xctemplate**

### AssetGeneration
```
(
        {
        Name = AppIcon;
        Platforms =         {
            iOS = true;
            macOS = true;
        };
        Type = appicon;
    }
)
```

### OmitFromProjectStructure
```
1
```

### Path
```
Assets.xcassets
```

### SortOrder
```
100
```

### TargetIdentifiers
```
(
    "com.apple.dt.iosApplicationTarget",
    "com.apple.dt.tvosApplicationTarget",
    "com.apple.dt.osxApplicationTarget"
)
```

