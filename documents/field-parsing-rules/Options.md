# Options Field - Parsing Rules

## Overview
The `Options` field defines user input fields shown in the template wizard. Each option creates a variable that can be used in template placeholders.

## Type
**Array of Dictionaries** (optional)

## Parsing Rules

### 1. Validation Requirements
- **Optional** field (can be absent or empty array)
- **MUST** be Array type if present
- Each element **MUST** be a Dictionary
- Each option **MUST** have an `Identifier` key
- Option identifiers **SHOULD** be unique within template
- Referenced in templates as `___VARIABLE_identifier___`

### 2. Option Dictionary Structure

**Required Keys:**
- `Identifier` (String): Variable name used in placeholders
- `Name` (String): Label shown to user
- `Type` (String): Input control type

**Optional Keys:**
- `Description` (String): Help text shown below control
- `Default` (String/Boolean): Default value
- `Required` (Boolean): Whether input is required
- `Values` (Array): Choices for popup/combo types
- `RequiredOptions` (Dictionary): Dependencies on other options
- `NotPersisted` (Boolean): Don't save value between uses
- `FallbackHeader` (String): Section header in UI
- `Units` (Array): Sub-options for complex inputs

### 3. Option Types

**text**
- Single-line text input
- Default type if not specified
- Example: Class name, file name

**popup**
- Dropdown menu
- Requires `Values` array
- Example: Language choice (Swift/Objective-C)

**checkbox**
- Boolean toggle
- Default value is Boolean type
- Example: Include unit tests (yes/no)

**combo**
- Combination of text input and dropdown
- Requires `Values` array
- User can type or select
- Example: Deployment target version

**static**
- Display-only text (no input)
- Used for instructions or information
- Example: "Select options for your template:"

### 4. Parsing Implementation

```swift
struct TemplateOption: Codable {
    let identifier: String
    let name: String
    let description: String?
    let type: String
    let defaultValue: TemplateOptionValue?
    let required: Bool?
    let values: [String]?
    let requiredOptions: [String: String]?
    let notPersisted: Bool?

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case description = "Description"
        case type = "Type"
        case defaultValue = "Default"
        case required = "Required"
        case values = "Values"
        case requiredOptions = "RequiredOptions"
        case notPersisted = "NotPersisted"
    }
}

enum TemplateOptionValue: Codable {
    case string(String)
    case boolean(Bool)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let bool = try? container.decode(Bool.self) {
            self = .boolean(bool)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else {
            throw DecodingError.typeMismatch(
                TemplateOptionValue.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected String or Boolean"
                )
            )
        }
    }
}

func parseOptions(from plist: [String: Any]) -> [TemplateOption]? {
    guard let optionsArray = plist["Options"] as? [[String: Any]] else {
        return nil  // Optional field
    }

    return optionsArray.compactMap { optionDict in
        try? PropertyListDecoder().decode(TemplateOption.self, from: optionDict)
    }
}
```

### 5. Common Examples

**Text Input:**
```xml
<dict>
    <key>Identifier</key>
    <string>viewModelName</string>

    <key>Name</key>
    <string>ViewModel Class Name</string>

    <key>Description</key>
    <string>The name for your view model class</string>

    <key>Type</key>
    <string>text</string>

    <key>Default</key>
    <string>___VARIABLE_productName:identifier___ViewModel</string>

    <key>Required</key>
    <true/>
</dict>
```

**Checkbox:**
```xml
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
```

**Popup Menu:**
```xml
<dict>
    <key>Identifier</key>
    <string>language</string>

    <key>Name</key>
    <string>Language</string>

    <key>Type</key>
    <string>popup</string>

    <key>Default</key>
    <string>Swift</string>

    <key>Values</key>
    <array>
        <string>Swift</string>
        <string>Objective-C</string>
    </array>
</dict>
```

**Combo Box:**
```xml
<dict>
    <key>Identifier</key>
    <string>deploymentTarget</string>

    <key>Name</key>
    <string>Deployment Target</string>

    <key>Type</key>
    <string>combo</string>

    <key>Default</key>
    <string>17.0</string>

    <key>Values</key>
    <array>
        <string>17.0</string>
        <string>16.0</string>
        <string>15.0</string>
    </array>
</dict>
```

**Static Text:**
```xml
<dict>
    <key>Identifier</key>
    <string>info</string>

    <key>Type</key>
    <string>static</string>

    <key>Name</key>
    <string>Configure your template options below:</string>
</dict>
```

### 6. Option Dependencies

Use `RequiredOptions` to show/hide options based on other selections:

```xml
<!-- First option: checkbox -->
<dict>
    <key>Identifier</key>
    <string>useViewModel</string>
    <key>Type</key>
    <string>checkbox</string>
    <key>Name</key>
    <string>Include ViewModel</string>
    <key>Default</key>
    <true/>
</dict>

<!-- Second option: only shown if useViewModel is true -->
<dict>
    <key>Identifier</key>
    <string>viewModelName</string>
    <key>Type</key>
    <string>text</string>
    <key>Name</key>
    <string>ViewModel Name</string>

    <key>RequiredOptions</key>
    <dict>
        <key>useViewModel</key>
        <string>true</string>
    </dict>
</dict>
```

### 7. Default Value Evaluation

Default values can reference other variables:

```xml
<key>Default</key>
<string>___VARIABLE_productName:identifier___ViewModel</string>
```

