# Components - Complete Type Specification

## Type Name
`Components`

## Field Count
4 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Components: Codable, Hashable, Sendable {
            public let identifier: String?
            public let name: String?
            public let components: [Components]?
            public let productBuildPhaseInjections: [ComponentsProductBuildPhaseInjections]?
    }
}
```

## Example Values
From template: **Safari Extension App.xctemplate**

### Components
```
(
        {
        Identifier = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared";
        Name = "Shared (App)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.safariExtension.shared";
        Name = "Shared (Extension)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS";
        Name = "iOS (App)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.macOS";
        Name = "macOS (App)";
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.safariExtension.iOS";
        Name = "iOS (Extension)";
        ProductBuildPhaseInjections =         (
                        {
                TargetIdentifier = "com.apple.dt.iosApplicationTarget";
            }
        );
    },
        {
        Identifier = "com.apple.dt.unit.multiPlatform.safariExtension.macOS";
        Name = "macOS (Extension)";
        ProductBuildPhaseInjections =         (
                        {
                TargetIdentifier = "com.apple.dt.osxApplicationTarget";
            }
        );
    }
)
```

### Identifier
```
com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared
```

### Name
```
Shared (App)
```

### ProductBuildPhaseInjections
```
(
        {
        TargetIdentifier = "com.apple.dt.applicationTarget";
    }
)
```

