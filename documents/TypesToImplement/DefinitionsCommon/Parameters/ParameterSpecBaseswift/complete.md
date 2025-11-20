# DefinitionsCommon/Parameters/ParameterSpecBaseswift - Complete Type Specification

## Type Name
`DefinitionsCommon/Parameters/ParameterSpecBaseswift`

## Field Count
2 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsCommon/Parameters/ParameterSpecBaseswift: Codable, Hashable, Sendable {
            public let path: String?
            public let group: [DefinitionsCommon/Parameters/ParameterSpecBaseswiftGroup]?
    }
}
```

## Example Values
From template: **Audio Unit Extension.xctemplate**

### Group
```
(
    Common,
    Parameters
)
```

### Path
```
_Shared/Common/Parameters/ParameterSpecBase.swift
```

