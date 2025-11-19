# Units Field - Parsing Rules

## Overview
The `Units` field is used within an Option to create multi-part or composite input controls. Each unit represents a sub-component of the parent option.

## Context
This is **not** a top-level TemplateInfo.plist field. It appears **inside** an Option dictionary.

## Type
**Array of Dictionaries** (optional within Option)

## Parsing Rules

### 1. Validation Requirements
- **Optional** field (can be absent from Option)
- **MUST** be Array type if present
- Each element **MUST** be a Dictionary
- Each unit dictionary has the same structure as top-level Options
- Used for creating grouped/composite input controls

### 2. Location in Hierarchy

```
TemplateInfo.plist
└── Options (Array)
    └── Option (Dictionary)
        ├── Identifier (String)
        ├── Name (String)
        ├── Type (String)
        └── Units (Array)          ← This field
            ├── Unit (Dictionary)
            │   ├── Identifier
            │   ├── Name
            │   ├── Type
            │   └── Default
            └── Unit (Dictionary)
                └── ...
```

### 3. Unit Dictionary Structure

Each unit can have:
- **Identifier** (String) - Variable name for this unit
- **Name** (String) - Label shown to user
- **Type** (String) - Input type (text, checkbox, popup, etc.)
- **Default** (String/Boolean) - Default value
- **Values** (Array) - For popup/combo types
- **Description** (String) - Help text
- **Required** (Boolean) - Whether required

### 4. Parsing Implementation

```swift
struct TemplateOption: Codable {
    let identifier: String
    let name: String
    let type: String
    let units: [TemplateOptionUnit]?

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case type = "Type"
        case units = "Units"
    }
}

struct TemplateOptionUnit: Codable {
    let identifier: String
    let name: String
    let type: String
    let defaultValue: TemplateOptionValue?
    let values: [String]?
    let description: String?
    let required: Bool?

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case type = "Type"
        case defaultValue = "Default"
        case values = "Values"
        case description = "Description"
        case required = "Required"
    }
}

func parseOptionUnits(from optionDict: [String: Any]) -> [TemplateOptionUnit]? {
    guard let unitsArray = optionDict["Units"] as? [[String: Any]] else {
        return nil  // Optional field
    }

    return unitsArray.compactMap { unitDict in
        try? PropertyListDecoder().decode(TemplateOptionUnit.self, from: unitDict)
    }
}
```

### 5. Common Use Cases

**Platform Selection:**
Create checkboxes for multiple platforms:
```xml
<dict>
    <key>Identifier</key>
    <string>platforms</string>

    <key>Name</key>
    <string>Supported Platforms</string>

    <key>Type</key>
    <string>composite</string>

    <key>Units</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>iOS</string>

            <key>Name</key>
            <string>iOS</string>

            <key>Type</key>
            <string>checkbox</string>

            <key>Default</key>
            <true/>
        </dict>

        <dict>
            <key>Identifier</key>
            <string>macOS</string>

            <key>Name</key>
            <string>macOS</string>

            <key>Type</key>
            <string>checkbox</string>

            <key>Default</key>
            <false/>
        </dict>

        <dict>
            <key>Identifier</key>
            <string>watchOS</string>

            <key>Name</key>
            <string>watchOS</string>

            <key>Type</key>
            <string>checkbox</string>

            <key>Default</key>
            <false/>
        </dict>
    </array>
</dict>
```

**Feature Flags:**
Multiple related boolean options:
```xml
<dict>
    <key>Identifier</key>
    <string>features</string>

    <key>Name</key>
    <string>Optional Features</string>

    <key>Type</key>
    <string>composite</string>

    <key>Units</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>includeTests</string>
            <key>Name</key>
            <string>Include Unit Tests</string>
            <key>Type</key>
            <string>checkbox</string>
            <key>Default</key>
            <true/>
        </dict>

        <dict>
            <key>Identifier</key>
            <string>includeUITests</string>
            <key>Name</key>
            <string>Include UI Tests</string>
            <key>Type</key>
            <string>checkbox</string>
            <key>Default</key>
            <false/>
        </dict>

        <dict>
            <key>Identifier</key>
            <string>includeDocumentation</string>
            <key>Name</key>
            <string>Include Documentation</string>
            <key>Type</key>
            <string>checkbox</string>
            <key>Default</key>
            <true/>
        </dict>
    </array>
</dict>
```

