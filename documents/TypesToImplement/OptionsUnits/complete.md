# OptionsUnits - Complete Type Specification

## Type Name
`OptionsUnits`

## Field Count
13 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnits: Codable, Hashable, Sendable {
            public let forAppTemplate: OptionsUnitsForAppTemplate?
            public let metal: OptionsUnitsMetal?
            public let metal 4: OptionsUnitsMetal 4?
            public let objective-C: OptionsUnitsObjective-C?
            public let realityKit: OptionsUnitsRealityKit?
            public let renderer: [OptionsUnitsRenderer]?
            public let sceneKit: OptionsUnitsSceneKit?
            public let spriteKit: OptionsUnitsSpriteKit?
            public let swift: OptionsUnitsSwift?
            public let swift Testing: OptionsUnitsSwift Testing?
            public let swiftData: [OptionsUnitsSwiftData]?
            public let xCTest: OptionsUnitsXCTest?
            public let true: OptionsUnitstrue?
    }
}
```

## Example Values
From template: **SharedContent SceneKit Game.xctemplate**

### ForAppTemplate
```
{
    Targets =     (
                {
            SharedSettings =             {
                "PRODUCT_BUNDLE_IDENTIFIER" = "___VARIABLE_bundleIdentifier:bundleIdentifier___.Extension";
            };
        }
    );
}
```

### Metal
```
{
    Components =     (
                {
            Identifier = "com.apple.dt.unit.crossPlatformMetalGame_sharedComponent";
            Name = "___PACKAGENAME___ Shared";
        }
    );
}
```

### Metal 4
```
{
    Components =     (
                {
            Identifier = "com.apple.dt.unit.crossPlatformMetal4Game_sharedComponent";
            Name = "___PACKAGENAME___ Shared";
        }
    );
}
```

### Objective-C
```
{
    Definitions =     {
        "GameController.h" =         {
            Path = "GameController.h";
            TargetIdentifiers =             (
            );
        };
        "GameController.m" =         {
            Path = "GameController.m";
            TargetIdentifiers =             (
                "com.apple.dt.iosApplicationTarget",
                "com.apple.dt.tvosApplicationTarget",
                "com.apple.dt.osxApplicationTarget"
            );
        };
    };
    Nodes =     (
        "GameController.h",
        "GameController.m"
    );
}
```

### RealityKit
```
{
    Components =     (
                {
            Identifier = "com.apple.dt.unit.crossPlatformRealityKitGame";
            Name = "___PACKAGENAME___";
        }
    );
}
```

### Renderer
```
(
        {
        Definitions =         {
            "Renderer.swift" =             {
                OmitFromProjectStructure = 1;
                Path = "Metal/Mixed-Full/Renderer.swift";
            };
        };
        Nodes =         (
            "Renderer.swift"
        );
        RequiredOptions =         {
            immersiveSpaceStyle = Full;
            secondarySceneType = Metal;
        };
    },
        {
        Definitions =         {
            "Renderer.swift" =             {
                OmitFromProjectStructure = 1;
                Path = "Metal/Mixed-Full/Renderer.swift";
            };
        };
        Nodes =         (
            "Renderer.swift"
        );
        RequiredOptions =         {
            immersiveSpaceStyle = Mixed;
            secondarySceneType = Metal;
        };
    },
        {
        Definitions =         {
            "Renderer.swift" =             {
                OmitFromProjectStructure = 1;
                Path = "Metal/Progressive/Renderer.swift";
            };
        };
        Nodes =         (
            "Renderer.swift"
        );
        RequiredOptions =         {
            immersiveSpaceStyle = Progressive;
            secondarySceneType = Metal;
        };
    },
        {
        Definitions =         {
            "Renderer.swift" =             {
                OmitFromProjectStructure = 1;
                Path = "Metal 4/Mixed-Full/Renderer.swift";
            };
        };
        Nodes =         (
            "Renderer.swift"
        );
        RequiredOptions =         {
            immersiveSpaceStyle = Full;
            secondarySceneType = "Metal 4";
        };
    },
        {
        Definitions =         {
            "Renderer.swift" =             {
                OmitFromProjectStructure = 1;
                Path = "Metal 4/Mixed-Full/Renderer.swift";
            };
        };
        Nodes =         (
            "Renderer.swift"
        );
        RequiredOptions =         {
            immersiveSpaceStyle = Mixed;
            secondarySceneType = "Metal 4";
        };
    },
        {
        Definitions =         {
            "Renderer.swift" =             {
                OmitFromProjectStructure = 1;
                Path = "Metal 4/Progressive/Renderer.swift";
            };
        };
        Nodes =         (
            "Renderer.swift"
        );
        RequiredOptions =         {
            immersiveSpaceStyle = Progressive;
            secondarySceneType = "Metal 4";
        };
    }
)
```

### SceneKit
```
{
    Components =     (
                {
            Identifier = "com.apple.dt.unit.crossPlatformSceneKitGame_sharedComponent";
            Name = "___PACKAGENAME___ Shared";
        }
    );
}
```

### SpriteKit
```
{
    Components =     (
                {
            Identifier = "com.apple.dt.unit.crossPlatformSpriteKitGame_sharedComponent";
            Name = "___PACKAGENAME___ Shared";
        }
    );
}
```

### Swift
```
{
    Definitions =     {
        "GameController.swift" =         {
            Path = "GameController.swift";
            TargetIdentifiers =             (
                "com.apple.dt.iosApplicationTarget",
                "com.apple.dt.tvosApplicationTarget",
                "com.apple.dt.osxApplicationTarget"
            );
        };
    };
    Nodes =     (
        "GameController.swift"
    );
}
```

### Swift Testing
```
{
    Definitions =     {
        "___PACKAGENAMEASIDENTIFIER___.swift" =         {
            Path = "UnitTest-SwiftTesting.swift";
        };
    };
    Nodes =     (
        "___PACKAGENAMEASIDENTIFIER___.swift"
    );
}
```

### SwiftData
```
(
        {
        Targets =         (
                        {
                SharedSettings =                 {
                };
                TargetIdentifier = "com.apple.dt.applicationTarget";
            }
        );
    }
)
```

### XCTest
```
{
    Definitions =     {
        "___PACKAGENAMEASIDENTIFIER___.swift" =         {
            Path = "UnitTest-XCTest.swift";
        };
    };
    Nodes =     (
        "___PACKAGENAMEASIDENTIFIER___.swift"
    );
    RequiredOptions =     {
        languageChoice = Swift;
    };
}
```

### true
```
{
    Definitions =     {
        "___PACKAGENAMEASIDENTIFIER___.docc" =         {
            Path = "___PACKAGENAMEASIDENTIFIER___.docc";
            SortOrder = 99;
        };
    };
    Nodes =     (
        "___PACKAGENAMEASIDENTIFIER___.docc"
    );
}
```

