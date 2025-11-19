# TemplateFields Documentation

**Purpose:** Reference documentation showing all possible values for every field found in Xcode template plist files.

## What is This Directory?

This directory contains a **comprehensive catalog of every property (field) that appears in Xcode's 146 template files**, organized for easy exploration and understanding.

### Directory Structure

```
TemplateFields/
├── README.md                     ← You are here
├── AllowedTypes/                 ← 26 templates that use "AllowedTypes" field
│   ├── App_Entity_value.plist    ← Just the AllowedTypes value
│   ├── App_Entity_complete.plist ← Full template plist for context
│   └── ...
├── Ancestors/                    ← 66 templates with inheritance
│   ├── Empty_value.plist
│   ├── Empty_complete.plist
│   └── ...
├── Description/                  ← 69 templates with descriptions
├── Options/                      ← 76 templates with user options
├── Platforms/                    ← 58 templates with platform specs
├── Targets/                      ← 45 templates with target configs
└── ... (30 more field directories)
```

## How It Works

### For Each Field Found in Xcode Templates:

1. **A directory is created** with the field name (e.g., `Description/`, `Options/`, `Platforms/`)
2. **Every template that uses that field** gets TWO files in that directory:
   - `TemplateName_value.plist` - Contains **only** that field's value
   - `TemplateName_complete.plist` - Contains the **full original** template plist

### Example: The "Description" Field

```
Description/
├── App_value.plist           ← Contains: {"Description": "This template creates..."}
├── App_complete.plist        ← Contains: Full App.xctemplate/TemplateInfo.plist
├── Aggregate_value.plist     ← Contains: {"Description": "This template allows..."}
├── Aggregate_complete.plist  ← Contains: Full Aggregate.xctemplate/TemplateInfo.plist
└── ... (69 total templates)
```

**What this tells you:**
- 69 templates have a "Description" field
- You can see **every possible description format** used by Apple
- You can see the **full context** of each template that uses descriptions

## Why This Exists

### Problem
Xcode templates use 33 different plist fields, but they're scattered across 146 template files. To understand what values are possible for each field, you'd have to:
1. Open 146 different template files
2. Search for the field you care about
3. Manually compare the different values
4. Try to understand the patterns

### Solution
This directory **automatically organizes** all fields so you can:
- **See all examples** of a field in one place
- **Compare different values** side-by-side
- **Understand patterns** in how Apple uses each field
- **Design proper types** for parsing these fields

## Common Use Cases

### Use Case 1: "What values can the Platforms field have?"

**Before this directory:**
```bash
# Manually search through 146 files
grep -r "Platforms" /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates
# ... manually inspect each result
```

**With this directory:**
```bash
# Look at all 58 examples in one place
ls documents/TemplateFields/Platforms/
# View any specific example
cat documents/TemplateFields/Platforms/App_value.plist
```

Result: You see all 58 templates use platforms, and can see every variation.

### Use Case 2: "How does the Options field work?"

**Look at the Options directory:**
```bash
ls documents/TemplateFields/Options/
# Shows 76 templates with Options

# Pick one to study
cat documents/TemplateFields/Options/Empty_value.plist
# See just the Options field

cat documents/TemplateFields/Options/Empty_complete.plist
# See how Options fits in the full template context
```

### Use Case 3: "What's the structure of the Targets field?"

```bash
# Look at all 45 Targets examples
ls documents/TemplateFields/Targets/

# Compare different target configurations
cat documents/TemplateFields/Targets/Empty_value.plist
cat documents/TemplateFields/Targets/App_value.plist
cat documents/TemplateFields/Targets/Generic_Extension_value.plist
```

You can see how Targets differs between app templates, extension templates, etc.

## Field Summary

| Directory | Template Count | What You Learn |
|-----------|---------------|----------------|
| **Kind** | 143 | Template type categories (all variations) |
| **Identifier** | 87 | Unique template IDs (project/package templates only) |
| **Options** | 76 | User-configurable options (all option types) |
| **Description** | 69 | Template descriptions (how Apple writes them) |
| **Ancestors** | 66 | Template inheritance chains |
| **Platforms** | 58 | Platform compatibility (iOS, macOS, tvOS, etc.) |
| **DefaultCompletionName** | 55 | Default file/class names |
| **Summary** | 52 | Short summaries (vs long descriptions) |
| **Image** | 49 | Template icons (SF Symbols, custom images) |
| **MainTemplateFile** | 49 | Primary template file paths |
| **Targets** | 45 | Target configurations (product types, settings) |
| **Definitions** | 43 | Variable definitions per file |
| **SortOrder** | 35 | Display ordering in Xcode |
| **SupportsSwiftPackage** | 26 | Swift Package Manager support flags |
| **AllowedTypes** | 26 | Allowed file types (UTIs) |
| **Nodes** | 24 | Template file node structures |
| **BuildableType** | 15 | Buildable target types |
| **Concrete** | 14 | Concrete vs base template flags |
| **HiddenFromLibrary** | 10 | Library visibility flags |
| **HiddenFromChooser** | 10 | Chooser visibility flags |
| **Project** | 8 | Project-level configurations |
| **OptionConstraints** | 8 | Option combination constraints |
| **TargetOnly** | 7 | Target-only flags |
| **Title** | 6 | Title overrides |
| **NameOfInitialFileForEditor** | 6 | Initial editor file |
| **Name** | 6 | Name overrides |
| **Icon** | 6 | Icon file names |
| **PackageType** | 5 | Swift Package types |
| **AssociatedTargetSpecification** | 5 | Target specifications |
| **SuppressTopLevelGroup** | 2 | Group suppression flags |
| **LocalizedByDefault** | 2 | Localization defaults |
| **Components** | 2 | Template components |
| **ProjectOnly** | 1 | Project-only flags |

