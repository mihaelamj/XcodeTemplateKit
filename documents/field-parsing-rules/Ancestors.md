# Ancestors Field - Parsing Rules

## Overview
The `Ancestors` field enables template inheritance by specifying parent templates from which to inherit properties.

## Type
**Array of Strings** (optional)

## Parsing Rules

### 1. Validation Requirements
- **Optional** field (can be absent or empty array)
- **MUST** be Array type if present
- Each element **MUST** be a String
- Each string **MUST** be a valid template Identifier
- Parent templates **MUST** exist and be accessible
- Circular inheritance **MUST NOT** occur

### 2. Parsing Implementation

```swift
func parseAncestors(from plist: [String: Any]) -> [String]? {
    guard let ancestors = plist["Ancestors"] as? [String] else {
        return nil  // Optional field
    }

    return ancestors.filter { !$0.isEmpty }
}
```

### 3. Inheritance Mechanism

Templates inherit these properties from ancestors:
- **Options** (merged)
- **Definitions** (merged)
- **Nodes** (merged)
- **Platforms** (overridden)
- **Kind** (overridden)
- **Description** (overridden)
- **Summary** (overridden)
- **Build Settings** (merged, for project templates)

**Merge Behavior:**
- Arrays: Concatenated (parent + child)
- Dictionaries: Deep merged (child overrides parent keys)
- Scalars: Child overrides parent

### 4. Common Examples

**Single Ancestor:**
```xml
<dict>
    <key>Identifier</key>
    <string>com.example.swift-view</string>

    <key>Ancestors</key>
    <array>
        <string>com.apple.dt.unit.base</string>
    </array>

    <key>Description</key>
    <string>Swift view file</string>
</dict>
```

**Multiple Ancestors:**
```xml
<dict>
    <key>Identifier</key>
    <string>com.example.advanced-template</string>

    <key>Ancestors</key>
    <array>
        <string>com.apple.dt.unit.base</string>
        <string>com.example.custom-base</string>
    </array>
</dict>
```
Note: Later ancestors override earlier ones for scalar values.

**Inheritance Chain:**
```xml
<!-- Base template -->
<dict>
    <key>Identifier</key>
    <string>com.example.base</string>
    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
</dict>

<!-- Intermediate template -->
<dict>
    <key>Identifier</key>
    <string>com.example.intermediate</string>
    <key>Ancestors</key>
    <array>
        <string>com.example.base</string>
    </array>
    <key>Options</key>
    <array><!-- base options --></array>
</dict>

<!-- Final template -->
<dict>
    <key>Identifier</key>
    <string>com.example.final</string>
    <key>Ancestors</key>
    <array>
        <string>com.example.intermediate</string>
    </array>
    <!-- Inherits from intermediate which inherits from base -->
</dict>
```

### 5. Common Patterns

**Apple Base Templates:**
```xml
<key>Ancestors</key>
<array>
    <string>com.apple.dt.unit.base</string>
</array>
```
Most Xcode templates inherit from Apple's base template.

**Custom Base + Apple Base:**
```xml
<key>Ancestors</key>
<array>
    <string>com.apple.dt.unit.base</string>
    <string>com.company.templates.base</string>
</array>
```

**Project-Specific Base:**
```xml
<key>Ancestors</key>
<array>
    <string>com.company.project.base-view</string>
</array>
```

### 6. Inheritance Order

When multiple ancestors are specified:
1. Properties inherited from first ancestor
2. Properties from second ancestor merge/override
3. Properties from third ancestor merge/override
4. Current template properties merge/override

**Example:**
```xml
<key>Ancestors</key>
<array>
    <string>com.example.base1</string>   <!-- Applied first -->
    <string>com.example.base2</string>   <!-- Overrides base1 -->
</array>
```

### 7. Common Errors

**Non-Existent Ancestor:**
```xml
<!-- INVALID: Ancestor doesn't exist -->
<key>Ancestors</key>
<array>
    <string>com.example.nonexistent</string>
</array>
```
**Result:** Template fails to load (error in Console.app)

**Circular Inheritance:**
```xml
<!-- Template A -->
<dict>
    <key>Identifier</key>
    <string>com.example.a</string>
    <key>Ancestors</key>
    <array>
        <string>com.example.b</string>  <!-- Points to B -->
    </array>
</dict>

<!-- Template B -->
<dict>
    <key>Identifier</key>
    <string>com.example.b</string>
    <key>Ancestors</key>
    <array>
        <string>com.example.a</string>  <!-- Points to A -->
    </array>
</dict>
```
**Result:** Infinite loop, template fails to load

**Self-Reference:**
```xml
<!-- INVALID: Template cannot inherit from itself -->
<dict>
    <key>Identifier</key>
    <string>com.example.template</string>
    <key>Ancestors</key>
    <array>
        <string>com.example.template</string>
    </array>
</dict>
```
**Result:** Circular dependency error

**Wrong Type:**
```xml
<!-- INVALID: Should be array -->
<key>Ancestors</key>
<string>com.apple.dt.unit.base</string>
```
**Result:** Parsing error

### 8. Testing Requirements

