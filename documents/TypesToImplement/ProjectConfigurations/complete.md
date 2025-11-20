# ProjectConfigurations - Complete Type Specification

## Type Name
`ProjectConfigurations`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct ProjectConfigurations: Codable, Hashable, Sendable {
            public let debug: ProjectConfigurationsDebug?
            public let release: ProjectConfigurationsRelease?
    }
}
```

## Example Values
From template: **Empty.xctemplate**

### Debug
```
{
}
```

### Release
```
{
}
```