## How to Use This Documentation

### 1. Exploring a Field

**Goal:** Understand what values the "Platforms" field can have

**Steps:**
```bash
# 1. Go to the field directory
cd documents/TemplateFields/Platforms/

# 2. List all examples
ls *_value.plist

# 3. Look at a few examples
cat App_value.plist
cat Generic_Extension_value.plist
cat Widget_Extension_value.plist

# 4. If you need context, check the complete plist
cat App_complete.plist
```

### 2. Implementing Parser Support

**Goal:** Add support for parsing the "Platforms" field

**Steps:**
```bash
# 1. Study all variations
cd documents/TemplateFields/Platforms/
cat *_value.plist | grep -A 10 "Platforms"

# 2. Identify the data type
# - Array of strings? Dictionary? String?
# - Required or optional?
# - Any special patterns?

# 3. Design your Swift type
# Based on what you see, create:
struct TemplateMetadata {
    let platforms: [String]?  // Array of platform IDs
}

# 4. Update parser to extract it
let platforms = plist["Platforms"] as? [String]
```

### 3. Finding Examples

**Goal:** Find templates that use both "Options" and "Platforms"

**Steps:**
```bash
# 1. Find templates in Options directory
ls documents/TemplateFields/Options/*_value.plist | \
  sed 's/_value.plist//' | \
  sed 's/.*\///' > /tmp/options_templates.txt

# 2. Find templates in Platforms directory
ls documents/TemplateFields/Platforms/*_value.plist | \
  sed 's/_value.plist//' | \
  sed 's/.*\///' > /tmp/platforms_templates.txt

# 3. Find intersection
comm -12 <(sort /tmp/options_templates.txt) <(sort /tmp/platforms_templates.txt)
```

### 4. Analyzing Field Patterns

**Goal:** Understand how Apple structures the "Image" field

**Steps:**
```bash
cd documents/TemplateFields/Image/

# Look at all variations
for file in *_value.plist; do
    echo "=== $file ==="
    cat "$file"
    echo ""
done

# You'll discover patterns like:
# - Some use SystemSymbolName (SF Symbols)
# - Some use IconName (custom images)
# - Format: {"Image": {"SystemSymbolName": "square.dashed"}}
```

## File Naming Convention

### Pattern
```
{TemplateName}_{type}.plist
```

### Components
- **TemplateName**: Name of the template (spaces and slashes converted to underscores)
- **type**: Either `value` or `complete`
  - `value`: Contains only the specific field
  - `complete`: Contains the entire original plist

### Examples
```
App_value.plist                      ← Just the field from "App" template
App_complete.plist                   ← Full plist from "App" template

Audio_Unit_Extension_value.plist     ← Spaces → underscores
Audio_Unit_Extension_complete.plist

Swift_Macro_value.plist
Swift_Macro_complete.plist
```

## Practical Examples

### Example 1: Understanding Template Inheritance (Ancestors Field)

**Scenario:** You want to understand how template inheritance works.

```bash
# 1. Go to Ancestors directory
cd documents/TemplateFields/Ancestors/

# 2. Look at a concrete template (e.g., App)
cat App_value.plist
```

**You see:**
```xml
<dict>
    <key>Ancestors</key>
    <array>
        <string>com.apple.dt.unit.applicationBase.SwiftUI</string>
    </array>
</dict>
```

**Then check another template:**
```bash
cat Empty_value.plist
```

**You see:**
```xml
<dict>
    <key>Ancestors</key>
    <array>
        <string>com.apple.dt.unit.base</string>
        <string>com.apple.dt.unit.base_Options</string>
    </array>
</dict>
```

**Learning:** Templates can inherit from one or multiple ancestors, and you now have 66 examples of different inheritance patterns.

