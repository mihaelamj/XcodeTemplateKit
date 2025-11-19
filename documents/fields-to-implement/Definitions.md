# Definitions Field

## Current Status
**Stored as:** `Data?` (unparsed binary plist data)
**Occurrences:** 43 templates
**Priority:** High (common in file templates)

## Description
The `Definitions` field specifies text replacement rules and code block definitions for template files. It's primarily used in file templates to define where code should be inserted and how it should be structured.

## Structure

```swift
Definitions: [String: Any]
```

Dictionary where keys are file paths or file path + block identifiers, and values are either:
1. Simple values (String, Int) for sort order or placeholders
2. Dictionaries with code block definitions

### Key Formats
- `"filename.ext"`: Applies to entire file (e.g., `"main.m"`)
- `"filename.ext:blockName"`: Applies to specific code block (e.g., `"main.m:main"`)

### Code Block Definition Structure
```swift
{
  "Beginning": String,     // Start of code block
  "End": String,           // End of code block
  "Indent": Int            // Indentation level
}
```

### Simple Property Structure
```swift
{
  "SortOrder": Int         // File sorting priority
}
```

## Examples

### Main Function Definition (Objective-C)
```xml
<key>Definitions</key>
<dict>
  <key>main.m</key>
  <dict>
    <key>SortOrder</key>
    <integer>999</integer>
  </dict>
  <key>main.m:main</key>
  <dict>
    <key>Beginning</key>
    <string>int main(int argc, const char * argv[]) {</string>
    <key>End</key>
    <string>}</string>
    <key>Indent</key>
    <integer>1</integer>
  </dict>
</dict>
```

### Simple Info.plist Definition
```xml
<key>Definitions</key>
<dict>
  <key>Info.plist:XPCService</key>
  <string></string>
</dict>
```

### Multiple File Definitions
```xml
<key>Definitions</key>
<dict>
  <key>AppDelegate.swift</key>
  <dict>
    <key>SortOrder</key>
    <integer>1</integer>
  </dict>
  <key>ContentView.swift</key>
  <dict>
    <key>SortOrder</key>
    <integer>2</integer>
  </dict>
  <key>ContentView.swift:body</key>
  <dict>
    <key>Beginning</key>
    <string>var body: some View {</string>
    <key>End</key>
    <string>}</string>
    <key>Indent</key>
    <integer>2</integer>
  </dict>
</dict>
```

## Field Variations Found

From analyzing 43 fixtures, the following patterns exist:

### Value Types
1. **Code Block Dictionary**:
   - `Beginning` (String)
   - `End` (String)
   - `Indent` (Int)

2. **File Properties Dictionary**:
   - `SortOrder` (Int)

3. **Simple String**:
   - Empty string `""`
   - Placeholder values

### Key Patterns
- `"filename"` → file-level properties
- `"filename:identifier"` → code block within file
- Common identifiers: `main`, `body`, `init`, `XPCService`, etc.

## Analysis

### Parsing Strategy: **Hybrid - Structured with Dynamic Keys**

**Rationale:**
- Dictionary keys are dynamic (filename-based)
- Values can be multiple types (string, int, dictionary)
- The value dictionaries have known, fixed schemas
- Need to preserve filename structure for template substitution

### Recommended Implementation

```swift
public enum DefinitionValue: Codable, Sendable {
    case string(String)
    case sortOrder(Int)
    case codeBlock(CodeBlockDefinition)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let int = try? container.decode(Int.self) {
            self = .sortOrder(int)
        } else if let dict = try? container.decode([String: PropertyListValue].self) {
            // Try to decode as code block
            if let beginning = dict["Beginning"]?.stringValue,
               let end = dict["End"]?.stringValue,
               let indent = dict["Indent"]?.intValue {
                self = .codeBlock(CodeBlockDefinition(
                    beginning: beginning,
                    end: end,
                    indent: indent
                ))
            } else if let sortOrder = dict["SortOrder"]?.intValue {
                self = .sortOrder(sortOrder)
            } else {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(codingPath: decoder.codingPath,
                                        debugDescription: "Unknown definition format")
                )
            }
        } else {
            throw DecodingError.typeMismatch(
                DefinitionValue.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                                    debugDescription: "Cannot decode definition value")
            )
        }
    }
}

public struct CodeBlockDefinition: Codable, Sendable {
    public let beginning: String
    public let end: String
    public let indent: Int

    enum CodingKeys: String, CodingKey {
        case beginning = "Beginning"
        case end = "End"
        case indent = "Indent"
    }
}

// In TemplateMetadata:
public let definitions: [String: DefinitionValue]?
```

### Parsing Approach
Use standard `Decodable` with a custom `DefinitionValue` enum to handle the polymorphic values. No need for pointfree-parsing.

## Template Usage
The `Definitions` field tells Xcode to:
1. **Sort files**: Use `SortOrder` to determine file order in navigator
2. **Define code blocks**: Specify where generated code should be inserted
3. **Structure code**: Control indentation and block boundaries
4. **Mark insertion points**: Empty strings mark where code generation occurs

### Code Block Usage
When a template file contains a marker like `«INTERFACE»`, Xcode:
1. Looks up the corresponding definition (e.g., `"filename:INTERFACE"`)
2. Uses `Beginning` and `End` to wrap generated code
3. Applies `Indent` level to all generated lines

## Related Fields
- **MainTemplateFile**: Specifies which file definitions apply to
- **Nodes**: Lists files that may have definitions
- **DefaultCompletionName**: May be used in generated code

## Implementation Notes
- Keys use `:` separator for file:block notation
- `SortOrder` higher numbers = lower in file list (999 = last)
- Empty string values mark insertion points
- Indent values are typically 0-4 (tab stops)
- Currently stored as raw `Data` to preserve variable keys
- **High priority** due to frequency (43 occurrences)

## Challenges
1. **Dynamic keys**: Filenames aren't known at compile time
2. **Polymorphic values**: Can be string, int, or dictionary
3. **Nested dictionaries**: Need to distinguish between property dicts and code block dicts
4. **Template variables**: Filenames may contain `___VAR___` placeholders

## Proposed Parsing Steps
1. Decode as `[String: DefinitionValue]` dictionary
2. Parse each value based on its type
3. For dictionaries, check for code block keys (`Beginning`, `End`, `Indent`)
4. Fall back to property dictionary for other dictionary types
5. Preserve all keys exactly as-is (don't resolve template variables)

## Real-World Usage Example

For a file template creating `MyClass.swift`:

```xml
<key>Definitions</key>
<dict>
  <key>___FILEBASENAME___.swift</key>
  <dict>
    <key>SortOrder</key>
    <integer>10</integer>
  </dict>
  <key>___FILEBASENAME___.swift:class</key>
  <dict>
    <key>Beginning</key>
    <string>class ___FILEBASENAMEASIDENTIFIER___ {</string>
    <key>End</key>
    <string>}</string>
    <key>Indent</key>
    <integer>1</integer>
  </dict>
</dict>
```

When instantiated with filename "MyClass", Xcode:
1. Creates `MyClass.swift` with sort order 10
2. Wraps class content with `class MyClass { ... }`
3. Indents class body by 1 level
