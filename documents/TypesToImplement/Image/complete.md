# Image - Complete Type Specification

## Type Name
`Image`

## Field Count
5 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Image: Codable, Hashable, Sendable {
            public let bundleIdentifier: String
            public let bundleImageName: String
            public let fileTypeIcon: String
            public let systemSymbolName: String
            public let image: Image?
    }
}
```

## Example Values
From template: **Configuration Settings File.xctemplate**

### Image
```
{
    FileTypeIcon = xcconfig;
}
```

### BundleIdentifier
```
com.apple.dt.IDEKit
```

### BundleImageName
```
unittest
```

### FileTypeIcon
```
xcconfig
```

### SystemSymbolName
```
gearshape
```

