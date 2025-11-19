# Definitions Field - Parsing Rules

## Overview
The `Definitions` field provides detailed specifications for each file created by the template, including location, target membership, and generation rules.

**Important**: This document describes the **data structure** and parsing rules, not semantic interpretation. Field names like "Group" and "Path" come directly from Xcode's plist format. How these are interpreted (e.g., whether Group refers to file system folders or virtual Xcode groups) is determined by the code generator, not the parser. The parser's job is to accurately represent the plist data structure.

## Type
**Dictionary** (optional)

## Structure
```
Dictionary<String, Dictionary<String, Any>>
  ↓
Key: File identifier (matches Nodes array entry)
Value: Definition dictionary with file properties
```

## Parsing Rules

### 1. Validation Requirements
- **Optional** field (can be absent or empty dictionary)
- **MUST** be Dictionary type if present
- Keys **SHOULD** match entries in Nodes array
- Each value **MUST** be a Dictionary
- Supports nested properties for file configuration

### 2. Definition Dictionary Keys

**Path** (String)
- Output file path relative to project root
- Can contain placeholders
- Example: `"Views/___FILEBASENAME___.swift"`

**Group** (String/Array)
- Xcode group(s) containing the file
- String for single group, Array for path
- Example: `"ViewModels"` or `["MyApp", "Sources", "ViewModels"]`
- **Note**: This field represents the data structure only (string vs array). Semantic interpretation (file system folders vs virtual Xcode groups) is handled by code generation, not parsing. The parser preserves the structure as-is from the plist.

**TargetIndices** (Array of Integers)
- Which targets should include this file
- Zero-indexed (0 = first target, 1 = second, etc.)
- Example: `[0, 1]` for main and test targets

**Beginning** (String)
- Content to prepend to file
- Used for header comments, imports
- Example: `"// Generated file\n"`

**End** (String)
- Content to append to file
- Example: `"\n// End of file"`

**SortOrder** (Integer)
- Order in Xcode file list
- Lower numbers appear first
- Default: undefined (alphabetical)

### 3. Parsing Implementation

```swift
struct FileDefinition: Codable {
    let path: String?
    let group: FileGroup?
    let targetIndices: [Int]?
    let beginning: String?
    let end: String?
    let sortOrder: Int?

    enum CodingKeys: String, CodingKey {
        case path = "Path"
        case group = "Group"
        case targetIndices = "TargetIndices"
        case beginning = "Beginning"
        case end = "End"
        case sortOrder = "SortOrder"
    }
}

enum FileGroup: Codable {
    case single(String)
    case path([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .single(string)
        } else if let array = try? container.decode([String].self) {
            self = .path(array)
        } else {
            throw DecodingError.typeMismatch(
                FileGroup.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected String or Array"
                )
            )
        }
    }
}

func parseDefinitions(from plist: [String: Any]) -> [String: FileDefinition]? {
    guard let definitionsDict = plist["Definitions"] as? [String: [String: Any]] else {
        return nil  // Optional field
    }

    var definitions: [String: FileDefinition] = [:]

    for (key, value) in definitionsDict {
        if let definition = try? PropertyListDecoder().decode(FileDefinition.self, from: value) {
            definitions[key] = definition
        }
    }

    return definitions.isEmpty ? nil : definitions
}
```

### 4. Common Examples

**Basic Definition:**
```xml
<key>Definitions</key>
<dict>
    <key>___FILEBASENAME___.swift</key>
    <dict>
        <key>Path</key>
        <string>Sources/___FILEBASENAME___.swift</string>

        <key>Group</key>
        <string>Sources</string>

        <key>TargetIndices</key>
        <array>
            <integer>0</integer>
        </array>
    </dict>
</dict>
```

