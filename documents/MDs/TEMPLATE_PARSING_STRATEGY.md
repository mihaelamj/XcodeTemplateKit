# Xcode Template Parsing Strategy

## Analysis: Template → Generated Code Relationship

### Template Variable Patterns

Xcode templates use a multi-layered variable substitution system:

#### 1. Simple Variables
```
___FILEBASENAME___          → "File"
___FILENAME___              → "File.swift"
___FILEBASENAMEASIDENTIFIER___ → "File"
___PROJECTNAME___           → "MyProject"
___DATE___                  → "16.11.2025"
___YEAR___                  → "2025"
___USERNAME___              → "mm"
___FULLUSERNAME___          → "Mihaela Mihaljevic"
```

#### 2. Complex Macro Variables
```
___FILEHEADER___            → Expands to multi-line header:
                              //
                              //  File.swift
                              //  MyProject
                              //
                              //  Created by Mihaela Mihaljevic on 16.11.2025.
                              //  Copyright © 2025 Mihaela Mihaljevic. All rights reserved.
                              //
```

#### 3. Option-Referenced Variables
```
___VARIABLE_optionName___                    → References option value
___VARIABLE_productName:identifier___        → Option value + transformation
___VARIABLE_bundleId:bundleIdentifier___     → Multiple transformations
```

#### 4. UUID Generation
```
___UUID:exampleServiceID___  → "A1B2C3D4-E5F6-7890-ABCD-EF1234567890"
```

#### 5. Transformation Suffixes
```
:identifier              → sanitize for Swift/ObjC identifier
:RFC1034Identifier      → domain name compliant
:bundleIdentifier       → reverse domain notation
:c99extidentifier       → C99 identifier
```

### Parsing Challenges

1. **Non-linear structure** - Variables can be nested, transformed, and context-dependent
2. **Multi-pass processing** - Some variables reference others
3. **Conditional expansion** - Based on template options
4. **Context sensitivity** - File vs project templates behave differently
5. **Macro expansion** - `___FILEHEADER___` generates multiple lines

---

## Parsing Strategy Using swift-parsing

### Architecture Overview

```
┌────────────────────────────────────────────────────────┐
│                   Template Parser                      │
│                                                        │
│  ┌─────────────────────────────────────────────────┐   │
│  │ 1. Variable Token Parser                        │   │
│  │    - Simple: ___NAME___                         │   │
│  │    - Transform: ___NAME:transform___            │   │
│  │    - Option: ___VARIABLE_name:transform___      │   │
│  │    - UUID: ___UUID:key___                       │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↓                              │
│  ┌─────────────────────────────────────────────────┐   │
│  │ 2. Template Content Parser                      │   │
│  │    - Text chunks                                │   │
│  │    - Variable tokens                            │   │
│  │    - Mixed content                              │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↓                              │
│  ┌─────────────────────────────────────────────────┐   │
│  │ 3. Variable Resolver                            │   │
│  │    - Lookup values                              │   │
│  │    - Apply transformations                      │   │
│  │    - Expand macros                              │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↓                              │
│  ┌─────────────────────────────────────────────────┐   │
│  │ 4. Code Generator                               │   │
│  │    - Substitute variables                       │   │
│  │    - Generate output                            │   │
│  └─────────────────────────────────────────────────┘   │
└────────────────────────────────────────────────────────┘
```

### Implementation Plan

## Phase 1: Core Parser Types

### 1.1 Variable Token Model

```swift
import Parsing

// Token types
enum TemplateToken: Equatable {
    case text(String)
    case variable(VariableToken)
}

enum VariableToken: Equatable {
    case simple(String)                          // ___FILEBASENAME___
    case transformed(String, [Transformation])    // ___NAME:identifier___
    case option(String, [Transformation])         // ___VARIABLE_name:transform___
    case uuid(String)                            // ___UUID:key___
    case macro(String)                           // ___FILEHEADER___
}

enum Transformation: String, Equatable {
    case identifier
    case rfc1034Identifier = "RFC1034Identifier"
    case bundleIdentifier
    case c99extidentifier
}
```

### 1.2 Variable Parser