This creates a dynamic default that updates when the user types.

**Common Default Patterns:**
```
___FILEBASENAME___ViewModel
___VARIABLE_productName:identifier___
___PACKAGENAME___
```

### 8. Template Usage

In template files, reference options using:
```swift
class ___VARIABLE_viewModelName___: ObservableObject {
    // Class implementation
}
```

**With Transformations:**
```swift
// Original: "My View Model"
___VARIABLE_viewModelName___                    // "My View Model"
___VARIABLE_viewModelName:identifier___         // "MyViewModel"
___VARIABLE_viewModelName:identifier:lower___   // "myviewmodel"
```

### 9. Inheritance Behavior

Options are **merged** from ancestors:
- Child template inherits parent options
- Child can override parent options (same Identifier)
- Child can add new options
- Arrays are merged, not replaced

```xml
<!-- Parent template -->
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>baseOption</string>
        <key>Type</key>
        <string>text</string>
    </dict>
</array>

<!-- Child template -->
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>childOption</string>
        <key>Type</key>
        <string>checkbox</string>
    </dict>
</array>

<!-- Effective Options: [baseOption, childOption] -->
```

### 10. Common Errors

**Missing Identifier:**
```xml
<!-- INVALID: No Identifier -->
<dict>
    <key>Name</key>
    <string>Option Name</string>
    <key>Type</key>
    <string>text</string>
</dict>
```
**Result:** Option ignored

**Wrong Type for Values:**
```xml
<!-- INVALID: Values should be array -->
<dict>
    <key>Identifier</key>
    <string>choice</string>
    <key>Type</key>
    <string>popup</string>
    <key>Values</key>
    <string>Value1, Value2</string>  <!-- Should be array -->
</dict>
```
**Result:** Parsing error

**popup/combo without Values:**
```xml
<!-- INVALID: popup requires Values array -->
<dict>
    <key>Identifier</key>
    <string>choice</string>
    <key>Type</key>
    <string>popup</string>
    <!-- Missing Values array -->
</dict>
```
**Result:** Empty dropdown

### 11. Testing Requirements

```swift
func testOptionsP parsing() {
    // Valid cases
    let textOption = [
        "Identifier": "name",
        "Name": "Class Name",
        "Type": "text",
        "Default": "MyClass"
    ]
    XCTAssertNoThrow(try parseOption(textOption))

    let checkboxOption = [
        "Identifier": "enabled",
        "Type": "checkbox",
        "Default": true
    ] as [String: Any]
    XCTAssertNoThrow(try parseOption(checkboxOption))

    // Invalid cases
    let missingIdentifier = ["Type": "text"]
    XCTAssertThrowsError(try parseOption(missingIdentifier))

    // Empty options array is valid
    let emptyOptions = ["Options": []] as [String: Any]
    XCTAssertNoThrow(try parseOptions(emptyOptions))

    // Missing Options key is valid (optional)
    let noOptions: [String: Any] = [:]
    XCTAssertNil(try parseOptions(noOptions))
}
```

### 12. XcodeTemplateKit Implementation

**Model:**
```swift
struct TemplateMetadata: Codable {
    let options: [TemplateOption]?
}

struct TemplateOption: Codable {
    let identifier: String
    let name: String
    let type: String
    let description: String?
    let defaultValue: TemplateOptionValue?
    let required: Bool?
    let values: [String]?
}
```

**Generator:**
```swift
func serializeOptions(_ options: [TemplateOption]?) -> [String: Any]? {
    guard let options = options, !options.isEmpty else {
        return nil
    }

    let optionsArray: [[String: Any]] = options.map { option in
        var dict: [String: Any] = [
            "Identifier": option.identifier,
            "Name": option.name,
            "Type": option.type
        ]

        if let description = option.description {
            dict["Description"] = description
        }

        if let defaultValue = option.defaultValue {
            dict["Default"] = defaultValue.propertyListValue
        }

        if let required = option.required {
            dict["Required"] = required
        }

        if let values = option.values {
            dict["Values"] = values
        }

        return dict
    }

    return ["Options": optionsArray]
}
```

### 13. Best Practices

**DO:**
- Use descriptive option names
- Provide helpful descriptions
- Set sensible defaults
- Use type transformations in defaults (`:identifier`)
- Group related options with FallbackHeader
- Mark inputs as Required when necessary

**DON'T:**
- Create options with duplicate identifiers
- Use special characters in identifiers (use camelCase)
- Forget Values array for popup/combo types
- Make everything required (be user-friendly)
- Use NotPersisted unless truly needed

### 14. Advanced: Complex Options with Units

For multi-part options:

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
        </dict>
        <dict>
            <key>Identifier</key>
            <string>macOS</string>
            <key>Name</key>
            <string>macOS</string>
        </dict>
    </array>
</dict>
```

### 15. Critical Rules Summary

1. ✅ **OPTIONAL** field (can be absent)
2. ✅ **MUST** be Array type if present
3. ✅ **Each option MUST** have Identifier
4. ✅ **popup/combo MUST** have Values array
5. ✅ **Default values CAN** reference other variables
6. ✅ **Options ARE** merged from ancestors
7. ✅ **Identifiers SHOULD** be camelCase
8. ✅ **Referenced as** `___VARIABLE_identifier___` in templates
9. ✅ **RequiredOptions** creates conditional visibility
10. ✅ **Type determines** UI control shown to user
