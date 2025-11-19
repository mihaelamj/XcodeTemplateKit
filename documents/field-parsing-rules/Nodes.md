# Nodes Field - Parsing Rules

## Overview
The `Nodes` field specifies the list of files that will be created from the template. Each node represents a file path relative to the template bundle.

## Type
**Array of Strings** (optional but common)

## Parsing Rules

### 1. Validation Requirements
- **Optional** field (can be absent or empty array)
- **MUST** be Array type if present
- Each element **MUST** be a String
- File names **CAN** contain placeholders
- Files **MUST** exist in template bundle or be defined in Definitions

### 2. Parsing Implementation

```swift
func parseNodes(from plist: [String: Any]) -> [String]? {
    guard let nodes = plist["Nodes"] as? [String] else {
        return nil  // Optional field
    }

    return nodes.filter { !$0.isEmpty }
}
```

### 3. Node Format

**File Paths:**
```
___FILEBASENAME___.swift
___FILEBASENAME___Tests.swift
Resources/Icon.png
Models/___VARIABLE_modelName___.swift
```

**Characteristics:**
- Relative to template bundle root
- Can contain placeholders (substituted at generation time)
- Can include subdirectory paths
- Must match files in bundle or Definitions

### 4. Common Examples

**Single File Template:**
```xml
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
</array>
```

**Multiple Files:**
```xml
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
    <string>___FILEBASENAME___ViewModel.swift</string>
    <string>___FILEBASENAME___Tests.swift</string>
</array>
```

**With Subdirectories:**
```xml
<key>Nodes</key>
<array>
    <string>Views/___FILEBASENAME___.swift</string>
    <string>ViewModels/___FILEBASENAME___ViewModel.swift</string>
    <string>Resources/Icons.xcassets</string>
</array>
```

**With Custom Variables:**
```xml
<key>Nodes</key>
<array>
    <string>___VARIABLE_className___.swift</string>
    <string>___VARIABLE_className___+Extensions.swift</string>
</array>
```

### 5. Relationship with Definitions

Nodes can reference files defined in Definitions dictionary:

```xml
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
    <string>GeneratedFile.swift</string>  <!-- Not in bundle -->
</array>

<key>Definitions</key>
<dict>
    <key>GeneratedFile.swift</key>
    <dict>
        <key>Path</key>
        <string>Generated/GeneratedFile.swift</string>
        <!-- File content generated dynamically -->
    </dict>
</dict>
```

### 6. File Resolution

Xcode resolves each node in this order:
1. Check Definitions dictionary for explicit definition
2. Look for file in template bundle matching the node name
3. If placeholder-based, resolve placeholder first then check bundle
4. Fail if file cannot be found

### 7. Placeholder Substitution

Node names with placeholders are resolved at template instantiation:

**Before (in plist):**
```xml
<string>___FILEBASENAME___.swift</string>
<string>___FILEBASENAME___Tests.swift</string>
```

**After (user enters "MyView"):**
```
MyView.swift
MyViewTests.swift
```

**Template Bundle Must Contain:**
```
MyTemplate.xctemplate/
├── TemplateInfo.plist
├── ___FILEBASENAME___.swift       # Template file
└── ___FILEBASENAME___Tests.swift  # Template file
```

### 8. Inheritance Behavior

Nodes are **merged** from ancestors:

```xml
<!-- Parent template -->
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
</array>

<!-- Child template -->
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___Tests.swift</string>
</array>

<!-- Effective Nodes: [___FILEBASENAME___.swift, ___FILEBASENAME___Tests.swift] -->
```

### 9. Common Errors

**Node File Not Found:**
```xml
<!-- INVALID: File doesn't exist in bundle -->
<key>Nodes</key>
<array>
    <string>NonExistent.swift</string>
</array>
```
**Result:** Template fails to generate file

**Wrong Type:**
```xml
<!-- INVALID: Should be array of strings -->
<key>Nodes</key>
<string>___FILEBASENAME___.swift</string>
```
**Result:** Parsing error

**Empty String:**
```xml
<!-- DISCOURAGED: Empty node -->
<key>Nodes</key>
<array>
    <string></string>
    <string>ValidFile.swift</string>
</array>
```
**Result:** Empty node ignored (may cause warning)

### 10. Advanced: Conditional Nodes

Use Definitions with TargetIndices to conditionally create files:

```xml
<key>Nodes</key>
<array>
    <string>AppDelegate.swift</string>
    <string>Tests.swift</string>
</array>

<key>Definitions</key>
<dict>
    <key>AppDelegate.swift</key>
    <dict>
        <key>TargetIndices</key>
        <array>
            <integer>0</integer>  <!-- Only in main target -->
        </array>
    </dict>

    <key>Tests.swift</key>
    <dict>
        <key>TargetIndices</key>
        <array>
            <integer>1</integer>  <!-- Only in test target -->
        </array>
    </dict>
</dict>
```