```swift
import Parsing

// Parse variable name with transformations
struct VariableParser: Parser {
    var body: some Parser<Substring, VariableToken> {
        Parse {
            "___"

            OneOf {
                // UUID: ___UUID:key___
                Parse(VariableToken.uuid) {
                    "UUID:"
                    Prefix { $0 != "_" }.map(String.init)
                }

                // Option variable: ___VARIABLE_name:transform___
                Parse {
                    "VARIABLE_"
                    Prefix { $0 != ":" && $0 != "_" }.map(String.init)
                    Optionally {
                        ":"
                        transformationParser
                    }
                }
                .map { name, transforms in
                    VariableToken.option(name, transforms ?? [])
                }

                // Simple or transformed: ___NAME:transform___
                Parse {
                    Prefix { $0 != ":" && $0 != "_" }.map(String.init)
                    Optionally {
                        ":"
                        transformationParser
                    }
                }
                .map { name, transforms in
                    if let transforms = transforms, !transforms.isEmpty {
                        return VariableToken.transformed(name, transforms)
                    } else {
                        // Check if it's a known macro
                        if ["FILEHEADER", "COPYRIGHT"].contains(name) {
                            return VariableToken.macro(name)
                        }
                        return VariableToken.simple(name)
                    }
                }
            }

            "___"
        }
    }

    // Parse transformation suffixes
    var transformationParser: some Parser<Substring, [Transformation]> {
        Many(1...) {
            OneOf {
                "identifier".map { Transformation.identifier }
                "RFC1034Identifier".map { Transformation.rfc1034Identifier }
                "bundleIdentifier".map { Transformation.bundleIdentifier }
                "c99extidentifier".map { Transformation.c99extidentifier }
            }
        } separator: {
            ":"
        }
    }
}
```

### 1.3 Template Content Parser

```swift
struct TemplateContentParser: Parser {
    var body: some Parser<Substring, [TemplateToken]> {
        Many {
            OneOf {
                // Parse variables
                VariableParser().map(TemplateToken.variable)

                // Parse text between variables
                Prefix(while: { !$0.starts(with: "___") })
                    .filter { !$0.isEmpty }
                    .map { String($0) }
                    .map(TemplateToken.text)
            }
        }
    }
}

// Extension to help with prefix checking
extension Substring {
    func starts(with string: String) -> Bool {
        self.starts(with: string[...])
    }
}
```

## Phase 2: Variable Resolution

### 2.1 Variable Context

```swift
struct VariableContext {
    // Simple variables
    let fileName: String
    let fileBaseName: String
    let projectName: String
    let packageName: String

    // User info
    let userName: String
    let fullUserName: String

    // Date/time
    let date: String
    let year: String

    // Template options
    let options: [String: String]

    // UUID cache
    private var uuidCache: [String: String] = [:]

    mutating func resolveVariable(_ token: VariableToken) -> String {
        switch token {
        case .simple(let name):
            return resolveSimple(name)

        case .transformed(let name, let transforms):
            let value = resolveSimple(name)
            return apply(transforms, to: value)

        case .option(let name, let transforms):
            let value = options[name] ?? ""
            return apply(transforms, to: value)

        case .uuid(let key):
            if let cached = uuidCache[key] {
                return cached
            }
            let uuid = UUID().uuidString
            uuidCache[key] = uuid
            return uuid

        case .macro(let name):
            return resolveMacro(name)
        }
    }

    private func resolveSimple(_ name: String) -> String {
        switch name {
        case "FILEBASENAME": return fileBaseName
        case "FILENAME": return fileName
        case "FILEBASENAMEASIDENTIFIER": return apply([.identifier], to: fileBaseName)
        case "PROJECTNAME": return projectName
        case "PACKAGENAME": return packageName
        case "USERNAME": return userName
        case "FULLUSERNAME": return fullUserName
        case "DATE": return date
        case "YEAR": return year
        default: return ""
        }
    }

    private func resolveMacro(_ name: String) -> String {
        switch name {
        case "FILEHEADER":
            return """
            //
            //  \(fileName)
            //  \(projectName)
            //
            //  Created by \(fullUserName) on \(date).
            //  Copyright © \(year) \(fullUserName). All rights reserved.
            //
            """
        case "COPYRIGHT":
            return "Copyright © \(year) \(fullUserName). All rights reserved."
        default:
            return ""
        }
    }

    private func apply(_ transforms: [Transformation], to value: String) -> String {
        transforms.reduce(value) { currentValue, transform in
            switch transform {
            case .identifier:
                return currentValue
                    .replacingOccurrences(of: " ", with: "")
                    .replacingOccurrences(of: "-", with: "_")

            case .rfc1034Identifier:
                return currentValue
                    .lowercased()
                    .replacingOccurrences(of: " ", with: "-")
                    .replacingOccurrences(of: "_", with: "-")

            case .bundleIdentifier:
                return currentValue
                    .lowercased()
                    .replacingOccurrences(of: " ", with: ".")
                    .replacingOccurrences(of: "_", with: ".")

            case .c99extidentifier:
                return currentValue
                    .replacingOccurrences(of: " ", with: "_")
                    .filter { $0.isLetter || $0.isNumber || $0 == "_" }
            }
        }
    }
}
```

