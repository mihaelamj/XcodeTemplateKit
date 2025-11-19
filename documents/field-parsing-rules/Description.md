# Description Field - Parsing Rules

## Overview
The `Description` field provides user-facing text shown in the Xcode template chooser dialog.

## Type
**String** (required)

## Parsing Rules

### 1. Validation Requirements
- **MUST** be present in every template
- **MUST** be a String type
- **SHOULD** be concise (1-2 sentences)
- **SHOULD** be descriptive and helpful to users
- Empty strings are **valid but discouraged**

### 2. Parsing Implementation

```swift
func parseDescription(from plist: [String: Any]) throws -> String {
    guard let description = plist["Description"] as? String else {
        throw TemplateParsingError.missingRequiredKey("Description")
    }

    return description
}
```

### 3. Display Context

The Description appears in:
1. **Template chooser dialog** (main description area)
2. **Template browser** (detail view)
3. **Quick Help** when template is selected

### 4. Content Guidelines

**Good Descriptions:**
```
"A SwiftUI view with an observable view model following MVVM architecture."

"Creates a Codable model with JSON encoding/decoding support."

"Swift file with basic structure and import statements."
```

**Poor Descriptions:**
```
"Template"  // Too vague

"This template creates a file that you can use in your project to implement
various features using modern Swift syntax with all the latest features..."
// Too verbose

""  // Empty (valid but unhelpful)
```

### 5. Length Recommendations

- **Minimum:** 10 characters (be descriptive)
- **Optimal:** 50-100 characters (one concise sentence)
- **Maximum:** 200 characters (avoid long paragraphs)
- **Multi-line:** Supported but discouraged in UI

### 6. Common Errors

**Missing Description:**
```xml
<!-- INVALID: No Description key -->
<dict>
    <key>Identifier</key>
    <string>com.example.template</string>
    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
</dict>
```
**Result:** Template will not appear in chooser

**Wrong Type:**
```xml
<!-- INVALID: Array instead of String -->
<dict>
    <key>Description</key>
    <array>
        <string>First line</string>
        <string>Second line</string>
    </array>
</dict>
```
**Result:** Parsing error

### 7. Valid Examples

**File Template:**
```xml
<dict>
    <key>Description</key>
    <string>A Swift source file with basic structure.</string>
</dict>
```

**Project Template:**
```xml
<dict>
    <key>Description</key>
    <string>An iOS application with SwiftUI interface and MVVM architecture.</string>
</dict>
```

**With Special Characters:**
```xml
<dict>
    <key>Description</key>
    <string>A Core Data model with @NSManaged properties &amp; relationships.</string>
</dict>
```
Note: XML entities must be escaped in plist files.

### 8. Inheritance Behavior

Description is **inherited** from ancestors:

```xml
<!-- Parent template -->
<dict>
    <key>Identifier</key>
    <string>com.example.base</string>
    <key>Description</key>
    <string>Base template description</string>
</dict>

<!-- Child template (can override) -->
<dict>
    <key>Identifier</key>
    <string>com.example.child</string>
    <key>Ancestors</key>
    <array>
        <string>com.example.base</string>
    </array>
    <key>Description</key>
    <string>Child template description</string>  <!-- Overrides parent -->
</dict>
```

### 9. Serialization Rules

```swift
func serializeDescription(_ description: String) -> [String: Any] {
    return ["Description": description]
}
```

**Output:**
```xml
<key>Description</key>
<string>A SwiftUI view with MVVM architecture.</string>
```

**With XML Escaping:**
```swift
// Swift strings are automatically escaped when converting to plist
let description = "Template with <brackets> & ampersands"
// Output: Template with &lt;brackets&gt; &amp; ampersands
```

### 10. Localization Support

Descriptions can be localized using `.strings` files:

```
// en.lproj/TemplateInfo.strings
"TemplateDescription" = "A Swift source file.";

// fr.lproj/TemplateInfo.strings
"TemplateDescription" = "Un fichier source Swift.";
```

