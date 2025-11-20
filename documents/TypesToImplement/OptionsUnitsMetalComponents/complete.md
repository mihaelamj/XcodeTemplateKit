# OptionsUnitsMetalComponents - Complete Type Specification

## Type Name
`OptionsUnitsMetalComponents`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsMetalComponents: Codable, Hashable, Sendable {
            public let identifier: String?
            public let name: String?
    }
}
```

## Example Values
From template: **Game.xctemplate**

### Identifier
```
com.apple.dt.unit.crossPlatformMetalGame_sharedComponent
```

### Name
```
___PACKAGENAME___ Shared
```

