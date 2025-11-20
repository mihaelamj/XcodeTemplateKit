# Definitionsmain - Complete Type Specification

## Type Name
`Definitionsmain`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct Definitionsmain: Codable, Hashable, Sendable {
            public let m:main:NSApplicationMain: String?
            public let m: Definitionsmainm?
            public let m:main: Definitionsmainm:main?
    }
}
```

## Example Values
From template: **macOS App Base.xctemplate**

### m
```
{
    SortOrder = 999;
}
```

### m:main
```
{
    Beginning = "int main(int argc, const char * argv[]) {";
    End = "}";
    Indent = 1;
}
```

### m:main:NSApplicationMain
```
@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
}
return NSApplicationMain(argc, argv);
```