### Example 2: Designing Option Parser (Options Field)

**Scenario:** You need to parse template options correctly.

```bash
# 1. Study options structure
cd documents/TemplateFields/Options/

# 2. Look at a simple example
cat Empty_value.plist
```

**You see:**
```xml
<dict>
    <key>Options</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>productName</string>
            <key>Name</key>
            <string>Product Name:</string>
            <key>Type</key>
            <string>text</string>
            <key>Required</key>
            <true/>
        </dict>
    </array>
</dict>
```

**Now check a complex example:**
```bash
cat App_value.plist
```

**You see options with:**
- Multiple choices (popup type)
- Default values
- Units (sub-options)
- Different types (text, popup, checkbox, etc.)

**Result:** You can design a complete `TemplateOptionJSON` struct that handles all cases.

### Example 3: Platform Compatibility (Platforms Field)

**Scenario:** You want to filter templates by platform.

```bash
cd documents/TemplateFields/Platforms/

# See what platforms exist
grep -h "string>" *_value.plist | sort -u
```

**You discover:**
```xml
<string>com.apple.platform.iphoneos</string>
<string>com.apple.platform.macosx</string>
<string>com.apple.platform.appletvos</string>
<string>com.apple.platform.watchos</string>
<string>com.apple.platform.xros</string>
```

**Now you know:** Platform IDs use reverse-DNS notation, and you can create an enum for them.

## Integration with TemplateParser

This documentation directly supports the development of the `TemplateParser` package:

### Current Implementation (9 fields)
```swift
public struct TemplateMetadata: Codable {
    public let name: String              // ✅ Implemented
    public let path: String              // ✅ Implemented
    public let kind: TemplateKind        // ✅ Implemented (using Kind/Identifier)
    public let ancestors: [TemplateKind]? // ✅ Implemented
    public let options: [TemplateOptionJSON] // ✅ Implemented
    // ... 5 more fields
}
```

### Future Implementation (Using This Documentation)
```swift
public struct TemplateMetadata: Codable {
    // Existing fields
    public let name: String
    public let kind: TemplateKind

    // NEW: Study Platforms/ directory
    public let platforms: [String]?

    // NEW: Study Description/ directory
    public let description: String?

    // NEW: Study MainTemplateFile/ directory
    public let mainTemplateFile: String?

    // NEW: Study Targets/ directory
    public let targets: [TargetConfiguration]?

    // NEW: Study Definitions/ directory
    public let definitions: [String: [String: Any]]?

    // ... add all 33 fields based on this documentation
}
```

### How to Use for Implementation

1. **Pick a field** to implement (e.g., "Platforms")
2. **Study the directory** (`documents/TemplateFields/Platforms/`)
3. **Analyze all examples** to understand the data structure
4. **Design the Swift type** based on what you see
5. **Update the parser** to extract it
6. **Write tests** using the examples as test cases

## Technical Details

### Extraction Method

All files were generated using:
```bash
# For each template in Xcode:
for plist in /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/**/TemplateInfo.plist; do
    # Extract each field
    for field in Kind Identifier Description Options ...; do
        # Create field-specific plist
        jq "{\"$field\": .$field}" | plutil -convert xml1 -o value.plist
        # Copy complete plist
        cp $plist complete.plist
    done
done
```

### File Format
- All files are **Apple XML plist format** (.plist)
- Can be opened with:
  - Xcode
  - Property List Editor
  - `plutil -p file.plist` (command line)
  - Any text editor

### Data Integrity
- ✅ **No modifications** - Values are exactly as they appear in Xcode
- ✅ **Complete coverage** - Every field from all 146 templates
- ✅ **Paired files** - Value + Complete always match the same source

## Maintenance

This documentation was **automatically generated** from Xcode 16.2's templates on **2025-11-19**.

### To Regenerate:
```bash
# Run the extraction script
/tmp/extract_field_both.sh

# Or manually:
cd /Volumes/Code/DeveloperExt/private/XcodeTemplateKit
rm -rf documents/TemplateFields
/path/to/extraction/script.sh
```

### When to Regenerate:
- ✅ When Xcode is updated (new templates or fields)
- ✅ When template format changes
- ✅ When adding support for new template sources

## Summary

**What:** Organized reference of all 33 plist fields found in Xcode's 146 templates

**Why:** Makes it easy to study, compare, and understand how Apple structures template metadata

**How:** Each field gets a directory with example values and complete context from every template that uses it

**For:** Developers implementing template parsers, analyzing template structures, or understanding Xcode's template system

---

**Total Files:** ~1,800 plist files (900 value + 900 complete)
**Total Directories:** 33 field directories
**Coverage:** 100% of Xcode 16.2 template fields
**Generated:** 2025-11-19
**Source:** `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates`