**Multiple Files:**
```xml
<key>Definitions</key>
<dict>
    <key>___FILEBASENAME___.swift</key>
    <dict>
        <key>Path</key>
        <string>Views/___FILEBASENAME___.swift</string>
        <key>Group</key>
        <string>Views</string>
        <key>TargetIndices</key>
        <array>
            <integer>0</integer>
        </array>
    </dict>

    <key>___FILEBASENAME___Tests.swift</key>
    <dict>
        <key>Path</key>
        <string>Tests/___FILEBASENAME___Tests.swift</string>
        <key>Group</key>
        <string>Tests</string>
        <key>TargetIndices</key>
        <array>
            <integer>1</integer>  <!-- Test target -->
        </array>
    </dict>
</dict>
```

**Nested Group Path:**
```xml
<key>Definitions</key>
<dict>
    <key>Model.swift</key>
    <dict>
        <key>Group</key>
        <array>
            <string>MyApp</string>
            <string>Sources</string>
            <string>Models</string>
        </array>
    </dict>
</dict>
```

**With Beginning/End:**
```xml
<key>Definitions</key>
<dict>
    <key>Generated.swift</key>
    <dict>
        <key>Beginning</key>
        <string>// This file is auto-generated. Do not edit.
import Foundation
</string>

        <key>End</key>
        <string>
// End of generated file</string>
    </dict>
</dict>
```

### 5. Target Membership

**TargetIndices Behavior:**
- `[0]` - File added to first target only (usually main app)
- `[1]` - File added to second target only (usually tests)
- `[0, 1]` - File added to both targets
- `[]` - File not added to any target (resources, documentation)
- Absent - Default behavior (usually first target)

**Example for Test Files:**
```xml
<!-- Main source file: app target -->
<key>MyClass.swift</key>
<dict>
    <key>TargetIndices</key>
    <array>
        <integer>0</integer>
    </array>
</dict>

<!-- Test file: test target -->
<key>MyClassTests.swift</key>
<dict>
    <key>TargetIndices</key>
    <array>
        <integer>1</integer>
    </array>
</dict>

<!-- Shared utility: both targets -->
<key>SharedHelper.swift</key>
<dict>
    <key>TargetIndices</key>
    <array>
        <integer>0</integer>
        <integer>1</integer>
    </array>
</dict>
```

### 6. Path Resolution

**Relative Paths:**
```xml
<key>Path</key>
<string>Sources/MyFile.swift</string>
<!-- Created at: ProjectRoot/Sources/MyFile.swift -->
```

**With Placeholders:**
```xml
<key>Path</key>
<string>___VARIABLE_category___/___FILEBASENAME___.swift</string>
<!-- If category="Models", name="User" -->
<!-- Created at: ProjectRoot/Models/User.swift -->
```

**Nested Directories:**
```xml
<key>Path</key>
<string>App/Features/Authentication/Views/___FILEBASENAME___.swift</string>
<!-- Creates nested directory structure automatically -->
```

### 7. Inheritance Behavior

Definitions are **deep merged** from ancestors:

```xml
<!-- Parent template -->
<key>Definitions</key>
<dict>
    <key>BaseFile.swift</key>
    <dict>
        <key>Group</key>
        <string>Sources</string>
    </dict>
</dict>

<!-- Child template -->
<key>Definitions</key>
<dict>
    <key>ChildFile.swift</key>
    <dict>
        <key>Group</key>
        <string>Features</string>
    </dict>
</dict>

<!-- Effective Definitions: -->
<!-- { "BaseFile.swift": {Group: "Sources"},
      "ChildFile.swift": {Group: "Features"} } -->
```

**Overriding Parent Definitions:**
```xml
<!-- Child can override specific file definition -->
<key>Definitions</key>
<dict>
    <key>BaseFile.swift</key>  <!-- Same key as parent -->
    <dict>
        <key>Group</key>
        <string>NewGroup</string>  <!-- Overrides parent -->
    </dict>
</dict>
```

### 8. Common Errors

**Wrong Type:**
```xml
<!-- INVALID: Should be dictionary -->
<key>Definitions</key>
<array>
    <string>File.swift</string>
</array>
```
**Result:** Parsing error

**Invalid TargetIndices:**
```xml
<!-- INVALID: TargetIndices should be array of integers -->
<key>Definitions</key>
<dict>
    <key>File.swift</key>
    <dict>
        <key>TargetIndices</key>
        <integer>0</integer>  <!-- Should be array -->
    </dict>
</dict>
```
**Result:** Parsing error

