# Identifier Field - Parsing Rules

## Overview
The `Identifier` field is the most critical field in any Xcode template. It must be globally unique across all templates.

## Type
**String** (required)

## Parsing Rules

### 1. Validation Requirements
- **MUST** be present in every template
- **MUST** be globally unique across all installed templates
- **MUST** be a valid string (non-empty)
- **SHOULD** use reverse DNS notation

### 2. Format Specifications
```
Recommended: com.company.category.templateName
Examples:
  - com.apple.dt.unit.base
  - com.apple.dt.unit.coreDataModel
  - com.example.fileTemplate.mvvm-view
  - org.project.xctemplate.swiftui-screen
```

### 3. Parsing Implementation

```swift
func parseIdentifier(from plist: [String: Any]) throws -> String {
    guard let identifier = plist["Identifier"] as? String else {
        throw TemplateParsingError.missingRequiredKey("Identifier")
    }

    guard !identifier.isEmpty else {
        throw TemplateParsingError.invalidValue("Identifier cannot be empty")
    }

    return identifier
}
```

### 4. Validation Rules
- Empty strings are **INVALID**
- Whitespace-only strings are **INVALID**
- Non-unique identifiers cause **SILENT FAILURES** in Xcode
- Identifiers are **case-sensitive**

### 5. Common Errors

**Missing Identifier:**
```xml
<!-- INVALID: No Identifier key -->
<dict>
    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
</dict>
```
**Result:** Template will not load

**Empty Identifier:**
```xml
<!-- INVALID: Empty string -->
<dict>
    <key>Identifier</key>
    <string></string>
</dict>
```
**Result:** Template will not load

**Duplicate Identifier:**
```xml
<!-- INVALID: Same identifier as another template -->
<dict>
    <key>Identifier</key>
    <string>com.apple.dt.unit.base</string>  <!-- Already exists -->
</dict>
```
**Result:** Silent failure, one template will be ignored

### 6. Best Practices

**DO:**
- Use reverse DNS notation
- Include organization/company name
- Include template category
- Include descriptive template name
- Keep it readable and meaningful

**DON'T:**
- Reuse Apple's identifiers (com.apple.*)
- Use generic names without namespace
- Include version numbers (breaks inheritance)
- Use special characters beyond dots and hyphens

### 7. Inheritance Behavior
- Child templates reference parent Identifier in Ancestors array
- Identifier itself is **NOT** inherited from ancestors
- Each template must define its own unique Identifier

### 8. Serialization Rules

When generating TemplateInfo.plist:
```swift
func serializeIdentifier(_ identifier: String) -> [String: Any] {
    return ["Identifier": identifier]
}
```

**Output format:**
```xml
<key>Identifier</key>
<string>com.example.template.name</string>
```

### 9. Edge Cases

**Case Sensitivity:**
```
com.example.Template ≠ com.example.template
```
These are treated as different identifiers.

**Unicode Characters:**
```
com.example.template-café  // Potentially problematic
com.example.template-cafe  // Safer
```
Avoid non-ASCII characters for maximum compatibility.

**Length Limits:**
No documented length limit, but keep reasonable (<255 characters).

### 10. Testing Requirements

When testing Identifier parsing:
```swift
func testIdentifierParsing() {
    // Valid cases
    XCTAssertNoThrow(try parseIdentifier(["Identifier": "com.example.test"]))

    // Invalid cases
    XCTAssertThrowsError(try parseIdentifier([:]))  // Missing
    XCTAssertThrowsError(try parseIdentifier(["Identifier": ""]))  // Empty
    XCTAssertThrowsError(try parseIdentifier(["Identifier": 123]))  // Wrong type
}
```

### 11. XcodeTemplateKit Implementation

**Parser:**
```swift
// TemplateMetadata.swift
struct TemplateMetadata: Codable {
    let identifier: String  // Required, non-optional
}
```

**Generator:**
```swift
// TemplateWriter.swift
func writePlist(from metadata: TemplateMetadata) -> [String: Any] {
    var plist: [String: Any] = [:]
    plist["Identifier"] = metadata.identifier  // Always include
    return plist
}
```

### 12. Compatibility Notes

**Xcode 4.0+:** Required field
**Xcode 3.x:** Used different identifier system
**Current:** No changes since Xcode 4.0

### 13. Related Fields
- **Ancestors:** References other templates by Identifier
- **Kind:** Required alongside Identifier
- **Description:** Required alongside Identifier

### 14. Debugging

**Check if identifier exists:**
```bash
plutil -extract Identifier raw TemplateInfo.plist
```

**Find templates with specific identifier:**
```bash
find ~/Library/Developer/Xcode/Templates -name "*.plist" -exec plutil -extract Identifier raw {} \; 2>/dev/null | grep "com.example"
```

**Validate uniqueness:**
```bash
# List all identifiers in system templates
find /Applications/Xcode.app -name TemplateInfo.plist -exec plutil -extract Identifier raw {} \; 2>/dev/null | sort | uniq -d
```

### 15. Critical Rules Summary

1. ✅ **MUST** be present (parsing fails without it)
2. ✅ **MUST** be String type (not Int, Array, etc.)
3. ✅ **MUST** be non-empty (validation fails)
4. ✅ **MUST** be globally unique (silent failure in Xcode)
5. ✅ **SHOULD** use reverse DNS notation (best practice)
6. ✅ **SHOULD** be descriptive and meaningful (maintainability)
