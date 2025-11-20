# OptionsUnitsSwiftTargetsSharedSettings - Complete Type Specification

## Type Name
`OptionsUnitsSwiftTargetsSharedSettings`

## Field Count
9 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftTargetsSharedSettings: Codable, Hashable, Sendable {
            public let iNFOPLIST_KEY_NSMainStoryboardFile: String?
            public let iNFOPLIST_KEY_NSPrincipalClass: String?
            public let iNFOPLIST_KEY_UILaunchStoryboardName: String?
            public let iNFOPLIST_KEY_UIMainStoryboardFile: String?
            public let sWIFT_APPROACHABLE_CONCURRENCY: String?
            public let sWIFT_DEFAULT_ACTOR_ISOLATION: String?
            public let sWIFT_OBJC_BRIDGING_HEADER: String
            public let sWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY: String?
            public let sWIFT_VERSION: String?
    }
}
```

## Example Values
From template: **macOS Metal Game.xctemplate**

### INFOPLIST_KEY_NSMainStoryboardFile
```
Main
```

### INFOPLIST_KEY_NSPrincipalClass
```
NSApplication
```

### INFOPLIST_KEY_UILaunchStoryboardName
```
LaunchScreen
```

### INFOPLIST_KEY_UIMainStoryboardFile
```
Main
```

### SWIFT_APPROACHABLE_CONCURRENCY
```
YES
```

### SWIFT_DEFAULT_ACTOR_ISOLATION
```
MainActor
```

### SWIFT_OBJC_BRIDGING_HEADER
```
___PARENTPACKAGENAME___ Shared/ShaderTypes.h
```

### SWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY
```
YES
```

### SWIFT_VERSION
```
5.0
```

