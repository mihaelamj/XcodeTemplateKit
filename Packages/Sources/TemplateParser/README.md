# TemplateParser

Swift package for parsing and processing Xcode template files using [swift-parsing](https://github.com/pointfreeco/swift-parsing).

## Overview

This package provides a robust, type-safe parser for Xcode template variable substitution. It handles all the complex variable patterns used in Xcode templates including simple variables, transformations, macros, options, and UUID generation.

## Features

- ✅ **Simple Variables**: `___FILEBASENAME___`, `___FILENAME___`, etc.
- ✅ **Transformations**: `:identifier`, `:RFC1034Identifier`, `:bundleIdentifier`, `:c99extidentifier`
- ✅ **Macros**: `___FILEHEADER___`, `___COPYRIGHT___`
- ✅ **Options**: `___VARIABLE_productName:transform___`
- ✅ **UUID Generation**: `___UUID:key___`
- ✅ **Type-Safe**: Using swift-parsing for compile-time guarantees
- ✅ **Zero-Copy**: Efficient parsing with `Substring`

## Architecture

```
TemplateParser/
├── Models/
│   ├── TemplateToken.swift         # Text or variable token
│   ├── VariableToken.swift         # Different variable types
│   └── Transformation.swift        # Variable transformations
├── Parsers/
│   ├── VariableParser.swift        # Parse variable tokens
│   ├── TransformationParser.swift  # Parse transformation suffixes
│   └── TemplateContentParser.swift # Parse entire template
├── Resolution/
│   └── VariableContext.swift       # Resolve variables to values
└── TemplateProcessor.swift         # Main processing API
```

## Usage

### Basic Example

```swift
import TemplateParser

// 1. Create a variable context
let context = VariableContext(
    fileName: "ContentView.swift",
    fileBaseName: "ContentView",
    projectName: "MyApp",
    packageName: "MyApp",
    userName: "mm",
    fullUserName: "Mihaela Mihaljevic",
    date: "16.11.2025",
    year: "2025",
    options: [:]
)

// 2. Create processor
let processor = TemplateProcessor()

// 3. Process template
let template = """
___FILEHEADER___
import Foundation
"""

let result = try processor.process(template: template, context: context)
```

### Output

```swift
//
//  ContentView.swift
//  MyApp
//
//  Created by Mihaela Mihaljevic on 16.11.2025.
//  Copyright © 2025 Mihaela Mihaljevic. All rights reserved.
//

import Foundation
```

### With Transformations

```swift
let template = "struct ___FILEBASENAME:identifier___"
let result = try processor.process(template: template, context: context)
// "struct ContentView"
```

### With Options

```swift
let context = VariableContext(
    // ... other parameters
    options: ["productName": "My Awesome App"]
)

let template = "Welcome to ___VARIABLE_productName___!"
let result = try processor.process(template: template, context: context)
// "Welcome to My Awesome App!"
```

## Variable Types

### Simple Variables
- `___FILEBASENAME___` → Base filename without extension
- `___FILENAME___` → Complete filename with extension
- `___PROJECTNAME___` → Project name
- `___PACKAGENAME___` → Package/module name
- `___USERNAME___` → Short username
- `___FULLUSERNAME___` → Full user name
- `___DATE___` → Current date
- `___YEAR___` → Current year

### Transformed Variables
Format: `___VARIABLE:transformation___`

**Transformations:**
- `:identifier` → Valid Swift/ObjC identifier (removes spaces, special chars)
- `:RFC1034Identifier` → RFC1034 compliant (lowercase, hyphens)
- `:bundleIdentifier` → Bundle ID format (com.example.app)
- `:c99extidentifier` → C99 extended identifier

Example:
```swift
"My App Name"
  → :identifier        → "MyAppName"
  → :RFC1034Identifier → "my-app-name"
  → :bundleIdentifier  → "my.app.name"
```

### Option Variables
Format: `___VARIABLE_optionName:transformation___`

References values from template options (e.g., user selections in Xcode's template wizard).

### Macros
Special variables that expand to multi-line content:

- `___FILEHEADER___` → Complete file header with copyright
- `___COPYRIGHT___` → Copyright notice only

### UUID Variables
Format: `___UUID:key___`

Generates a unique UUID and caches it per key (same key = same UUID within a context).

## Parser API

### VariableParser

Parses individual variable tokens:

```swift
let parser = VariableParser()
let token = try parser.parse("___FILEBASENAME:identifier___")
// VariableToken.transformed("FILEBASENAME", [.identifier])
```

### TemplateContentParser

Parses entire template into tokens:

```swift
let parser = TemplateContentParser()
let tokens = try parser.parse(template[...])
// [TemplateToken.text(...), TemplateToken.variable(...), ...]
```

### VariableContext

Resolves variable tokens to actual values:

```swift
var context = VariableContext(...)
let value = context.resolveVariable(.simple("FILEBASENAME"))
// "ContentView"
```

### TemplateProcessor

High-level API combining parsing and resolution:

```swift
let processor = TemplateProcessor()
let output = try processor.process(template: template, context: context)
```

## Testing

```swift
import XCTest
@testable import TemplateParser

class MyTests: XCTestCase {
    func testVariableParsing() throws {
        let parser = VariableParser()
        let result = try parser.parse("___FILEBASENAME___")
        XCTAssertEqual(result, .simple("FILEBASENAME"))
    }
}
```

## Dependencies

- [swift-parsing](https://github.com/pointfreeco/swift-parsing) >= 0.13.0

## Thread Safety

- `TemplateToken`, `VariableToken`, `Transformation` are all `Sendable`
- `VariableContext` is `Sendable` but uses mutable UUID cache
- `TemplateProcessor` is `Sendable`

For concurrent use, create separate `VariableContext` instances per thread.

## Error Handling

Parsing errors are thrown as standard Swift errors with location information:

```swift
do {
    let result = try processor.process(template: malformed, context: context)
} catch {
    print("Parse error: \(error)")
}
```

## Future Enhancements

- [ ] Multi-pass variable resolution (variables that reference other variables)
- [ ] Conditional file inclusion based on options
- [ ] Project template support (Ancestors, Definitions, Nodes)
- [ ] Option validation (RequiredOptionsForValues)
- [ ] Custom macro expansion hooks

## Related Documentation

- [TEMPLATE_PARSING_STRATEGY.md](../../../TEMPLATE_PARSING_STRATEGY.md) - Comprehensive parsing strategy
- [TEMPLATE_ANALYSIS.md](../../../TEMPLATE_ANALYSIS.md) - Template structure analysis

## License

Same as Templatomat project.