**Version Configuration:**
Multiple parts of a version number:
```xml
<dict>
    <key>Identifier</key>
    <string>version</string>

    <key>Name</key>
    <string>Version Number</string>

    <key>Type</key>
    <string>composite</string>

    <key>Units</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>major</string>
            <key>Name</key>
            <string>Major</string>
            <key>Type</key>
            <string>text</string>
            <key>Default</key>
            <string>1</string>
        </dict>

        <dict>
            <key>Identifier</key>
            <string>minor</string>
            <key>Name</key>
            <string>Minor</string>
            <key>Type</key>
            <string>text</string>
            <key>Default</key>
            <string>0</string>
        </dict>

        <dict>
            <key>Identifier</key>
            <string>patch</string>
            <key>Name</key>
            <string>Patch</string>
            <key>Type</key>
            <string>text</string>
            <key>Default</key>
            <string>0</string>
        </dict>
    </array>
</dict>
```

### 6. Template Usage

Units create variables accessible in templates:

```swift
// From platforms example:
#if ___VARIABLE_iOS___
import UIKit
#endif

#if ___VARIABLE_macOS___
import AppKit
#endif

// From version example:
let version = "___VARIABLE_major___.___VARIABLE_minor___.___VARIABLE_patch___"
```

### 7. UI Rendering

Units typically render as:
- **Grouped checkboxes** - For multiple boolean options
- **Radio group** - For mutually exclusive choices
- **Multi-part text fields** - For composite values (version numbers)
- **Checkbox list** - For feature selection

The exact rendering depends on Xcode's implementation and the parent Option's `Type`.

### 8. Relationship with Parent Option

**Parent Option Type:**
The parent option's `Type` field suggests how units should be rendered:
- `composite` - Generic composite control
- `checkboxList` - Multiple checkboxes
- `text` - Multi-part text input

**Parent Option Properties:**
Units inherit context from parent option but have their own:
- Identifier (scoped to parent)
- Name (displayed individually)
- Default (independent defaults)
- Required (independent requirements)

### 9. Variable Naming

Units create variables following this pattern:
```
___VARIABLE_{parentIdentifier}_{unitIdentifier}___
```

**Example:**
```xml
<!-- Parent option -->
<key>Identifier</key>
<string>features</string>

<!-- Unit -->
<key>Units</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>tests</string>
    </dict>
</array>

<!-- Template variable -->
___VARIABLE_features_tests___
```

However, in practice, unit identifiers are often used directly:
```
___VARIABLE_tests___
```

This depends on Xcode's implementation and template processing.

### 10. Common Errors

**Wrong Type:**
```xml
<!-- INVALID: Should be array -->
<key>Units</key>
<string>unit1</string>
```
**Result:** Parsing error

**Missing Unit Identifier:**
```xml
<!-- INVALID: Unit must have Identifier -->
<dict>
    <key>Units</key>
    <array>
        <dict>
            <key>Name</key>
            <string>Option Name</string>
            <!-- Missing Identifier -->
        </dict>
    </array>
</dict>
```
**Result:** Unit ignored or parsing error

**Nested Units:**
```xml
<!-- UNSUPPORTED: Units within Units -->
<dict>
    <key>Units</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>unit1</string>
            <key>Units</key>  <!-- Don't nest -->
            <array>...</array>
        </dict>
    </array>
</dict>
```
**Result:** Nested units ignored (not supported)

### 11. Testing Requirements

```swift
func testUnitsParsing() {
    // Valid cases
    let withUnits = [
        "Identifier": "parent",
        "Type": "composite",
        "Units": [
            [
                "Identifier": "unit1",
                "Name": "Unit 1",
                "Type": "checkbox",
                "Default": true
            ] as [String: Any],
            [
                "Identifier": "unit2",
                "Name": "Unit 2",
                "Type": "checkbox",
                "Default": false
            ] as [String: Any]
        ]
    ] as [String: Any]
    XCTAssertEqual(try parseOptionUnits(withUnits)?.count, 2)

    // Empty array is valid
    let emptyUnits = ["Units": []] as [String: Any]
    XCTAssertNotNil(try parseOptionUnits(emptyUnits))

    // Missing Units is valid (optional)
    let noUnits: [String: Any] = [:]
    XCTAssertNil(try parseOptionUnits(noUnits))

    // Invalid cases
    let wrongType = ["Units": "string"] as [String: Any]
    XCTAssertThrowsError(try parseOptionUnits(wrongType))
}
```

### 12. Inheritance Behavior

Units follow the same inheritance rules as Options:
- Units are **merged** from ancestors
- Child options can add more units
- Child options can override parent units (same Identifier)

```xml
<!-- Parent template -->
<dict>
    <key>Identifier</key>
    <string>platforms</string>
    <key>Units</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>iOS</string>
        </dict>
    </array>
</dict>

<!-- Child template -->
<dict>
    <key>Identifier</key>
    <string>platforms</string>
    <key>Units</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>macOS</string>
        </dict>
    </array>
</dict>

<!-- Effective Units: [iOS, macOS] -->
```

### 13. Serialization Rules