Reference in plist:
```xml
<key>Description</key>
<string>TemplateDescription</string>
```

### 11. Testing Requirements

```swift
func testDescriptionParsing() {
    // Valid cases
    let simple = ["Description": "A Swift file"]
    XCTAssertEqual(try parseDescription(simple), "A Swift file")

    let empty = ["Description": ""]
    XCTAssertEqual(try parseDescription(empty), "")  // Valid but discouraged

    let long = ["Description": String(repeating: "a", count: 500)]
    XCTAssertNoThrow(try parseDescription(long))  // No length limit

    // Invalid cases
    XCTAssertThrowsError(try parseDescription([:]))  // Missing
    XCTAssertThrowsError(try parseDescription(["Description": 123]))  // Wrong type
    XCTAssertThrowsError(try parseDescription(["Description": ["array"]]))  // Wrong type
}
```

### 12. Best Practices

**DO:**
- Be concise and clear
- Focus on what the template creates
- Mention key features or patterns
- Use proper grammar and punctuation
- Consider your audience (developers)

**DON'T:**
- Write novels (keep it brief)
- Use marketing language
- Include technical jargon without context
- Leave it empty (technically valid but unhelpful)
- Duplicate information from Summary field

### 13. Relationship with Summary Field

**Description:**
- Longer, more detailed (1-2 sentences)
- Shown in template chooser dialog
- Required field

**Summary:**
- Shorter, one-line (3-10 words)
- Shown as subtitle in chooser
- Optional field

Example:
```xml
<dict>
    <key>Summary</key>
    <string>MVVM SwiftUI View</string>

    <key>Description</key>
    <string>A SwiftUI view with an observable view model following MVVM architecture, including bindings and state management.</string>
</dict>
```

### 14. XcodeTemplateKit Implementation

**Model:**
```swift
struct TemplateMetadata: Codable {
    let identifier: String
    let kind: TemplateKind
    let description: String  // Required, non-optional
    let summary: String?     // Optional
}
```

**Parser:**
```swift
// PropertyListDecoder handles this automatically
let metadata = try PropertyListDecoder().decode(TemplateMetadata.self, from: data)
```

**Generator:**
```swift
func createPlist(from metadata: TemplateMetadata) -> [String: Any] {
    var plist: [String: Any] = [:]
    plist["Description"] = metadata.description
    return plist
}
```

### 15. Debugging

**Extract description:**
```bash
plutil -extract Description raw TemplateInfo.plist
```

**Find templates with specific description:**
```bash
find ~/Library/Developer/Xcode/Templates -name TemplateInfo.plist -exec sh -c 'desc=$(plutil -extract Description raw "{}" 2>/dev/null); if echo "$desc" | grep -q "SwiftUI"; then echo "{}: $desc"; fi' \;
```

**Validate XML escaping:**
```bash
# Check if special characters are properly escaped
plutil -extract Description xml1 TemplateInfo.plist
```

### 16. Character Encoding

**Supported Characters:**
- UTF-8 encoding
- All Unicode characters supported
- XML entities must be escaped in plist format

**Special Characters Requiring Escaping:**
```
& → &amp;
< → &lt;
> → &gt;
" → &quot;
' → &apos;
```

**Example:**
```xml
<key>Description</key>
<string>Creates a model with &lt;T&gt; generic type &amp; Codable conformance.</string>
```

### 17. Critical Rules Summary

1. ✅ **MUST** be present (required field)
2. ✅ **MUST** be String type
3. ✅ **CAN** be empty string (valid but discouraged)
4. ✅ **SHOULD** be 50-100 characters (readability)
5. ✅ **SHOULD** be descriptive and helpful
6. ✅ **CAN** be inherited from ancestors
7. ✅ **MUST** escape XML special characters in plist format
8. ✅ **SHOULD** differ from Summary field (if both present)
