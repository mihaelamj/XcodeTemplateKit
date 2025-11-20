# MainTemplateFile - Complete Type Specification

## Type Name
`MainTemplateFile`

## Field Count
1 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct MainTemplateFile: Codable, Hashable, Sendable {
            public let mainTemplateFile: String
    }
}
```

## Example Values
From template: **Package Swift File.xctemplate**

### MainTemplateFile
```
___FILEBASENAME___.swift
```

