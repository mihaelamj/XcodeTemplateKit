# OptionsUnitsSwiftDefinitionsShaderTypes - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitionsShaderTypes`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitionsShaderTypes: Codable, Hashable, Sendable {
            public let h: OptionsUnitsSwiftDefinitionsShaderTypesh?
    }
}
```

## Example Values
From template: **SharedContent Metal Game.xctemplate**

### h
```
{
    Path = "ShaderTypes.h";
    TargetIdentifiers =     (
        "com.apple.dt.iosApplicationTarget",
        "com.apple.dt.tvosApplicationTarget",
        "com.apple.dt.osxApplicationTarget"
    );
}
```

