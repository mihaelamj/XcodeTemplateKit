# Renderer - Value

**Template**: Compositor Services.xctemplate
**Field Path**: `Options[].Units.Renderer`

## Value

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
