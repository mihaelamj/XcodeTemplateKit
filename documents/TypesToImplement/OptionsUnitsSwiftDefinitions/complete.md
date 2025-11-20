# OptionsUnitsSwiftDefinitions - Complete Type Specification

## Type Name
`OptionsUnitsSwiftDefinitions`

## Field Count
7 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct OptionsUnitsSwiftDefinitions: Codable, Hashable, Sendable {
            public let *:class:*: String?
            public let *:implementation:methods:awakeFromNib:super: String?
            public let *:implementation:methods:viewDidLoad:super: String?
            public let *:imports:importFramework:*: String?
            public let *:imports:importHeader:*: String?
            public let *:implementation: OptionsUnitsSwiftDefinitions*:implementation?
            public let *:implementation:methods:init: OptionsUnitsSwiftDefinitions*:implementation:methods:init?
    }
}
```

## Example Values
From template: **Base_DefinitionsLanguage.xctemplate**

### *:class:*
```

```

### *:implementation
```
{
    Beginning = "class ___*___ {\n";
    End = "\n}\n";
    Indent = 1;
}
```

### *:implementation:methods:awakeFromNib:super
```
super.awakeFromNib()
```

### *:implementation:methods:init
```
{
    Beginning = "override init() {\n    super.init()\n";
    End = "}\n\n";
    Indent = 1;
}
```

### *:implementation:methods:viewDidLoad:super
```
super.viewDidLoad()
// Do any additional setup after loading the view.
```

### *:imports:importFramework:*
```
import ___*___
```

### *:imports:importHeader:*
```

```