### 11. Testing Requirements

```swift
func testNodesParsing() {
    // Valid cases
    let singleNode = ["Nodes": ["File.swift"]]
    XCTAssertEqual(try parseNodes(singleNode), ["File.swift"])

    let multipleNodes = ["Nodes": ["File1.swift", "File2.swift"]]
    XCTAssertEqual(try parseNodes(multipleNodes)?.count, 2)

    let withPlaceholders = ["Nodes": ["___FILEBASENAME___.swift"]]
    XCTAssertNoThrow(try parseNodes(withPlaceholders))

    // Empty array is valid
    let emptyNodes = ["Nodes": []] as [String: Any]
    XCTAssertNotNil(try parseNodes(emptyNodes))

    // Missing Nodes is valid (optional)
    let noNodes: [String: Any] = [:]
    XCTAssertNil(try parseNodes(noNodes))

    // Invalid cases
    let wrongType = ["Nodes": "String"] as [String: Any]
    XCTAssertThrowsError(try parseNodes(wrongType))

    let mixedTypes = ["Nodes": ["Valid", 123]] as [String: Any]
    XCTAssertThrowsError(try parseNodes(mixedTypes))
}
```

### 12. Serialization Rules

```swift
func serializeNodes(_ nodes: [String]?) -> [String: Any]? {
    guard let nodes = nodes, !nodes.isEmpty else {
        return nil
    }

    return ["Nodes": nodes]
}
```

**Output:**
```xml
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
    <string>___FILEBASENAME___ViewModel.swift</string>
</array>
```

### 13. Best Practices

**DO:**
- List files in logical order (main files first)
- Use clear, descriptive file names
- Include all files user expects to see
- Use consistent placeholder patterns
- Match node names to bundle file names

**DON'T:**
- Include files that don't exist in bundle
- Use absolute paths (always relative)
- Duplicate node entries
- Include hidden files (., .DS_Store)
- Mix placeholder styles inconsistently

### 14. File Organization Patterns

**MVVM Pattern:**
```xml
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
    <string>___FILEBASENAME___ViewModel.swift</string>
    <string>___FILEBASENAME___Model.swift</string>
</array>
```

**With Tests:**
```xml
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
    <string>___FILEBASENAME___Tests.swift</string>
    <string>___FILEBASENAME___UITests.swift</string>
</array>
```

**With Resources:**
```xml
<key>Nodes</key>
<array>
    <string>___FILEBASENAME___.swift</string>
    <string>Resources/___FILEBASENAME___.xib</string>
    <string>Resources/___FILEBASENAME___.xcassets</string>
</array>
```

### 15. XcodeTemplateKit Implementation

**Model:**
```swift
struct TemplateMetadata: Codable {
    let nodes: [String]?
}
```

**Parser:**
```swift
// Automatic decoding via Codable
let metadata = try PropertyListDecoder().decode(TemplateMetadata.self, from: data)
```

**Generator:**
```swift
func createPlist(from metadata: TemplateMetadata) -> [String: Any] {
    var plist: [String: Any] = [:]

    if let nodes = metadata.nodes, !nodes.isEmpty {
        plist["Nodes"] = nodes
    }

    return plist
}
```

### 16. Debugging

**Extract nodes:**
```bash
plutil -extract Nodes xml1 TemplateInfo.plist
```

**List all nodes:**
```bash
plutil -extract Nodes raw -o - TemplateInfo.plist 2>/dev/null | grep -v "^(" | grep -v "^)" | xargs
```

**Count nodes:**
```bash
plutil -convert json -o - TemplateInfo.plist 2>/dev/null | jq '.Nodes | length'
```

**Find templates with specific node:**
```bash
find ~/Library/Developer/Xcode/Templates -name TemplateInfo.plist -exec sh -c 'if plutil -extract Nodes xml1 -o - "{}" 2>/dev/null | grep -q "Tests.swift"; then echo "{}"; fi' \;
```

### 17. Critical Rules Summary

1. ✅ **OPTIONAL** field (can be absent)
2. ✅ **MUST** be Array of Strings if present
3. ✅ **CAN** contain placeholders (resolved at generation)
4. ✅ **Files MUST** exist in bundle or Definitions
5. ✅ **Paths ARE** relative to template bundle
6. ✅ **Nodes ARE** merged from ancestors
7. ✅ **Order MATTERS** (affects creation sequence)
8. ✅ **Empty array IS** valid (template creates no files)
9. ✅ **Duplicates ARE** possible but discouraged
10. ✅ **Used WITH** Definitions for advanced scenarios
