# Xcode Template Parsing Rules - Complete Reference

**Last Updated**: 2025-11-16
**Xcode Version Analyzed**: 16.0
**Total Templates Cataloged**: 146
**Template Kinds**: 11

---

## Table of Contents

1. [Overview](#overview)
2. [Template Kinds](#template-kinds)
3. [Template Structure](#template-structure)
4. [Variable Substitution Patterns](#variable-substitution-patterns)
5. [Transformations](#transformations)
6. [Metadata Structure](#metadata-structure)
7. [Template Inheritance](#template-inheritance)
8. [Processing Flow](#processing-flow)
9. [Special Cases and Edge Cases](#special-cases-and-edge-cases)
10. [Complete Examples](#complete-examples)

---

## Overview

### What Are Xcode Templates?

Xcode templates are `.xctemplate` bundle directories that contain:
1. **Metadata**: `TemplateInfo.plist` or `TemplateInfo.json` describing the template
2. **Template Files**: Files with variable placeholders (e.g., `___FILEBASENAME___.swift`)
3. **Resources**: Additional files, images, or assets

### Universal Parsing Rule

**ALL Xcode templates use the same variable substitution pattern**, regardless of template kind:

```
___VARIABLE_NAME___
```

This pattern is universal across:
- File templates (Swift, Objective-C, headers, resources)
- Project templates (apps, frameworks, extensions)
- Swift Package templates (libraries, macros, plugins)
- Test Plan templates (JSON/plist configuration)
- SiriKit templates (App Intents, entities, enumerations)
- Refactoring templates (IDE-internal)

---

## Template Kinds

### Complete Taxonomy (11 Kinds)

#### 1. `Xcode.Xcode3.ProjectTemplateUnitKind`

**Count**: 83 templates (56.8% of all templates)
**Purpose**: Full Xcode project creation
**User-Facing**: Yes
**Location**: `Project Templates/`

**Characteristics**:
- Creates complete `.xcodeproj` structure
- Supports inheritance via `Ancestors` array
- Complex `Options` configuration
- Multi-platform support (iOS, macOS, tvOS, watchOS, visionOS)
- Can contain multiple files and folders

**Example Templates**:
- Multiplatform App
- iOS App
- macOS App
- Framework
- Static Library
- UI Testing Bundle
- Unit Testing Bundle
- App Extension
- Safari Extension
- Widget Extension

**Metadata Keys**:
```plist
<key>Kind</key>
<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
<key>Identifier</key>
<string>com.apple.dt.unit.appTemplate</string>
<key>Ancestors</key>
<array>
    <string>com.apple.dt.unit.base</string>
</array>
<key>Options</key>
<array>...</array>
<key>Definitions</key>
<dict>...</dict>
```

---

#### 2. `Xcode.IDEFoundation.TextSubstitutionFileTemplateKind`

**Count**: 44 templates (30.1% of all templates)
**Purpose**: Standard file creation with text substitution
**User-Facing**: Yes
**Location**: `File Templates/`

**Characteristics**:
- Single file generation
- Variable substitution in file content and filename
- Simple structure (one template file)
- Common for source code files

**Example Templates**:
- Swift File
- SwiftUI View
- Objective-C File
- Header File
- C File
- C++ File
- Metal File

**Variable Pattern Example**:
```swift
//___FILEHEADER___

import Foundation

class ___FILEBASENAME___ {
    // Implementation
}
```

**Metadata Structure**:
```plist
<key>Kind</key>
<string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
<key>MainTemplateFile</key>
<string>___FILEBASENAME___.swift</string>
<key>AllowedTypes</key>
<array>
    <string>public.swift-source</string>
</array>
```

---

#### 3. `Xcode.IDEKit.TextSubstitutionFileTemplateKind`

**Count**: 7 templates (4.8% of all templates)
**Purpose**: File templates from IDE Kit framework
**User-Facing**: Yes
**Location**: `File Templates/Source/`

**Characteristics**:
- Functionally identical to `IDEFoundation.TextSubstitutionFileTemplateKind`
- Different framework namespace (IDEKit vs IDEFoundation)
- Same variable substitution rules
- Same metadata structure

**Example Templates**:
- Package Swift File
- Package Test Case

**Parsing Rule**: Treat identically to `IDEFoundation.TextSubstitutionFileTemplateKind`

---

#### 4. `Xcode.IDESwiftPackageSupport.PackageTemplateKind`

**Count**: 5 templates (3.4% of all templates)
**Purpose**: Swift Package Manager package creation
**User-Facing**: Yes
**Location**: `Project Templates/MultiPlatform/Other/`, `Project Templates/MultiPlatform/Library/`

**Characteristics**:
- Creates Swift Package with `Package.swift` manifest
- Simpler than project templates (no `.xcodeproj`)
- No `Ancestors` (flat inheritance model)
- Unique `PackageType` field

**Example Templates**:
- Library (static/dynamic)
- Swift Macro
- Command Plugin
- Build Tool Plugin
- Empty Package

**Unique Metadata**:
```plist
<key>Kind</key>
<string>Xcode.IDESwiftPackageSupport.PackageTemplateKind</string>
<key>PackageType</key>
<string>library</string>  <!-- or "macro", "plugin", etc. -->
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>testingSystem</string>
        <key>Values</key>
        <array>
            <string>None</string>
            <string>XCTest</string>
            <string>Swift Testing</string>
        </array>
    </dict>
</array>
```

**Package Types**:
- `library`: Traditional Swift library package
- `macro`: Swift Macro package
- `plugin`: Generic plugin package
- `command`: Command plugin (Swift Package Manager commands)
- `buildTool`: Build tool plugin

---

#### 5. `Xcode.IDETestPlanEditor.TestPlanTemplateKind`

**Count**: 1 template (0.7% of all templates)
**Purpose**: Test plan (`.xctestplan`) file creation
**User-Facing**: Yes
**Location**: `File Templates/MultiPlatform/Test/`

**Characteristics**:
- Generates JSON configuration file (not source code)
- Uses variable substitution for UUIDs
- Minimal metadata

**Template Content**:
```json
{
  "configurations" : [
    {
      "id" : "___TEST_PLAN_INITIAL_CONFIGURATION_UUID___",
      "name" : "Configuration 1",
      "options" : {}
    }
  ],
  "defaultOptions" : {
    "testTimeoutsEnabled" : true
  },
  "testTargets" : [],
  "version" : 1
}
```

**Variables Used**:
- `TEST_PLAN_INITIAL_CONFIGURATION_UUID`: UUID for initial configuration

**Parsing Rule**: Standard variable substitution applies, even though output is JSON

---

#### 6. `Xcode.IDEKit.RefactoringFileTemplateKind.NewSuperclass`

**Count**: 1 template (0.7% of all templates)
**Purpose**: Extract Superclass refactoring
**User-Facing**: No (IDE-internal)
**Location**: `File Templates/MultiPlatform/Source/`

**Characteristics**:
- Used by Xcode's refactoring engine
- Generates Objective-C superclass file
- Standard variable substitution
- Minimal metadata

**Template Content**:
```objc
//___FILEHEADER___

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

@end
```

**Variables Used**:
- `FILEHEADER`: Standard file header comment
- `FILEBASENAME`: Filename without extension
- `FILEBASENAMEASIDENTIFIER`: Filename as valid identifier

**Parsing Rule**: Treat as standard text substitution file template

---

#### 7-11. SiriKit Intent Builder Templates

**Combined Count**: 5 templates (3.4% of all templates)
**Purpose**: App Intents entities, enumerations, and actions
**User-Facing**: No (IDE-internal, hidden from chooser)
**Location**: `File Templates/SiriKit/`

##### 7. `Xcode.IDEIntentBuilderEditor.AppEntityTemplateKind`

**Template**: App Entity
**Purpose**: Create App Entity struct for Siri/Shortcuts integration

**Example Content**:
```swift
//___FILEHEADER___

import Foundation
___IMPORTS___

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
struct ___APP_ENTITY___: AppEntity {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(
        name: "___APP_ENTITY_DISPLAY_NAME___"
    )
    ___APP_ENTITY_PROPERTIES___

    struct ___APP_ENTITY_QUERY___: ___APP_ENTITY_QUERY_TYPE___ {
        func entities(for identifiers: [___APP_ENTITY___.ID]) async throws -> [___APP_ENTITY___] {
            return []
        }
        ___APP_ENTITY_STRING_QUERY_FUNCTION___

        func suggestedEntities() async throws -> [___APP_ENTITY___] {
            return []
        }
    }

    static var defaultQuery = ___APP_ENTITY_QUERY___()

    var id: String
    var displayString: String
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(displayString)")
    }
}
___AUXILIARY_CONTENT___
```

**Custom Variables**:
- `APP_ENTITY`: Entity struct name
- `APP_ENTITY_DISPLAY_NAME`: Human-readable name
- `APP_ENTITY_PROPERTIES`: Property definitions
- `APP_ENTITY_QUERY`: Query struct name
- `APP_ENTITY_QUERY_TYPE`: Query protocol conformance
- `APP_ENTITY_STRING_QUERY_FUNCTION`: Optional string query method
- `AUXILIARY_CONTENT`: Additional code (extensions, etc.)
- `IMPORTS`: Additional import statements

##### 8. `Xcode.IDEIntentBuilderEditor.AppEnumerationTemplateKind`

**Template**: App Enum
**Purpose**: Create App Enum for Siri/Shortcuts

##### 9. `Xcode.IDEIntentBuilderEditor.IntentTemplateKind`

**Template**: INIntent subclass
**Purpose**: Create custom intent

##### 10. `Xcode.IDEIntentBuilderEditor.LinkActionTemplateKind`

**Template**: Link action
**Purpose**: Create link action for App Shortcuts

##### 11. `Xcode.IDEIntentBuilderEditor.TransientAppEntityTemplateKind`

**Template**: Transient App Entity
**Purpose**: Create transient entity (not persisted)

**Shared Characteristics**:
- All hidden from template chooser (`HiddenFromLibrary: YES`, `HiddenFromChooser: YES`)
- Generated programmatically by Intent Builder UI
- Use standard variable substitution pattern
- Minimal metadata (no Options or Ancestors)

---

## Template Structure

### Bundle Layout

Every template is a directory with `.xctemplate` extension:

```
TemplateName.xctemplate/
├── TemplateInfo.plist       # Metadata (required)
├── ___FILEBASENAME___.swift # Template file (variable filename)
├── ___FILEBASENAME___.h     # Additional template file
├── Resources/               # Optional resources
│   └── Icon.png
└── Info.plist              # Optional project-level plist
```

### Filename Variable Substitution

Template filenames can contain variables:

```
___FILEBASENAME___.swift          → MyClass.swift
___FILEBASENAME___Tests.swift     → MyClassTests.swift
___PACKAGENAME___/Package.swift   → MyPackage/Package.swift
___VARIABLE_productName___.swift  → MyApp.swift
```

**Parsing Rule**: Process filename variables the same as content variables

---

## Variable Substitution Patterns

### Pattern Syntax

All variables use triple underscore delimiters:

```
___VARIABLE_NAME___
```

**Character Set**: Variable names can contain:
- Uppercase letters: `A-Z`
- Lowercase letters: `a-z`
- Numbers: `0-9`
- Underscores: `_`
- Colons: `:` (for transformations)

**Regex Pattern**: `___([A-Za-z_0-9:]+)___`

### Five Variable Types

#### 1. Simple Variables

**Pattern**: `___NAME___`

**Examples**:
```
___FILEBASENAME___        → "MyFile"
___PACKAGENAME___         → "MyPackage"
___PROJECTNAME___         → "MyProject"
___USERNAME___            → "johndoe"
___FULLUSERNAME___        → "John Doe"
___DATE___                → "11/16/25"
___YEAR___                → "2025"
___ORGANIZATIONNAME___    → "Acme Inc"
```

**Standard Variables** (always available):
- `FILEBASENAME`: Filename without extension
- `FILENAME`: Full filename with extension
- `PACKAGENAME`: Swift package name
- `PROJECTNAME`: Xcode project name
- `PROJECTNAMEASIDENTIFIER`: Project name as valid identifier
- `USERNAME`: Current user's username (from `NSUserName()`)
- `FULLUSERNAME`: Current user's full name (from `NSFullUserName()`)
- `DATE`: Current date (localized short format)
- `YEAR`: Current year (4 digits)
- `ORGANIZATIONNAME`: Organization name from Xcode preferences

**Resolution**: Look up value in variable context

---

#### 2. Macro Variables

**Pattern**: `___MACRONAME___`

**Definition**: Variables that expand to multi-line content

**Known Macros**:

##### `___FILEHEADER___`

Expands to file header comment:

```swift
//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
```

**Note**: `FILEHEADER` itself contains variables that need recursive expansion

##### `___COPYRIGHT___`

Expands to copyright notice:

```
Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
```

**Parsing Rule**: Macros expand to predefined templates that may contain other variables. Perform recursive variable substitution until no variables remain.

**Expansion Algorithm**:
1. Detect macro variable (check against known macro list)
2. Replace with macro template
3. Recursively process any variables in expanded template
4. Continue until fully resolved

---

#### 3. Transformed Variables

**Pattern**: `___NAME:transformation___` or `___NAME:transform1:transform2___`

**Syntax**:
- Variable name
- Colon separator `:`
- One or more transformations separated by colons

**Examples**:
```
___FILEBASENAME:identifier___                    → "My-File" → "My_File"
___PROJECTNAME:RFC1034Identifier___              → "My App" → "my-app"
___PACKAGENAME:bundleIdentifier___               → "My Package" → "my.package"
___FILEBASENAME:c99extidentifier___              → "My File!" → "My_File"
```

**Multi-transformation** (applied left-to-right):
```
___PROJECTNAME:identifier:uppercaseFirst___
```

**Resolution**:
1. Lookup base variable value
2. Apply first transformation
3. Apply second transformation to result
4. Continue for all transformations
5. Return final result

---

#### 4. Option Variables

**Pattern**: `___VARIABLE_optionName___` or `___VARIABLE_optionName:transformation___`

**Purpose**: Reference values from template `Options` array in metadata

**Examples**:
```plist
<!-- In TemplateInfo.plist -->
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>productName</string>
        <key>Default</key>
        <string>MyApp</string>
    </dict>
</array>
```

```swift
// In template file
let name = "___VARIABLE_productName___"
// → "MyApp" (from option default or user input)

let bundleID = "___VARIABLE_productName:bundleIdentifier___"
// → "myapp" (with transformation applied)
```

**Resolution**:
1. Extract option name (part after `VARIABLE_`)
2. Look up option value in context
3. Apply any transformations
4. Return result

**With Transformation**:
```
___VARIABLE_productName:identifier___
```
1. Get `productName` option value → "My App"
2. Apply `identifier` transform → "My_App"

---

#### 5. UUID Variables

**Pattern**: `___UUID:key___`

**Purpose**: Generate unique identifiers (UUIDs) that remain consistent within a template instantiation

**Examples**:
```
___UUID:PROJECT___                               → "A1B2C3D4-E5F6-7890-ABCD-EF1234567890"
___UUID:MAIN_GROUP___                            → "B2C3D4E5-F6A7-8901-BCDE-F12345678901"
___UUID:TEST_PLAN_INITIAL_CONFIGURATION___       → "C3D4E5F6-A7B8-9012-CDEF-123456789012"
```

**Key Property**: Same key always generates the same UUID within one template instantiation

**Usage Example** (in `.pbxproj` file):
```
___UUID:PROJECT___ /* Project object */ = {
    isa = PBXProject;
    mainGroup = ___UUID:MAIN_GROUP___;
    // ...
};

___UUID:MAIN_GROUP___ /* Main Group */ = {
    isa = PBXGroup;
    // ...
};
```

**Resolution**:
1. Check UUID cache for key
2. If exists, return cached UUID
3. If not, generate new UUID, cache it, return it

**Implementation**:
```swift
var uuidCache: [String: String] = [:]

mutating func resolveUUID(key: String) -> String {
    if let cached = uuidCache[key] {
        return cached
    }
    let uuid = UUID().uuidString
    uuidCache[key] = uuid
    return uuid
}
```

---

## Transformations

### Complete Transformation Reference

#### 1. `identifier`

**Purpose**: Convert to valid Swift/Objective-C identifier

**Rules**:
1. Remove all spaces
2. Replace hyphens `-` with underscores `_`
3. Keep only letters, numbers, and underscores
4. Remove any other characters

**Examples**:
```
"My File"       → "MyFile"
"my-class"      → "my_class"
"hello world!"  → "helloworld"
"123_abc"       → "123_abc"
"café"          → "caf"  // Non-ASCII removed
```

**Implementation**:
```swift
func identifier(_ value: String) -> String {
    return value
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "-", with: "_")
        .filter { $0.isLetter || $0.isNumber || $0 == "_" }
}
```

---

#### 2. `RFC1034Identifier`

**Purpose**: Convert to RFC 1034 compliant domain name component

**Rules**:
1. Convert to lowercase
2. Replace spaces with hyphens `-`
3. Replace underscores `_` with hyphens `-`
4. Keep only letters, numbers, hyphens, and dots
5. Remove any other characters

**Examples**:
```
"My App"        → "my-app"
"HelloWorld"    → "helloworld"
"my_package"    → "my-package"
"app v2.0"      → "app-v2.0"
"com.Test"      → "com.test"
```

**Use Case**: Bundle identifiers, domain names

**Implementation**:
```swift
func rfc1034Identifier(_ value: String) -> String {
    return value
        .lowercased()
        .replacingOccurrences(of: " ", with: "-")
        .replacingOccurrences(of: "_", with: "-")
        .filter { $0.isLetter || $0.isNumber || $0 == "-" || $0 == "." }
}
```

---

#### 3. `bundleIdentifier`

**Purpose**: Convert to bundle identifier format (reverse domain notation)

**Rules**:
1. Convert to lowercase
2. Replace spaces with dots `.`
3. Replace underscores `_` with dots `.`
4. Keep only letters, numbers, and dots
5. Remove any other characters

**Examples**:
```
"My App"        → "my.app"
"HelloWorld"    → "helloworld"
"my_package"    → "my.package"
"App-Pro"       → "apppro"  // Hyphens removed
"test 123"      → "test.123"
```

**Use Case**: Creating bundle identifiers from project names

**Full Example**:
```
com.___ORGANIZATIONNAME:bundleIdentifier___.___PROJECTNAME:bundleIdentifier___

If ORGANIZATIONNAME = "Acme Inc"
   PROJECTNAME = "My App"

Result: com.acme.inc.my.app
```

**Implementation**:
```swift
func bundleIdentifier(_ value: String) -> String {
    return value
        .lowercased()
        .replacingOccurrences(of: " ", with: ".")
        .replacingOccurrences(of: "_", with: ".")
        .filter { $0.isLetter || $0.isNumber || $0 == "." }
}
```

---

#### 4. `c99extidentifier`

**Purpose**: Convert to C99 extended identifier (C/C++/Objective-C)

**Rules**:
1. Replace spaces with underscores `_`
2. Keep only letters, numbers, and underscores
3. Remove any other characters
4. Do NOT lowercase (preserve case)

**Examples**:
```
"My File"       → "My_File"
"hello-world"   → "helloworld"
"Test123"       → "Test123"
"my variable!"  → "my_variable"
```

**Difference from `identifier`**:
- `c99extidentifier`: Replaces spaces with underscores
- `identifier`: Removes spaces entirely

**Implementation**:
```swift
func c99extidentifier(_ value: String) -> String {
    return value
        .replacingOccurrences(of: " ", with: "_")
        .filter { $0.isLetter || $0.isNumber || $0 == "_" }
}
```

---

### Transformation Chaining

**Pattern**: `___NAME:transform1:transform2:transform3___`

**Execution**: Left-to-right application

**Example**:
```
___PROJECTNAME:identifier:lowercased___

If PROJECTNAME = "My-Cool App!"
Step 1 (identifier):  "My-Cool App!" → "MyCoolApp"
Step 2 (lowercased):  "MyCoolApp" → "mycoolapp"
Result: "mycoolapp"
```

**Note**: Current implementation supports 4 transformations. Custom transformations like `lowercased`, `uppercased`, `capitalized` are not in base spec but could be added.

---

## Metadata Structure

### TemplateInfo.plist Format

Templates use property list (plist) format for metadata. Two formats exist:

1. **XML Format** (most common):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
          "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
    <!-- More keys... -->
</dict>
</plist>
```

2. **JSON Format** (legacy/alternate):
```json
{
    "Kind": "Xcode.IDEIntentBuilderEditor.AppEntityTemplateKind",
    "Description": "An App Entity."
}
```

### Universal Metadata Keys

Present in all templates:

#### `Kind` (Required)

**Type**: String
**Purpose**: Identifies template type
**Values**: One of 11 template kinds (see [Template Kinds](#template-kinds))

```plist
<key>Kind</key>
<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
```

#### `Description` (Optional)

**Type**: String
**Purpose**: Human-readable description shown in template chooser

```plist
<key>Description</key>
<string>A new Swift file with Foundation import.</string>
```

#### `Summary` (Optional)

**Type**: String
**Purpose**: Short summary (shown as subtitle in chooser)

```plist
<key>Summary</key>
<string>A Swift file</string>
```

#### `Image` (Optional)

**Type**: Dictionary
**Purpose**: Template icon

**Subkeys**:
- `SystemSymbolName`: SF Symbols name (macOS 11+)
- `FileTypeIcon`: File type identifier for icon

```plist
<key>Image</key>
<dict>
    <key>SystemSymbolName</key>
    <string>doc.text</string>
</dict>
```

---

### File Template Keys

Used by `TextSubstitutionFileTemplateKind`:

#### `MainTemplateFile` (Required for file templates)

**Type**: String
**Purpose**: Filename of primary template file (can contain variables)

```plist
<key>MainTemplateFile</key>
<string>___FILEBASENAME___.swift</string>
```

#### `AllowedTypes` (Optional)

**Type**: Array of Strings
**Purpose**: Uniform Type Identifiers (UTIs) for file types

```plist
<key>AllowedTypes</key>
<array>
    <string>public.swift-source</string>
    <string>public.objective-c-source</string>
</array>
```

**Common UTIs**:
- `public.swift-source`: Swift files
- `public.objective-c-source`: Objective-C `.m` files
- `public.c-header`: C/Objective-C `.h` files
- `public.c-source`: C files
- `public.c-plus-plus-source`: C++ files

---

### Project Template Keys

Used by `ProjectTemplateUnitKind`:

#### `Identifier` (Required for project templates)

**Type**: String
**Purpose**: Unique template identifier (reverse domain notation)

```plist
<key>Identifier</key>
<string>com.apple.dt.unit.appTemplate</string>
```

#### `Ancestors` (Optional)

**Type**: Array of Strings
**Purpose**: Parent template identifiers for inheritance

```plist
<key>Ancestors</key>
<array>
    <string>com.apple.dt.unit.base</string>
    <string>com.apple.dt.unit.iOS</string>
</array>
```

**Inheritance Rules**:
- Templates inherit all settings from ancestors
- Child template values override ancestor values
- Ancestors processed in array order (later overrides earlier)
- Recursive inheritance supported (ancestors can have ancestors)

#### `Definitions` (Optional)

**Type**: Dictionary
**Purpose**: Build settings, target configurations, file references

```plist
<key>Definitions</key>
<dict>
    <key>AppDelegate.swift</key>
    <dict>
        <key>Path</key>
        <string>AppDelegate.swift</string>
        <key>TargetIndices</key>
        <array><integer>0</integer></array>
    </dict>
</dict>
```

---

### Swift Package Template Keys

Used by `PackageTemplateKind`:

#### `PackageType` (Required for package templates)

**Type**: String
**Purpose**: Type of Swift Package to create

**Values**:
- `library`: Standard library package
- `macro`: Swift Macro package
- `plugin`: Generic plugin package
- `command`: Command plugin
- `buildTool`: Build tool plugin
- `empty`: Empty package (no initial targets)

```plist
<key>PackageType</key>
<string>library</string>
```

---

### Options Array

**Type**: Array of Dictionaries
**Purpose**: User-configurable template parameters

**Used By**: Project templates, Package templates

**Structure**:
```plist
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>productName</string>

        <key>Name</key>
        <string>Product Name:</string>

        <key>Description</key>
        <string>The name of the product</string>

        <key>Type</key>
        <string>text</string>  <!-- or "popup", "checkbox" -->

        <key>Default</key>
        <string>MyApp</string>

        <key>Required</key>
        <true/>

        <key>SortOrder</key>
        <integer>100</integer>
    </dict>
</array>
```

#### Option Types

##### 1. Text Input (`type: text`)

```plist
<dict>
    <key>Identifier</key>
    <string>productName</string>
    <key>Type</key>
    <string>text</string>
    <key>Default</key>
    <string>MyProduct</string>
</dict>
```

**Usage**: `___VARIABLE_productName___`

##### 2. Popup/Dropdown (`type: popup`)

```plist
<dict>
    <key>Identifier</key>
    <string>language</string>
    <key>Type</key>
    <string>popup</string>
    <key>Values</key>
    <array>
        <string>Swift</string>
        <string>Objective-C</string>
    </array>
    <key>Default</key>
    <string>Swift</string>
</dict>
```

**Usage**: `___VARIABLE_language___` → "Swift" or "Objective-C"

##### 3. Checkbox (`type: checkbox`)

```plist
<dict>
    <key>Identifier</key>
    <string>includeTests</string>
    <key>Type</key>
    <string>checkbox</string>
    <key>Default</key>
    <string>true</string>
</dict>
```

**Usage**: `___VARIABLE_includeTests___` → "true" or "false"

**Conditional Inclusion**:
```plist
<key>Definitions</key>
<dict>
    <key>Tests/</key>
    <dict>
        <key>RequiredOptions</key>
        <dict>
            <key>includeTests</key>
            <string>true</string>
        </dict>
    </dict>
</dict>
```

---

### Visibility Flags

#### `HiddenFromLibrary`

**Type**: Boolean
**Purpose**: Hide from template library in Xcode

```plist
<key>HiddenFromLibrary</key>
<true/>
```

#### `HiddenFromChooser`

**Type**: Boolean
**Purpose**: Hide from template chooser UI

```plist
<key>HiddenFromChooser</key>
<true/>
```

**Usage**: SiriKit templates are hidden (IDE-internal only)

---

## Template Inheritance

### Inheritance Mechanism

Project templates support inheritance via the `Ancestors` array.

**Example Hierarchy**:
```
com.apple.dt.unit.base (base template)
    └── com.apple.dt.unit.multiplatformBase
            └── com.apple.dt.unit.appTemplate (specific app template)
```

**TemplateInfo.plist**:
```plist
<key>Identifier</key>
<string>com.apple.dt.unit.appTemplate</string>
<key>Ancestors</key>
<array>
    <string>com.apple.dt.unit.multiplatformBase</string>
</array>
```

### Resolution Algorithm

1. **Load child template** metadata
2. **For each ancestor** (in order):
   a. Load ancestor metadata
   b. Recursively load ancestor's ancestors
3. **Merge metadata** (child overrides parent):
   a. Start with deepest ancestor
   b. Apply each level's metadata
   c. Child values take precedence
4. **Result**: Fully resolved template with all inherited properties

### Merging Rules

**Scalars** (String, Boolean, Integer):
- Child value overrides parent

**Arrays**:
- Child array replaces parent array (no merging)
- Exception: `RequiredOptions` arrays are merged

**Dictionaries**:
- Merge recursively
- Child keys override parent keys
- Keys only in parent are preserved

**Example**:
```plist
<!-- Parent -->
<key>Definitions</key>
<dict>
    <key>PRODUCT_NAME</key>
    <string>MyApp</string>
    <key>SWIFT_VERSION</key>
    <string>5.0</string>
</dict>

<!-- Child -->
<key>Definitions</key>
<dict>
    <key>PRODUCT_NAME</key>
    <string>CustomApp</string>
</dict>

<!-- Merged Result -->
<key>Definitions</key>
<dict>
    <key>PRODUCT_NAME</key>
    <string>CustomApp</string>  <!-- Overridden -->
    <key>SWIFT_VERSION</key>
    <string>5.0</string>         <!-- Inherited -->
</dict>
```

---

## Processing Flow

### Complete Template Instantiation Algorithm

#### Phase 1: Template Discovery

1. **Locate template** bundle (`.xctemplate`)
2. **Read metadata** (`TemplateInfo.plist`)
3. **Identify template kind** (from `Kind` field)
4. **Load ancestors** (if project template)
5. **Merge metadata** (resolve inheritance)

#### Phase 2: Context Preparation

1. **Collect user inputs**:
   - Product name
   - Organization name
   - Bundle identifier prefix
   - Option values
2. **Build variable context**:
   ```swift
   var context = VariableContext()
   context.projectName = userInput.productName
   context.organizationName = userInput.organization
   context.userName = NSUserName()
   context.fullUserName = NSFullUserName()
   context.date = formatDate(Date())
   context.year = String(Calendar.current.component(.year, from: Date()))
   context.options = userInput.optionValues
   ```
3. **Initialize UUID cache** (empty dictionary)

#### Phase 3: File Discovery

1. **Find all template files** in bundle:
   ```
   ___FILEBASENAME___.swift
   ___FILEBASENAME___Tests.swift
   Resources/Info.plist
   ```
2. **Build file list** with source and destination paths

#### Phase 4: Variable Substitution

For each file:

1. **Process filename**:
   ```swift
   let processedFilename = processVariables(
       in: originalFilename,
       context: context
   )
   ```

2. **Read file content** (as UTF-8 text)

3. **Tokenize content**:
   - Split into text and variable tokens
   - Identify variable types

4. **Resolve variables**:
   ```swift
   for token in tokens {
       switch token {
       case .text(let str):
           output.append(str)
       case .variable(let varToken):
           let value = resolve(varToken, context: context)
           output.append(value)
       }
   }
   ```

5. **Write processed content** to destination

#### Phase 5: Post-Processing

1. **Create directories** (from `Definitions`)
2. **Add files to project** (update `.pbxproj`)
3. **Configure build settings**
4. **Add dependencies** (if applicable)

### Variable Resolution Algorithm

```swift
func resolve(_ token: VariableToken, context: inout VariableContext) -> String {
    switch token {
    case .simple(let name):
        return context.getValue(for: name)

    case .macro(let name):
        let macroTemplate = getMacroTemplate(for: name)
        // Recursive: macros can contain variables
        return processVariables(in: macroTemplate, context: &context)

    case .transformed(let name, let transforms):
        var value = context.getValue(for: name)
        for transform in transforms {
            value = transform.apply(to: value)
        }
        return value

    case .option(let name, let transforms):
        guard var value = context.options[name] else {
            return ""  // or default value
        }
        for transform in transforms {
            value = transform.apply(to: value)
        }
        return value

    case .uuid(let key):
        return context.resolveUUID(for: key)
    }
}
```

### Recursive Expansion

**Macros require recursive expansion** because they can contain variables:

```swift
// FILEHEADER macro template
let fileHeaderTemplate = """
//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
"""

// When resolving ___FILEHEADER___:
// 1. Replace ___FILEHEADER___ with fileHeaderTemplate
// 2. Process ___FILENAME___ → "MyFile.swift"
// 3. Process ___PROJECTNAME___ → "MyApp"
// 4. Process ___FULLUSERNAME___ → "John Doe"
// 5. Process ___DATE___ → "11/16/25"
// 6. Process ___COPYRIGHT___ → Expand COPYRIGHT macro
// 7. In COPYRIGHT, process ___YEAR___ → "2025"
// 8. In COPYRIGHT, process ___ORGANIZATIONNAME___ → "Acme Inc"
// Final result: Fully expanded header
```

**Recursion Limit**: Implement maximum depth (e.g., 10 levels) to prevent infinite loops from circular macro definitions.

---

## Special Cases and Edge Cases

### 1. Multiple Variable Occurrences

**Same variable appears multiple times**:

```swift
class ___FILEBASENAME___ {
    func ___FILEBASENAME___Method() {}
}
```

**Resolution**: Resolve once, reuse value

```swift
// Efficient: cache resolved values
var resolvedValues: [String: String] = [:]

func resolve(_ name: String) -> String {
    if let cached = resolvedValues[name] {
        return cached
    }
    let value = computeValue(for: name)
    resolvedValues[name] = value
    return value
}
```

### 2. UUID Consistency

**Same UUID key must generate same UUID within one instantiation**:

```
___UUID:PROJECT___ = "A1B2C3D4..."
// Later in same file:
___UUID:PROJECT___ = "A1B2C3D4..."  // Same value!
```

**Implementation**: UUID cache (see [UUID Variables](#5-uuid-variables))

### 3. Empty Option Values

**User provides empty string for option**:

```plist
<key>Identifier</key>
<string>organizationName</string>
<key>Default</key>
<string></string>  <!-- Empty default -->
```

**Resolution**: Use empty string (don't skip)

```swift
let orgName = context.options["organizationName"] ?? ""
// orgName = "" (valid)
```

### 4. Missing Variables

**Variable not found in context**:

```swift
___UNKNOWN_VARIABLE___
```

**Behavior Options**:
1. **Leave as-is** (preserve variable marker)
2. **Replace with empty string**
3. **Throw error** (strict mode)

**Recommendation**: Throw error in strict mode, empty string otherwise

### 5. Variables in Strings

**Variables inside quoted strings** (e.g., in plist files):

```xml
<key>CFBundleName</key>
<string>___PRODUCTNAME___</string>
```

**Resolution**: Standard variable substitution (quotes don't affect parsing)

### 6. Escaped Underscores

**What if file needs literal `___`?**

**Problem**: No escape mechanism in Xcode template format

**Solution**: Avoid triple underscores in literal text, or use post-processing

### 7. Case Sensitivity

**Variable names are case-sensitive**:

```
___FILEBASENAME___ ≠ ___filebasename___
___PROJECTNAME___ ≠ ___ProjectName___
```

**Rule**: Preserve exact case when looking up variables

### 8. Whitespace in Variables

**Whitespace inside variable delimiters is NOT allowed**:

```
✅ ___FILEBASENAME___
❌ ___ FILEBASENAME ___
❌ ___FILEBASENAME ___
```

**Pattern**: `___[A-Za-z_0-9:]+___` (no spaces)

### 9. Partial Matches

**Incomplete variable markers**:

```
__FILEBASENAME___   → Not a variable (only 2 underscores at start)
___FILEBASENAME__   → Not a variable (only 2 underscores at end)
___FILE BASE___     → Not a variable (space inside)
```

**Rule**: Require exactly 3 underscores on each side, no spaces

### 10. Transformation Failures

**What if transformation produces invalid result?**

Example:
```
___PROJECTNAME:identifier___
// If PROJECTNAME = "123" (starts with number)
// Result: "123" (invalid Swift identifier)
```

**Options**:
1. **Prefix with underscore**: `_123`
2. **Throw validation error**
3. **Return as-is** (let compiler catch error)

**Recommendation**: Let transformations return as-is (user can fix)

### 11. Circular Macro References

**If macro A references macro B, and B references A**:

```
MACRO_A = "Start ___MACRO_B___ End"
MACRO_B = "Middle ___MACRO_A___ Done"
```

**Protection**: Maximum recursion depth

```swift
func expand(macro: String, depth: Int = 0) -> String {
    guard depth < 10 else {
        throw TemplateError.recursionLimitExceeded
    }
    // Process macro
    return processVariables(in: macro, depth: depth + 1)
}
```

### 12. Binary Files

**Binary files in template** (images, compiled assets):

**Rule**: Do NOT process binary files for variable substitution

**Detection**:
```swift
let binaryExtensions = ["png", "jpg", "pdf", "icns", "nib", "storyboardc"]
if binaryExtensions.contains(fileExtension) {
    // Copy as-is, no substitution
}
```

### 13. Plist Variables

**Variables in plist values**:

```xml
<key>CFBundleIdentifier</key>
<string>com.___ORGANIZATIONNAME:bundleIdentifier___.___PRODUCTNAME:bundleIdentifier___</string>
```

**Resolution**: Process plist as text, then parse

**Order**:
1. Read plist file as text
2. Perform variable substitution
3. Write to destination
4. Destination will be valid plist

---

## Complete Examples

### Example 1: Swift File Template

**Template**: `File Templates/MultiPlatform/Source/Swift File.xctemplate`

**Metadata** (`TemplateInfo.plist`):
```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
          "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>
    <key>Summary</key>
    <string>An empty Swift file</string>
    <key>Description</key>
    <string>An empty Swift file with Foundation import</string>
    <key>DefaultCompletionName</key>
    <string>File</string>
    <key>MainTemplateFile</key>
    <string>___FILEBASENAME___.swift</string>
    <key>AllowedTypes</key>
    <array>
        <string>public.swift-source</string>
    </array>
</dict>
</plist>
```

**Template File** (`___FILEBASENAME___.swift`):
```swift
//___FILEHEADER___

import Foundation
```

**Context**:
```swift
fileName: "MyClass.swift"
fileBaseName: "MyClass"
projectName: "MyApp"
userName: "johndoe"
fullUserName: "John Doe"
date: "11/16/25"
year: "2025"
organizationName: "Acme Inc"
```

**Step 1**: Process filename
```
___FILEBASENAME___.swift
→ MyClass.swift
```

**Step 2**: Expand `___FILEHEADER___` macro
```swift
//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
```

**Step 3**: Resolve variables in expanded macro
```swift
//
//  MyClass.swift
//  MyApp
//
//  Created by John Doe on 11/16/25.
//  Copyright © 2025 Acme Inc. All rights reserved.
//

import Foundation
```

**Final Output**: `MyClass.swift`

---

### Example 2: App Project Template

**Template**: `Project Templates/MultiPlatform/Application/App.xctemplate`

**Metadata** (`TemplateInfo.plist`):
```plist
<dict>
    <key>Kind</key>
    <string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
    <key>Identifier</key>
    <string>com.apple.dt.unit.appTemplate</string>
    <key>Ancestors</key>
    <array>
        <string>com.apple.dt.unit.multiplatformBase</string>
    </array>
    <key>Options</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>productName</string>
            <key>Name</key>
            <string>Product Name:</string>
            <key>Type</key>
            <string>text</string>
            <key>Default</key>
            <string>MyApp</string>
        </dict>
        <dict>
            <key>Identifier</key>
            <string>bundleIdentifierPrefix</string>
            <key>Name</key>
            <string>Organization Identifier:</string>
            <key>Type</key>
            <string>text</string>
            <key>Default</key>
            <string>com.example</string>
        </dict>
    </array>
</dict>
```

**Template File** (`Info.plist`):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
          "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleIdentifier</key>
    <string>___VARIABLE_bundleIdentifierPrefix___.___VARIABLE_productName:bundleIdentifier___</string>
    <key>CFBundleName</key>
    <string>___VARIABLE_productName___</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
</dict>
</plist>
```

**User Input**:
```
productName: "My Cool App"
bundleIdentifierPrefix: "com.acme"
```

**Variable Resolution**:
```
___VARIABLE_bundleIdentifierPrefix___
→ "com.acme"

___VARIABLE_productName:bundleIdentifier___
→ "My Cool App" (option value)
→ "my.cool.app" (after bundleIdentifier transformation)

___VARIABLE_productName___
→ "My Cool App"
```

**Final Output** (`Info.plist`):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
          "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleIdentifier</key>
    <string>com.acme.my.cool.app</string>
    <key>CFBundleName</key>
    <string>My Cool App</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
</dict>
</plist>
```

---

### Example 3: SiriKit App Entity Template

**Template**: `File Templates/SiriKit/App Entity.xctemplate`

**Template File** (`___APP_ENTITY___.swift`):
```swift
//___FILEHEADER___

import Foundation
___IMPORTS___

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
struct ___APP_ENTITY___: AppEntity {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(
        name: "___APP_ENTITY_DISPLAY_NAME___"
    )
    ___APP_ENTITY_PROPERTIES___
}
___AUXILIARY_CONTENT___
```

**Context** (programmatically set by Intent Builder):
```swift
fileName: "TodoItem.swift"
fileBaseName: "TodoItem"
projectName: "TodoApp"
options: [
    "APP_ENTITY": "TodoItem",
    "APP_ENTITY_DISPLAY_NAME": "To-Do Item",
    "IMPORTS": "import AppIntents",
    "APP_ENTITY_PROPERTIES": """
        var id: UUID
        var title: String
        """,
    "AUXILIARY_CONTENT": ""
]
```

**Variable Resolution**:
- `___FILEHEADER___` → Standard file header
- `___IMPORTS___` → `import AppIntents`
- `___APP_ENTITY___` → `TodoItem`
- `___APP_ENTITY_DISPLAY_NAME___` → `To-Do Item`
- `___APP_ENTITY_PROPERTIES___` → Property definitions
- `___AUXILIARY_CONTENT___` → (empty)

**Final Output** (`TodoItem.swift`):
```swift
//
//  TodoItem.swift
//  TodoApp
//
//  Created by John Doe on 11/16/25.
//  Copyright © 2025 Acme Inc. All rights reserved.
//

import Foundation
import AppIntents

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
struct TodoItem: AppEntity {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(
        name: "To-Do Item"
    )
    var id: UUID
    var title: String
}

```

---

### Example 4: Test Plan Template

**Template**: `File Templates/MultiPlatform/Test/Test Plan.xctemplate`

**Template File** (`___FILEBASENAME___.xctestplan`):
```json
{
  "configurations" : [
    {
      "id" : "___UUID:TEST_PLAN_INITIAL_CONFIGURATION___",
      "name" : "Configuration 1",
      "options" : {}
    }
  ],
  "defaultOptions" : {
    "testTimeoutsEnabled" : true
  },
  "testTargets" : [],
  "version" : 1
}
```

**Context**:
```swift
fileName: "MyTestPlan.xctestplan"
fileBaseName: "MyTestPlan"
```

**Variable Resolution**:
```
___FILEBASENAME___
→ "MyTestPlan"

___UUID:TEST_PLAN_INITIAL_CONFIGURATION___
→ Generate UUID: "D4E5F6A7-B8C9-0123-4567-89ABCDEF0123"
→ Cache it for future references
```

**Final Output** (`MyTestPlan.xctestplan`):
```json
{
  "configurations" : [
    {
      "id" : "D4E5F6A7-B8C9-0123-4567-89ABCDEF0123",
      "name" : "Configuration 1",
      "options" : {}
    }
  ],
  "defaultOptions" : {
    "testTimeoutsEnabled" : true
  },
  "testTargets" : [],
  "version" : 1
}
```

---

## Parsing Implementation Checklist

### Required Components

- [ ] **Variable Pattern Parser**
  - [ ] Regex: `___([A-Za-z_0-9:]+)___`
  - [ ] Extract variable name
  - [ ] Detect variable type (simple, macro, transformed, option, UUID)

- [ ] **Transformation Engine**
  - [ ] `identifier` transformation
  - [ ] `RFC1034Identifier` transformation
  - [ ] `bundleIdentifier` transformation
  - [ ] `c99extidentifier` transformation
  - [ ] Transformation chaining support

- [ ] **Variable Context**
  - [ ] Standard variables (FILEBASENAME, PROJECTNAME, etc.)
  - [ ] User-provided values (USERNAME, FULLUSERNAME, etc.)
  - [ ] Date/time values (DATE, YEAR)
  - [ ] Options dictionary
  - [ ] UUID cache

- [ ] **Macro Expansion**
  - [ ] FILEHEADER macro template
  - [ ] COPYRIGHT macro template
  - [ ] Recursive expansion
  - [ ] Recursion limit protection

- [ ] **Metadata Parser**
  - [ ] Plist XML parsing
  - [ ] Plist JSON parsing
  - [ ] Extract Kind, Identifier, Ancestors
  - [ ] Extract Options array
  - [ ] Extract Definitions

- [ ] **Template Type Detection**
  - [ ] Detect all 11 template kinds
  - [ ] Handle file templates
  - [ ] Handle project templates
  - [ ] Handle Swift Package templates
  - [ ] Handle special templates (SiriKit, TestPlan, Refactoring)

- [ ] **Inheritance Resolution**
  - [ ] Load ancestor templates
  - [ ] Recursive ancestor loading
  - [ ] Metadata merging (child overrides parent)
  - [ ] Dictionary merging

- [ ] **File Processing**
  - [ ] Template file discovery
  - [ ] Filename variable substitution
  - [ ] Content variable substitution
  - [ ] Binary file detection (skip processing)

- [ ] **Error Handling**
  - [ ] Missing variable errors
  - [ ] Invalid transformation errors
  - [ ] Recursion limit errors
  - [ ] File not found errors
  - [ ] Malformed metadata errors

---

## Conclusion

This document provides **excruciating detail** on every aspect of Xcode template parsing:

✅ **11 template kinds** cataloged with examples
✅ **5 variable types** with syntax and resolution rules
✅ **4 transformations** with complete algorithms
✅ **Template structure** (metadata, files, inheritance)
✅ **Processing flow** (discovery → context → substitution → output)
✅ **Edge cases** and special handling
✅ **Complete examples** showing full transformation

**Key Insight**: ALL Xcode templates use the same `___VARIABLE___` pattern, regardless of template kind. The parser is **universal**.

**Implementation Status**:
- ✅ Variable parsing (5 types)
- ✅ Transformations (4 types)
- ✅ Metadata parsing (plist/JSON)
- ⚠️ Template kind detection (11 kinds - needs all kinds enumerated)
- ⚠️ Swift Package support (needs `PackageType` handling)
- ✅ Macro expansion (FILEHEADER, COPYRIGHT)
- ✅ UUID generation and caching
- ✅ Inheritance resolution

**Next Steps**:
1. Add full enum for all 11 template kinds
2. Add `PackageTemplateInfo` model with `PackageType`
3. Test with ALL 146 templates from Xcode.app
4. Verify edge cases (empty options, missing variables, etc.)

---

**Document Version**: 1.0
**Author**: TemplateParser Package
**Based On**: Xcode 16.0 template analysis (146 templates)