```swift
func testAncestorsParsing() {
    // Valid cases
    let single = ["Ancestors": ["com.apple.dt.unit.base"]]
    XCTAssertEqual(try parseAncestors(single), ["com.apple.dt.unit.base"])

    let multiple = ["Ancestors": ["base1", "base2"]]
    XCTAssertEqual(try parseAncestors(multiple)?.count, 2)

    // Empty array is valid
    let empty = ["Ancestors": []] as [String: Any]
    XCTAssertNotNil(try parseAncestors(empty))

    // Missing Ancestors is valid (optional)
    let missing: [String: Any] = [:]
    XCTAssertNil(try parseAncestors(missing))

    // Invalid cases
    let wrongType = ["Ancestors": "com.apple.base"] as [String: Any]
    XCTAssertThrowsError(try parseAncestors(wrongType))
}
```

### 9. Inheritance Examples

**Options Merging:**
```xml
<!-- Parent -->
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>option1</string>
        <key>Type</key>
        <string>text</string>
    </dict>
</array>

<!-- Child inherits and adds -->
<key>Ancestors</key>
<array>
    <string>com.example.parent</string>
</array>
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>option2</string>
        <key>Type</key>
        <string>checkbox</string>
    </dict>
</array>

<!-- Effective Options: [option1, option2] -->
```

**Nodes Merging:**
```xml
<!-- Parent -->
<key>Nodes</key>
<array>
    <string>BaseFile.swift</string>
</array>

<!-- Child inherits and adds -->
<key>Ancestors</key>
<array>
    <string>com.example.parent</string>
</array>
<key>Nodes</key>
<array>
    <string>ExtendedFile.swift</string>
</array>

<!-- Effective Nodes: [BaseFile.swift, ExtendedFile.swift] -->
```

**Scalar Override:**
```xml
<!-- Parent -->
<key>Description</key>
<string>Parent description</string>

<!-- Child overrides -->
<key>Ancestors</key>
<array>
    <string>com.example.parent</string>
</array>
<key>Description</key>
<string>Child description</string>

<!-- Effective Description: "Child description" -->
```

### 10. Best Practices

**DO:**
- Use Apple's base templates as foundation
- Create company/project base templates for consistency
- Document inheritance relationships
- Keep inheritance chains shallow (2-3 levels max)
- Use descriptive identifier names for ancestors

**DON'T:**
- Create circular dependencies
- Inherit from templates you don't control (except Apple's)
- Create deep inheritance hierarchies (>4 levels)
- Reference non-existent templates
- Modify Apple's system templates

### 11. Serialization Rules

```swift
func serializeAncestors(_ ancestors: [String]?) -> [String: Any]? {
    guard let ancestors = ancestors, !ancestors.isEmpty else {
        return nil
    }

    return ["Ancestors": ancestors]
}
```

**Output:**
```xml
<key>Ancestors</key>
<array>
    <string>com.apple.dt.unit.base</string>
    <string>com.example.custom.base</string>
</array>
```

### 12. XcodeTemplateKit Implementation

**Model:**
```swift
struct TemplateMetadata: Codable {
    let ancestors: [String]?
}
```

**Parser:**
```swift
// Automatic via Codable
let metadata = try PropertyListDecoder().decode(TemplateMetadata.self, from: data)
```

**Generator:**
```swift
func createPlist(from metadata: TemplateMetadata) -> [String: Any] {
    var plist: [String: Any] = [:]

    if let ancestors = metadata.ancestors, !ancestors.isEmpty {
        plist["Ancestors"] = ancestors
    }

    return plist
}
```

### 13. Debugging Inheritance

**Check template inheritance:**
```bash
# Extract ancestors
plutil -extract Ancestors xml1 TemplateInfo.plist

# List all ancestors
plutil -convert json -o - TemplateInfo.plist | jq '.Ancestors[]'
```

**Find templates inheriting from specific ancestor:**
```bash
find ~/Library/Developer/Xcode/Templates -name TemplateInfo.plist -exec sh -c '
    if plutil -extract Ancestors xml1 -o - "{}" 2>/dev/null | grep -q "com.apple.dt.unit.base"; then
        echo "{}"
    fi
' \;
```

**Verify ancestor exists:**
```bash
# Check if ancestor template is installed
find /Applications/Xcode.app ~/Library/Developer/Xcode/Templates -name TemplateInfo.plist -exec sh -c '
    id=$(plutil -extract Identifier raw "{}" 2>/dev/null)
    if [ "$id" = "com.apple.dt.unit.base" ]; then
        echo "Found: {}"
    fi
' \;
```

### 14. Advanced: Abstract Templates

Create templates meant only for inheritance:

```xml
<dict>
    <key>Identifier</key>
    <string>com.company.base.abstract</string>

    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>

    <key>Concrete</key>
    <false/>  <!-- Don't show in chooser -->

    <key>Description</key>
    <string>Abstract base template</string>

    <key>Options</key>
    <array>
        <!-- Common options for all child templates -->
    </array>
</dict>
```

Child templates inherit from this but only children appear in UI.

### 15. Critical Rules Summary

1. ✅ **OPTIONAL** field (can be absent)
2. ✅ **MUST** be Array of Strings if present
3. ✅ **Each string MUST** be a valid template Identifier
4. ✅ **Ancestors MUST** exist when template loads
5. ✅ **NO circular** inheritance allowed
6. ✅ **Order MATTERS** (later overrides earlier)
7. ✅ **Arrays ARE** merged (concatenated)
8. ✅ **Dictionaries ARE** deep merged
9. ✅ **Scalars ARE** overridden (not merged)
10. ✅ **Used TO** share common configuration across templates