```swift
func serializeUnits(_ units: [TemplateOptionUnit]?) -> [String: Any]? {
    guard let units = units, !units.isEmpty else {
        return nil
    }

    let unitsArray: [[String: Any]] = units.map { unit in
        var dict: [String: Any] = [
            "Identifier": unit.identifier,
            "Name": unit.name,
            "Type": unit.type
        ]

        if let defaultValue = unit.defaultValue {
            dict["Default"] = defaultValue.propertyListValue
        }

        if let description = unit.description {
            dict["Description"] = description
        }

        if let required = unit.required {
            dict["Required"] = required
        }

        if let values = unit.values {
            dict["Values"] = values
        }

        return dict
    }

    return ["Units": unitsArray]
}
```

**Output:**
```xml
<key>Units</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>iOS</string>

        <key>Name</key>
        <string>iOS</string>

        <key>Type</key>
        <string>checkbox</string>

        <key>Default</key>
        <true/>
    </dict>
</array>
```

### 14. Best Practices

**DO:**
- Use units for logically related options
- Give units clear, distinct identifiers
- Provide sensible defaults for each unit
- Group related boolean flags together
- Use for platform/feature selection

**DON'T:**
- Nest units (not supported)
- Create too many units (keep UI manageable)
- Mix unrelated options in same units list
- Forget to set defaults for each unit
- Use overly complex unit structures

### 15. XcodeTemplateKit Implementation

**Model:**
```swift
struct TemplateOption: Codable {
    let identifier: String
    let name: String
    let type: String
    let units: [TemplateOptionUnit]?
}

struct TemplateOptionUnit: Codable {
    let identifier: String
    let name: String
    let type: String
    let defaultValue: TemplateOptionValue?
    let values: [String]?
    let description: String?
    let required: Bool?
}
```

**Parser:**
```swift
// Automatic via Codable nested decoding
let option = try PropertyListDecoder().decode(TemplateOption.self, from: optionDict)
// option.units is automatically parsed
```

**Generator:**
```swift
func createOptionDict(from option: TemplateOption) -> [String: Any] {
    var dict: [String: Any] = [
        "Identifier": option.identifier,
        "Name": option.name,
        "Type": option.type
    ]

    if let units = option.units, !units.isEmpty {
        dict["Units"] = units.map { unit in
            var unitDict: [String: Any] = [
                "Identifier": unit.identifier,
                "Name": unit.name,
                "Type": unit.type
            ]

            if let defaultValue = unit.defaultValue {
                unitDict["Default"] = defaultValue.propertyListValue
            }

            // Add other properties...

            return unitDict
        }
    }

    return dict
}
```

### 16. Real-World Examples

**iOS Project Template Platforms:**
Apple's iOS application template uses Units for platform selection:
```xml
<dict>
    <key>Identifier</key>
    <string>supportedDevices</string>
    <key>Name</key>
    <string>Devices</string>
    <key>Type</key>
    <string>popup</string>
    <key>Units</key>
    <array>
        <!-- iPhone, iPad, Universal options -->
    </array>
</dict>
```

**Framework Template:**
Platform support selection:
```xml
<dict>
    <key>Identifier</key>
    <string>platforms</string>
    <key>Name</key>
    <string>Platforms</string>
    <key>Units</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>iOS</string>
            <key>Name</key>
            <string>iOS</string>
            <key>Type</key>
            <string>checkbox</string>
            <key>Default</key>
            <true/>
        </dict>
        <!-- macOS, tvOS, watchOS... -->
    </array>
</dict>
```

### 17. Debugging

**Extract units from option:**
```bash
# Assuming platforms is the option identifier
plutil -extract "Options" json -o - TemplateInfo.plist | \
    jq '.[] | select(.Identifier == "platforms") | .Units'
```

**List all unit identifiers:**
```bash
plutil -convert json -o - TemplateInfo.plist | \
    jq '.Options[].Units[]?.Identifier' | sort | uniq
```

**Find options with units:**
```bash
plutil -convert json -o - TemplateInfo.plist | \
    jq '.Options[] | select(.Units != null) | .Identifier'
```

### 18. Critical Rules Summary

1. ✅ **OPTIONAL** field (within Option dictionary)
2. ✅ **MUST** be Array of Dictionaries if present
3. ✅ **Each unit MUST** have Identifier
4. ✅ **Each unit HAS** same structure as Option
5. ✅ **Used FOR** composite/grouped inputs
6. ✅ **Creates** individual template variables
7. ✅ **Nesting NOT** supported (units can't have units)
8. ✅ **Merged FROM** ancestors like Options
9. ✅ **Common FOR** platforms, features, multi-part values
10. ✅ **Rendered AS** grouped controls in Xcode UI
