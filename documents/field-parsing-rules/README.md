# Field Parsing Rules - Directory Overview

This directory contains detailed parsing rules for each TemplateInfo.plist field used in Xcode templates.

## Purpose

Each document provides:
- **Type specification** (String, Array, Dictionary, etc.)
- **Validation requirements** (required vs optional)
- **Parsing implementation** (Swift code examples)
- **Serialization rules** (generating plist output)
- **Common errors** and how to handle them
- **Testing requirements** (unit test examples)
- **Best practices** for using each field

## Field Categories

### Required Fields
These **must** be present in every template:
- [Identifier.md](Identifier.md) - Unique template identifier
- [Kind.md](Kind.md) - Template type (File/Project)
- [Description.md](Description.md) - User-facing description

### Structure Fields
Define what files are created:
- [Nodes.md](Nodes.md) - List of files to create
- [Definitions.md](Definitions.md) - Detailed file specifications

### Inheritance Fields
Enable template composition:
- [Ancestors.md](Ancestors.md) - Parent template references

### User Input Fields
Collect user preferences:
- [Options.md](Options.md) - Template wizard input fields

### Display Fields (Optional)
Control template appearance:
- Summary - Brief one-line summary
- SortOrder - Display order in chooser
- Platforms - Supported platforms
- AllowedTypes - Where template can be used

### Boolean Fields (Optional)
Control template behavior:
- Concrete - Show in template chooser
- HiddenFromChooser - Hide from UI
- HiddenFromLibrary - Hide from library
- LocalizedByDefault - Enable localization
- ProjectOnly - Restrict to project templates
- TargetOnly - Restrict to target templates
- SupportsSwiftPackage - Swift Package support

### Metadata Fields (Optional)
Additional information:
- Name - Template name
- MainTemplateFile - Primary file for editing
- DefaultCompletionName - Default file name
- NameOfInitialFileForEditor - File to open after creation
- Image - Template icon reference
- Icon - Alternative icon reference
- SuppressTopLevelGroup - Group behavior

### Complex Fields (Advanced)
For project templates:
- Components - Reusable template components
- Targets - Build target definitions
- Project - Project-level settings
- OptionConstraints - Advanced option validation

## Field Type Reference

### String Fields
- Identifier ✅ Required
- Kind ✅ Required
- Description ✅ Required
- Summary
- Name
- MainTemplateFile
- DefaultCompletionName
- NameOfInitialFileForEditor
- HiddenFromChooser (Objective-C boolean: "YES"/"NO")
- HiddenFromLibrary (Objective-C boolean: "YES"/"NO")

### Boolean Fields (Swift format: true/false)
- Concrete
- LocalizedByDefault
- ProjectOnly
- TargetOnly
- SupportsSwiftPackage
- SuppressTopLevelGroup

### Integer Fields
- SortOrder

### Array Fields
- Ancestors (Array of Strings)
- Nodes (Array of Strings)
- Options (Array of Dictionaries)
- Platforms (Array of Strings)
- AllowedTypes (Array of Strings)
- Targets (Array of Dictionaries)
- Components (Array of Dictionaries)

### Dictionary Fields
- Definitions (Dictionary of Dictionaries)
- Project (Dictionary)
- OptionConstraints (Dictionary)
- Image (Dictionary)
- Icon (Dictionary)

## Boolean Format Differences

### Objective-C Boolean Format
**Used by:** HiddenFromChooser, HiddenFromLibrary

```xml
<key>HiddenFromChooser</key>
<string>YES</string>

<key>HiddenFromLibrary</key>
<string>NO</string>
```

Values: "YES" or "NO" (String type)

### Swift Boolean Format
**Used by:** All other boolean fields

```xml
<key>Concrete</key>
<true/>

<key>LocalizedByDefault</key>
<false/>
```

Values: `<true/>` or `<false/>` (Boolean type)

## Parsing Priority

When implementing the TemplateParser:

1. **Phase 1: Required Fields**
   - Identifier ✅
   - Kind ✅
   - Description ✅

2. **Phase 2: Common Optional Fields**
   - Ancestors
   - Options
   - Nodes
   - Definitions

3. **Phase 3: Display & Metadata**
   - Summary
   - SortOrder
   - Platforms
   - AllowedTypes

4. **Phase 4: Boolean Flags**
   - Concrete
   - HiddenFromChooser
   - HiddenFromLibrary
   - LocalizedByDefault
   - etc.

5. **Phase 5: Complex Fields**
   - Components
   - Targets
   - Project
   - OptionConstraints

## Generation Priority

