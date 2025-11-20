# Definitionsmainm:main - Complete Type Specification

## Type Name
`Definitionsmainm:main`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitionsmainm:main: Codable, Hashable, Sendable {
            public let beginning: String?
            public let end: String?
            public let indent: Int?
    }
}
```

## Example Values
From template: **App Base.xctemplate**

### Beginning
```
int main(int argc, const char * argv[]) {
```

### End
```
}
```

### Indent
```
1
```