### 2.2 Template Processor

```swift
struct TemplateProcessor {
    let parser = TemplateContentParser()

    func process(template: String, context: VariableContext) throws -> String {
        // Parse template into tokens
        let tokens = try parser.parse(template[...])

        // Resolve and concatenate
        var context = context  // Make mutable for UUID caching
        return tokens.map { token in
            switch token {
            case .text(let str):
                return str
            case .variable(let varToken):
                return context.resolveVariable(varToken)
            }
        }.joined()
    }
}
```

## Phase 3: Integration with Templatomat

### 3.1 Package Structure

```swift
// New package: TemplateParser
TemplateParser/
├── Sources/
│   └── TemplateParser/
│       ├── Models/
│       │   ├── TemplateToken.swift
│       │   ├── VariableToken.swift
│       │   └── Transformation.swift
│       ├── Parsers/
│       │   ├── VariableParser.swift
│       │   ├── TemplateContentParser.swift
│       │   └── TransformationParser.swift
│       ├── Resolution/
│       │   ├── VariableContext.swift
│       │   ├── VariableResolver.swift
│       │   └── MacroExpander.swift
│       └── TemplateProcessor.swift
└── Package.swift (depends on swift-parsing)
```

### 3.2 Usage Example

```swift
import TemplateParser

// Create context
let context = VariableContext(
    fileName: "ContentView.swift",
    fileBaseName: "ContentView",
    projectName: "MyApp",
    packageName: "MyApp",
    userName: "mm",
    fullUserName: "Mihaela Mihaljevic",
    date: "16.11.2025",
    year: "2025",
    options: [
        "productName": "My Product",
        "bundleIdentifierPrefix": "com.example"
    ]
)

// Process template
let processor = TemplateProcessor()
let templateContent = """
//___FILEHEADER___

import SwiftUI

struct ___FILEBASENAMEASIDENTIFIER___: View {
    var body: some View {
        Text("Hello from ___VARIABLE_productName___!")
    }
}
"""

let generatedCode = try processor.process(
    template: templateContent,
    context: context
)

print(generatedCode)
// Output:
// //
// //  ContentView.swift
// //  MyApp
// //
// //  Created by Mihaela Mihaljevic on 16.11.2025.
// //  Copyright © 2025 Mihaela Mihaljevic. All rights reserved.
// //
//
// import SwiftUI
//
// struct ContentView: View {
//     var body: some View {
//         Text("Hello from My Product!")
//     }
// }
```

## Phase 4: Advanced Features

### 4.1 Multi-Pass Processing

For templates with nested variable references:

```swift
struct MultiPassProcessor {
    let maxPasses = 3

    func process(template: String, context: VariableContext) throws -> String {
        var current = template
        var previous = ""
        var pass = 0

        while current != previous && pass < maxPasses {
            previous = current
            let processor = TemplateProcessor()
            current = try processor.process(template: current, context: context)
            pass += 1
        }

        return current
    }
}
```

### 4.2 Option Validation Parser

```swift
struct OptionConstraintParser: Parser {
    // Parse RequiredOptionsForValues from TemplateInfo.plist
    var body: some Parser<Substring, [String: [String: String]]> {
        // Parse plist structure to understand option dependencies
        // Example: "Swift Testing" requires languageChoice = "Swift"
        fatalError("Implement plist parsing")
    }
}
```

### 4.3 Conditional File Inclusion