**Non-Existent Target Index:**
```xml
<!-- PROBLEMATIC: Template has only 1 target, but references index 5 -->
<key>TargetIndices</key>
<array>
    <integer>5</integer>
</array>
```
**Result:** File not added to any target (silent failure)

### 9. Testing Requirements

```swift
func testDefinitionsParsing() {
    // Valid cases
    let simple = [
        "Definitions": [
            "File.swift": [
                "Path": "Sources/File.swift",
                "Group": "Sources"
            ]
        ]
    ] as [String: Any]
    XCTAssertNoThrow(try parseDefinitions(simple))

    // With target indices
    let withTargets = [
        "Definitions": [
            "File.swift": [
                "TargetIndices": [0, 1]
            ]
        ]
    ] as [String: Any]
    XCTAssertNoThrow(try parseDefinitions(withTargets))

    // Empty dictionary is valid
    let empty = ["Definitions": [:]] as [String: Any]
    XCTAssertNotNil(try parseDefinitions(empty))

    // Missing Definitions is valid (optional)
    let missing: [String: Any] = [:]
    XCTAssertNil(try parseDefinitions(missing))
}
```

### 10. Best Practices

**DO:**
- Define Path for files not in template root
- Use Group to organize files in Xcode
- Set TargetIndices explicitly for clarity
- Use consistent directory structure
- Include all files from Nodes array

**DON'T:**
- Use absolute paths (always relative)
- Reference non-existent target indices
- Create overly deep group nesting
- Duplicate file definitions
- Omit definitions for complex templates

### 11. Serialization Rules

```swift
func serializeDefinitions(_ definitions: [String: FileDefinition]?) -> [String: Any]? {
    guard let definitions = definitions, !definitions.isEmpty else {
        return nil
    }

    var definitionsDict: [String: [String: Any]] = [:]

    for (key, definition) in definitions {
        var fileDict: [String: Any] = [:]

        if let path = definition.path {
            fileDict["Path"] = path
        }

        if let group = definition.group {
            switch group {
            case .single(let name):
                fileDict["Group"] = name
            case .path(let components):
                fileDict["Group"] = components
            }
        }

        if let targetIndices = definition.targetIndices {
            fileDict["TargetIndices"] = targetIndices
        }

        if let beginning = definition.beginning {
            fileDict["Beginning"] = beginning
        }

        if let end = definition.end {
            fileDict["End"] = end
        }

        if let sortOrder = definition.sortOrder {
            fileDict["SortOrder"] = sortOrder
        }

        definitionsDict[key] = fileDict
    }

    return ["Definitions": definitionsDict]
}
```

### 12. XcodeTemplateKit Implementation

**Model:**
```swift
struct TemplateMetadata: Codable {
    let definitions: [String: FileDefinition]?
}

struct FileDefinition: Codable {
    let path: String?
    let group: FileGroup?
    let targetIndices: [Int]?
    let beginning: String?
    let end: String?
}
```

### 13. Debugging

**Extract definitions:**
```bash
plutil -extract Definitions xml1 TemplateInfo.plist
```

**List all defined files:**
```bash
plutil -convert json -o - TemplateInfo.plist | jq '.Definitions | keys[]'
```

**Check specific file definition:**
```bash
plutil -extract "Definitions.File.swift" xml1 TemplateInfo.plist
```

### 14. Critical Rules Summary

1. ✅ **OPTIONAL** field (can be absent)
2. ✅ **MUST** be Dictionary if present
3. ✅ **Keys SHOULD** match Nodes entries
4. ✅ **Path IS** relative to project root
5. ✅ **Group CAN** be String or Array
6. ✅ **TargetIndices MUST** be Array of Integers
7. ✅ **Definitions ARE** deep merged from ancestors
8. ✅ **Child CAN** override parent definitions
9. ✅ **Used FOR** complex file placement
10. ✅ **Optional IF** simple file structure