When implementing the TemplateGenerator:

1. **Always Include:**
   - Identifier
   - Kind
   - Description

2. **Include If Present:**
   - All optional fields that have non-null/non-empty values

3. **Field Order** (recommended for readability):
   ```
   Identifier
   Kind
   Ancestors
   Concrete
   Description
   Summary
   Platforms
   AllowedTypes
   SortOrder
   Options
   Definitions
   Nodes
   MainTemplateFile
   [Other optional fields]
   ```

## Testing Strategy

### Per-Field Testing
Each field should have tests for:
- ✅ Valid values (multiple examples)
- ✅ Invalid type (wrong data type)
- ✅ Missing value (if optional)
- ✅ Edge cases (empty string, empty array, etc.)
- ✅ Boundary values (very long strings, large arrays)

### Round-Trip Testing
```swift
// Parse plist → TemplateMetadata
let metadata = try TemplateParser.parse(plistData)

// TemplateMetadata → Generate plist
let generatedPlist = try TemplateGenerator.generate(metadata)

// Parse again
let reparsed = try TemplateParser.parse(generatedPlist)

// Should be identical
XCTAssertEqual(metadata, reparsed)
```

### Inheritance Testing
- Test ancestor merging for each field type
- Test override behavior
- Test multi-level inheritance chains

## Related Documentation

- [XcodeTemplateSystemReference.md](../XcodeTemplateSystemReference.md) - Complete template system guide
- [SessionContext.md](../MDs/SessionContext.md) - Current project status
- Apple's Xcode documentation (system templates in `/Applications/Xcode.app/`)

## Implementation Status

### Completed
- [x] Identifier parsing rules
- [x] Kind parsing rules
- [x] Description parsing rules
- [x] Options parsing rules
- [x] Nodes parsing rules
- [x] Ancestors parsing rules
- [x] Definitions parsing rules

### Pending
- [ ] Summary parsing rules
- [ ] Platforms parsing rules
- [ ] AllowedTypes parsing rules
- [ ] SortOrder parsing rules
- [ ] Concrete parsing rules
- [ ] HiddenFromChooser parsing rules
- [ ] HiddenFromLibrary parsing rules
- [ ] Name parsing rules
- [ ] MainTemplateFile parsing rules
- [ ] Components parsing rules (complex)
- [ ] Targets parsing rules (complex)
- [ ] Project parsing rules (complex)
- [ ] OptionConstraints parsing rules (complex)

## Usage in XcodeTemplateKit

These parsing rules directly inform:

1. **TemplateParser** implementation
   - Field decoding logic
   - Validation rules
   - Error handling

2. **TemplateGenerator** implementation
   - Field encoding logic
   - Plist serialization
   - Format compliance

3. **Test Generation**
   - Field-specific test cases
   - Validation test coverage
   - Round-trip verification

4. **Documentation**
   - API documentation
   - Usage examples
   - Migration guides

## Contributing New Field Rules

When documenting a new field, include:

1. Overview (1-2 sentences)
2. Type specification (with optionality)
3. Validation requirements (MUST/SHOULD/CAN)
4. Parsing implementation (Swift code)
5. Common examples (XML plist format)
6. Inheritance behavior (merged/overridden)
7. Common errors and results
8. Testing requirements (unit test examples)
9. Serialization rules (generation code)
10. Best practices (DO/DON'T lists)
11. XcodeTemplateKit implementation notes
12. Debugging commands (plutil, grep, find)
13. Critical rules summary (numbered checklist)

## Quick Reference

| Field | Type | Required | Inheritable | Format |
|-------|------|----------|-------------|--------|
| Identifier | String | ✅ | ❌ | Reverse DNS |
| Kind | String | ✅ | ✅ | Fixed values |
| Description | String | ✅ | ✅ | Free text |
| Ancestors | Array | ❌ | ❌ | Identifiers |
| Options | Array | ❌ | ✅ (merged) | Dictionaries |
| Nodes | Array | ❌ | ✅ (merged) | File paths |
| Definitions | Dictionary | ❌ | ✅ (deep merged) | File specs |
| Summary | String | ❌ | ✅ | Free text |
| SortOrder | Integer | ❌ | ✅ | 0-1000 |
| Concrete | Boolean | ❌ | ✅ | true/false |
| HiddenFromChooser | String | ❌ | ✅ | YES/NO |

## Notes

- All field names are **case-sensitive**
- XML special characters **must be escaped** in plist format
- Empty arrays/dictionaries are **valid but optional**
- Missing optional fields **should not** cause errors
- Inherited values **can be overridden** by child templates