```swift
struct ConditionalFileParser {
    func shouldInclude(file: String, options: [String: String]) -> Bool {
        // Parse file path patterns like:
        // "Tests/___PACKAGENAME___Tests.swift" only if testingSystem != "None"

        // Extract conditions from template metadata
        // Evaluate against current options
        return true
    }
}
```

## Benefits of swift-parsing Approach

### 1. **Type Safety**
```swift
// Compile-time guarantees
let token: VariableToken = try parser.parse("___FILEBASENAME:identifier___")
// No string manipulation errors
```

### 2. **Composability**
```swift
// Build complex parsers from simple ones
let variableParser = Parse {
    "___"
    variableName
    Optionally { transformations }
    "___"
}
```

### 3. **Performance**
- Zero-copy parsing with `Substring`
- Optimized for UTF-8 processing
- Comparable to hand-written parsers

### 4. **Testability**
```swift
func testVariableParser() throws {
    let input = "___FILEBASENAME:identifier___"
    let result = try VariableParser().parse(input[...])
    XCTAssertEqual(
        result,
        .transformed("FILEBASENAME", [.identifier])
    )
}
```

### 5. **Error Reporting**
```swift
do {
    try parser.parse(malformedInput)
} catch {
    // Get detailed error with location
    print(error.localizedDescription)
    // "error: unexpected input at offset 12"
}
```

### 6. **Invertibility** (Future)
```swift
// Use ParsePrint for bidirectional transformation
let parser = ParsePrint(.memberwise(VariableToken.simple)) {
    "___"
    Rest().map(String.init)
    "___"
}

// Parse
let token = try parser.parse("___FILEBASENAME___")

// Print (reverse)
let string = try parser.print(.simple("FILEBASENAME"))
// "___FILEBASENAME___"
```

## Implementation Roadmap

### Week 1-2: Foundation
- [ ] Set up TemplateParser package
- [ ] Add swift-parsing dependency
- [ ] Implement basic token models
- [ ] Write variable parser

### Week 3-4: Core Parsing
- [ ] Implement template content parser
- [ ] Add transformation support
- [ ] Create variable context
- [ ] Build template processor

### Week 5-6: Integration
- [ ] Integrate with Templatomat
- [ ] Add file template support
- [ ] Test with all 58 file templates
- [ ] Performance optimization

### Week 7-8: Advanced Features
- [ ] Multi-pass processing
- [ ] Option validation
- [ ] Conditional file inclusion
- [ ] Project template support

### Week 9-10: Polish
- [ ] Comprehensive testing
- [ ] Error handling
- [ ] Documentation
- [ ] Performance benchmarks

## Testing Strategy

### Unit Tests
```swift
class VariableParserTests: XCTestCase {
    func testSimpleVariable() throws {
        let input = "___FILEBASENAME___"
        let result = try VariableParser().parse(input[...])
        XCTAssertEqual(result, .simple("FILEBASENAME"))
    }

    func testTransformedVariable() throws {
        let input = "___FILEBASENAME:identifier:RFC1034Identifier___"
        let result = try VariableParser().parse(input[...])
        XCTAssertEqual(result, .transformed("FILEBASENAME", [.identifier, .rfc1034Identifier]))
    }

    func testOptionVariable() throws {
        let input = "___VARIABLE_productName:bundleIdentifier___"
        let result = try VariableParser().parse(input[...])
        XCTAssertEqual(result, .option("productName", [.bundleIdentifier]))
    }
}
```

### Integration Tests
```swift
class TemplateProcessorTests: XCTestCase {
    func testSwiftFileTemplate() throws {
        let context = makeTestContext()
        let template = loadTemplate("Swift File")
        let result = try TemplateProcessor().process(template: template, context: context)

        XCTAssertTrue(result.contains("import Foundation"))
        XCTAssertTrue(result.contains("Created by"))
        XCTAssertTrue(result.contains("Copyright"))
    }
}
```

## Conclusion

Using **swift-parsing** provides a robust, type-safe, and performant solution for parsing Xcode templates. The compositional nature of the library maps perfectly to the hierarchical structure of template variables, and the zero-copy parsing ensures optimal performance even with large template files.

The strategy breaks down the complex template processing into manageable phases:
1. **Parse** template content into structured tokens
2. **Resolve** variables using context and transformations
3. **Generate** final output by substituting values
4. **Validate** and handle edge cases

This approach is maintainable, testable, and extensible for future template format changes.
