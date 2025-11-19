# Kind Field - Parsing Rules

## Overview
The `Kind` field specifies the template type and determines how Xcode processes the template.

## Type
**String** (required)

## Valid Values

### File Templates
```
Xcode.IDEFoundation.TextSubstitutionFileTemplateKind
```

### Project Templates
```
Xcode.Xcode3.ProjectTemplateUnitKind
```

## Parsing Rules

### 1. Validation Requirements
- **MUST** be present in every template
- **MUST** be one of the two valid values (case-sensitive)
- **MUST** be a String type
- Invalid values cause template to be ignored

### 2. Parsing Implementation

```swift
enum TemplateKind: String, Codable {
    case fileTemplate = "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind"
    case projectTemplate = "Xcode.Xcode3.ProjectTemplateUnitKind"
}

func parseKind(from plist: [String: Any]) throws -> TemplateKind {
    guard let kindString = plist["Kind"] as? String else {
        throw TemplateParsingError.missingRequiredKey("Kind")
    }

    guard let kind = TemplateKind(rawValue: kindString) else {
        throw TemplateParsingError.invalidKind(kindString)
    }

    return kind
}
```

### 3. Template Categories by Kind

**File Template Kind:**
- Creates individual files
- Uses simple text substitution
- Can create multiple related files
- Located in: `~/Library/Developer/Xcode/Templates/File Templates/`
- Examples: Swift file, Header file, MVVM View

**Project Template Kind:**
- Creates entire project structure
- Includes targets, build settings, dependencies
- Can include multiple files and resources
- Located in: `~/Library/Developer/Xcode/Templates/Project Templates/`
- Examples: iOS App, macOS App, Framework

### 4. Behavioral Differences

| Aspect | File Template | Project Template |
|--------|---------------|------------------|
| Scope | Individual files | Entire project |
| Location | Within existing project | New project directory |
| Targets | References existing | Creates new targets |
| Build Settings | N/A | Defines configurations |
| Complexity | Simple | Complex |
| Nodes | File list | File + folder structure |

### 5. Common Errors

**Missing Kind:**
```xml
<!-- INVALID: No Kind key -->
<dict>
    <key>Identifier</key>
    <string>com.example.template</string>
</dict>
```
**Result:** Template will not load

**Wrong Type:**
```xml
<!-- INVALID: Integer instead of String -->
<dict>
    <key>Kind</key>
    <integer>1</integer>
</dict>
```
**Result:** Parsing error

**Invalid Value:**
```xml
<!-- INVALID: Unknown kind value -->
<dict>
    <key>Kind</key>
    <string>CustomTemplateKind</string>
</dict>
```
**Result:** Template ignored by Xcode

**Case Sensitivity:**
```xml
<!-- INVALID: Wrong case -->
<dict>
    <key>Kind</key>
    <string>xcode.ideFoundation.textSubstitutionFileTemplateKind</string>
</dict>
```
**Result:** Template ignored (must match exactly)

### 6. Valid Examples

**File Template:**
```xml
<dict>
    <key>Identifier</key>
    <string>com.example.swiftfile</string>

    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>

    <key>Description</key>
    <string>Swift file template</string>
</dict>
```

**Project Template:**
```xml
<dict>
    <key>Identifier</key>
    <string>com.example.iosapp</string>

    <key>Kind</key>
    <string>Xcode.Xcode3.ProjectTemplateUnitKind</string>

    <key>Description</key>
    <string>iOS application project</string>
</dict>
```

### 7. Inheritance Behavior

Kind is **inherited** from ancestors if not specified:

```xml
<!-- Parent template -->
<dict>
    <key>Identifier</key>
    <string>com.example.base</string>
    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
</dict>

<!-- Child template (inherits Kind) -->
<dict>
    <key>Identifier</key>
    <string>com.example.child</string>
    <key>Ancestors</key>
    <array>
        <string>com.example.base</string>
    </array>
    <!-- Kind inherited from parent -->
</dict>
```

### 8. Serialization Rules

```swift
func serializeKind(_ kind: TemplateKind) -> [String: Any] {
    return ["Kind": kind.rawValue]
}
```

**Output:**
```xml
<key>Kind</key>
<string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
```

### 9. Validation Logic

```swift
func validateKind(_ kind: String) -> Bool {
    return kind == "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind" ||
           kind == "Xcode.Xcode3.ProjectTemplateUnitKind"
}
```

### 10. Testing Requirements

```swift
func testKindParsing() {
    // Valid file template
    let fileKind = "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind"
    XCTAssertEqual(try parseKind(["Kind": fileKind]), .fileTemplate)

    // Valid project template
    let projectKind = "Xcode.Xcode3.ProjectTemplateUnitKind"
    XCTAssertEqual(try parseKind(["Kind": projectKind]), .projectTemplate)

    // Invalid cases
    XCTAssertThrowsError(try parseKind([:]))  // Missing
    XCTAssertThrowsError(try parseKind(["Kind": "InvalidKind"]))
    XCTAssertThrowsError(try parseKind(["Kind": 123]))  // Wrong type
}
```

### 11. XcodeTemplateKit Implementation

**Model:**
```swift
// TemplateKind.swift
enum TemplateKind: String, Codable {
    case fileTemplate = "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind"
    case projectTemplate = "Xcode.Xcode3.ProjectTemplateUnitKind"

    var category: TemplateCategory {
        switch self {
        case .fileTemplate:
            return .file
        case .projectTemplate:
            return .project
        }
    }
}

enum TemplateCategory {
    case file
    case project
}
```

**Parser:**
```swift
// Decoding from plist
init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    kind = try container.decode(TemplateKind.self, forKey: .kind)
}
```

**Generator:**
```swift
// Encoding to plist
func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(kind.rawValue, forKey: .kind)
}
```

### 12. Associated Fields by Kind

**File Template Kind requires:**
- Identifier ✅
- Kind ✅
- Description ✅
- Nodes (optional but common)
- Definitions (optional)

**Project Template Kind requires:**
- Identifier ✅
- Kind ✅
- Description ✅
- Project (dictionary with build settings)
- Targets (array of target definitions)
- Nodes (file structure)

### 13. Debugging

**Extract Kind value:**
```bash
plutil -extract Kind raw TemplateInfo.plist
```

**Find all file templates:**
```bash
find ~/Library/Developer/Xcode/Templates -name TemplateInfo.plist -exec sh -c 'if plutil -extract Kind raw "{}" 2>/dev/null | grep -q "TextSubstitutionFileTemplateKind"; then echo "{}"; fi' \;
```

**Find all project templates:**
```bash
find ~/Library/Developer/Xcode/Templates -name TemplateInfo.plist -exec sh -c 'if plutil -extract Kind raw "{}" 2>/dev/null | grep -q "ProjectTemplateUnitKind"; then echo "{}"; fi' \;
```

### 14. Historical Context

**Xcode 3.x:**
Used different kind identifiers, now deprecated.

**Xcode 4.0+:**
Introduced current Kind values, which remain unchanged.

**Compatibility:**
Templates with Xcode 3 kind values will not work in modern Xcode.

### 15. Critical Rules Summary

1. ✅ **MUST** be present (or inherited from ancestor)
2. ✅ **MUST** be String type
3. ✅ **MUST** be one of two exact values (case-sensitive)
4. ✅ **MUST** match template location (File Templates vs Project Templates)
5. ✅ **Determines** which additional fields are required/valid
6. ✅ **Cannot** be customized (only two valid values exist)
