# DefinitionsAssetsxcassetsAssetGeneration - Complete Type Specification

## Type Name
`DefinitionsAssetsxcassetsAssetGeneration`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsAssetsxcassetsAssetGeneration: Codable, Hashable, Sendable {
            public let name: String
            public let type: String
            public let platforms: DefinitionsAssetsxcassetsAssetGenerationPlatforms?
    }
}
```

## Example Values
From template: **Widget Extension.xctemplate**

### Name
```
AppIcon
```

### Platforms
```
{
    iOS = true;
    macOS = true;
}
```

### Type
```
appicon
```

