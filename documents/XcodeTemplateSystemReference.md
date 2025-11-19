# Xcode Template System - Comprehensive Reference

## Overview

Xcode templates are reusable blueprints for creating files and projects. They are defined in `.xctemplate` bundles containing configuration files and source templates with placeholder substitution.

### Template Types

1. **File Templates** (`Xcode.IDEFoundation.TextSubstitutionFileTemplateKind`)
   - Create individual files (Swift, Objective-C, headers, etc.)
   - Located in: `~/Library/Developer/Xcode/Templates/File Templates/`
   - Use simple text substitution with macros

2. **Project Templates** (`Xcode.Xcode3.ProjectTemplateUnitKind`)
   - Create entire project structures with multiple files
   - Located in: `~/Library/Developer/Xcode/Templates/Project Templates/`
   - Can include build settings, targets, and dependencies

## Template Structure

### Directory Layout

```
CustomTemplate.xctemplate/
├── TemplateInfo.plist          # Required: Template configuration
├── ___FILEBASENAME___.swift    # Template file with placeholders
├── TemplateIcon.png            # Optional: Custom icon
└── AdditionalFiles/            # Optional: Supporting files
```

### TemplateInfo.plist - Core Configuration

The `TemplateInfo.plist` file is the heart of every template. It **must** be a valid property list file.

#### Required Keys

**1. Identifier** (String)
- **CRITICAL**: Must be globally unique across all templates
- Format: Reverse DNS notation recommended
- Example: `com.company.fileTemplate.mvvm-view`
- **Failure Mode**: Non-unique identifiers cause silent template failure

**2. Kind** (String)
- Specifies template type
- File Template: `Xcode.IDEFoundation.TextSubstitutionFileTemplateKind`
- Project Template: `Xcode.Xcode3.ProjectTemplateUnitKind`

**3. Description** (String)
- User-facing description shown in template chooser
- Keep concise (1-2 lines)
- Example: "A SwiftUI view with ViewModel following MVVM pattern"

#### Optional Keys

**Ancestors** (Array of Strings)
- Inherit properties from other templates
- Example: `["com.apple.dt.unit.base"]`
- Templates inherit: Options, Definitions, Nodes, Macros
- Child template values override parent values
- Enables template composition and reuse

**Options** (Array of Dictionaries)
- Define user input fields in template wizard
- Each option creates a variable available in placeholders
- Structure:
  ```xml
  <key>Options</key>
  <array>
    <dict>
      <key>Identifier</key>
      <string>viewModelName</string>

      <key>Name</key>
      <string>ViewModel Name</string>

      <key>Description</key>
      <string>The name for your view model class</string>

      <key>Type</key>
      <string>text</string>

      <key>Required</key>
      <true/>

      <key>Default</key>
      <string>MyViewModel</string>
    </dict>
  </array>
  ```

**Option Types:**
- `text` - Single-line text input
- `popup` - Dropdown menu (requires `Values` array)
- `checkbox` - Boolean toggle
- `combo` - Combo box (text + dropdown)
- `static` - Display-only text

**Definitions** (Dictionary)
- Specify file contents and locations
- Maps file identifiers to their properties
- Example:
  ```xml
  <key>Definitions</key>
  <dict>
    <key>___FILEBASENAME___.swift</key>
    <dict>
      <key>Path</key>
      <string>___FILEBASENAME___.swift</string>

      <key>Group</key>
      <string>ViewModels</string>

      <key>TargetIndices</key>
      <array>
        <integer>0</integer>
      </array>
    </dict>
  </dict>
  ```

**Nodes** (Array of Strings)
- Lists all files to be created
- Example: `["___FILEBASENAME___.swift", "___FILEBASENAME___Tests.swift"]`
- Files must exist in template bundle or be defined in Definitions

**Platforms** (Array of Strings)
- Restrict template to specific platforms
- Values: `com.apple.platform.iphoneos`, `com.apple.platform.macosx`, etc.
- Omit to allow all platforms

**AllowedTypes** (Array of Strings)
- Restrict where template can be used
- UTI format: `public.swift-source`, `public.objective-c-source`

**SortOrder** (Integer)
- Controls display order in template chooser
- Lower numbers appear first
- Default: 100

**MainTemplateFile** (String)
- Specifies primary file for editing after creation
- Example: `___FILEBASENAME___.swift`

**Summary** (String)
- Brief one-line summary
- Appears in template chooser subtitle

**Concrete** (Boolean)
- `true`: Template appears in chooser
- `false`: Template is abstract (inheritance only)
- Default: `true`

**HiddenFromChooser** (String)
- Objective-C boolean format: `"YES"` or `"NO"`
- Hide template from user interface
- Useful for base templates meant only for inheritance

## Placeholder System

### Standard Macros

Xcode provides built-in macros that are automatically substituted:

**File-Level Macros:**
- `___FILEBASENAME___` - File name without extension
- `___FILEBASENAMEASIDENTIFIER___` - File name as valid identifier (removes spaces, special chars)
- `___FILENAME___` - Full file name with extension
- `___PACKAGENAME___` - Project/bundle name
- `___PROJECTNAME___` - Xcode project name
- `___TARGETNAME___` - Active target name

**User/Organization:**
- `___FULLUSERNAME___` - User's full name from system
- `___USERNAME___` - User's short name
- `___ORGANIZATIONNAME___` - From Xcode preferences
- `___COPYRIGHT___` - Auto-generated copyright notice

**Date/Time:**
- `___DATE___` - Current date (MM/DD/YY format)
- `___TIME___` - Current time
- `___YEAR___` - Current year (YYYY format)

**Code Generation:**
- `___VARIABLE_identifier___` - Variable from Options array
- `___VARIABLE_identifier:identifier___` - Variable with identifier transformation
- `___VARIABLE_identifier:xml___` - Variable with XML escaping

### Custom Variables

Define custom variables in the Options array:

```xml
<key>Options</key>
<array>
  <dict>
    <key>Identifier</key>
    <string>protocolName</string>

    <key>Name</key>
    <string>Protocol Name</string>

    <key>Type</key>
    <string>text</string>

    <key>Default</key>
    <string>___VARIABLE_productName:identifier___Protocol</string>
  </dict>
</array>
```

Usage in template files:
```swift
protocol ___VARIABLE_protocolName___ {
    // Protocol definition
}
```

### Variable Transformations

Apply transformations to variables using colon syntax:

- `:identifier` - Convert to valid Swift/Obj-C identifier
- `:bundleIdentifier` - Convert to bundle identifier format
- `:rfc1034Identifier` - RFC 1034 compliant identifier
- `:xml` - XML entity escaping
- `:lower` - Lowercase
- `:upper` - Uppercase
- `:capitalize` - Capitalize first letter

Example:
```
Input: "My View Model"
___VARIABLE_name___                    → "My View Model"
___VARIABLE_name:identifier___         → "MyViewModel"
___VARIABLE_name:lower___              → "my view model"
___VARIABLE_name:identifier:lower___   → "myviewmodel"
```

## Template File Syntax

### Basic Template File

```swift
//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import SwiftUI

struct ___FILEBASENAMEASIDENTIFIER___: View {
    var body: some View {
        Text("Hello, ___FILEBASENAME___!")
    }
}

#Preview {
    ___FILEBASENAMEASIDENTIFIER___()
}
```

### MVVM Template Example

**TemplateInfo.plist:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Identifier</key>
    <string>com.example.mvvm-view</string>

    <key>Kind</key>
    <string>Xcode.IDEFoundation.TextSubstitutionFileTemplateKind</string>

    <key>Description</key>
    <string>SwiftUI view with ViewModel</string>

    <key>Summary</key>
    <string>MVVM pattern with view and view model</string>

    <key>SortOrder</key>
    <integer>10</integer>

    <key>Platforms</key>
    <array>
        <string>com.apple.platform.iphoneos</string>
        <string>com.apple.platform.macosx</string>
    </array>

    <key>Options</key>
    <array>
        <dict>
            <key>Identifier</key>
            <string>viewModelName</string>

            <key>Name</key>
            <string>ViewModel Name</string>

            <key>Description</key>
            <string>Name for the view model class</string>

            <key>Type</key>
            <string>text</string>

            <key>Default</key>
            <string>___VARIABLE_productName:identifier___ViewModel</string>

            <key>Required</key>
            <true/>
        </dict>
    </array>

    <key>Nodes</key>
    <array>
        <string>___FILEBASENAME___.swift</string>
        <string>___FILEBASENAME___ViewModel.swift</string>
    </array>

    <key>Definitions</key>
    <dict>
        <key>___FILEBASENAME___ViewModel.swift</key>
        <dict>
            <key>Path</key>
            <string>___FILEBASENAME___ViewModel.swift</string>
        </dict>
    </dict>
</dict>
</plist>
```

**___FILEBASENAME___.swift:**
```swift
import SwiftUI

struct ___FILEBASENAMEASIDENTIFIER___: View {
    @StateObject private var viewModel = ___VARIABLE_viewModelName___()

    var body: some View {
        VStack {
            Text("___FILEBASENAME___")
        }
    }
}

#Preview {
    ___FILEBASENAMEASIDENTIFIER___()
}
```

**___FILEBASENAME___ViewModel.swift:**
```swift
import Foundation
import Combine

final class ___VARIABLE_viewModelName___: ObservableObject {
    @Published var title: String = ""

    init() {
        // Initialize
    }
}
```

## Project Templates

Project templates are more complex and can define entire project structures.

### Key Differences from File Templates

1. **Kind**: Use `Xcode.Xcode3.ProjectTemplateUnitKind`
2. **Targets**: Define build targets
3. **Project**: Specify Xcode project settings
4. **SharedSettings**: Build settings for all configurations
5. **Components**: Reusable template components

### Project Template Structure

```xml
<key>Project</key>
<dict>
    <key>SharedSettings</key>
    <dict>
        <key>PRODUCT_NAME</key>
        <string>$(TARGET_NAME)</string>

        <key>SWIFT_VERSION</key>
        <string>5.0</string>
    </dict>

    <key>Configurations</key>
    <dict>
        <key>Debug</key>
        <dict>
            <key>SWIFT_OPTIMIZATION_LEVEL</key>
            <string>-Onone</string>
        </dict>

        <key>Release</key>
        <dict>
            <key>SWIFT_OPTIMIZATION_LEVEL</key>
            <string>-O</string>
        </dict>
    </dict>
</dict>

<key>Targets</key>
<array>
    <dict>
        <key>Name</key>
        <string>___PACKAGENAME___</string>

        <key>ProductType</key>
        <string>com.apple.product-type.application</string>

        <key>Dependencies</key>
        <array>
            <!-- Target dependencies -->
        </array>

        <key>BuildPhases</key>
        <array>
            <dict>
                <key>Class</key>
                <string>Sources</string>
            </dict>
            <dict>
                <key>Class</key>
                <string>Resources</string>
            </dict>
        </array>
    </dict>
</array>
```

## Advanced Features

### Template Inheritance

Templates can inherit from multiple ancestors:

```xml
<key>Ancestors</key>
<array>
    <string>com.apple.dt.unit.base</string>
    <string>com.example.custom.base</string>
</array>
```

**Inheritance Rules:**
1. Child inherits all keys from ancestors
2. Child values override ancestor values
3. Arrays and dictionaries are merged (not replaced)
4. Multiple ancestors processed in order (later overrides earlier)

### Conditional Template Files

Use the `TargetIndices` key to conditionally include files:

```xml
<key>Definitions</key>
<dict>
    <key>AppDelegate.swift</key>
    <dict>
        <key>TargetIndices</key>
        <array>
            <integer>0</integer>  <!-- Only in first target -->
        </array>
    </dict>
</dict>
```

### Option Dependencies

Options can depend on other options:

```xml
<dict>
    <key>Identifier</key>
    <string>useViewModel</string>
    <key>Type</key>
    <string>checkbox</string>
    <key>Default</key>
    <string>true</string>
</dict>
<dict>
    <key>Identifier</key>
    <string>viewModelName</string>
    <key>Type</key>
    <string>text</string>
    <key>RequiredOptions</key>
    <dict>
        <key>useViewModel</key>
        <string>true</string>
    </dict>
</dict>
```

### Group Organization

Place files in specific Xcode groups:

```xml
<key>Definitions</key>
<dict>
    <key>MyView.swift</key>
    <dict>
        <key>Group</key>
        <string>Views/Screens</string>
        <key>Path</key>
        <string>Views/Screens/MyView.swift</string>
    </dict>
</dict>
```

## Best Practices

### 1. Template Organization

- **Group related templates** in subdirectories
- **Use clear naming** for template bundles
- **Include TemplateIcon.png** (48x48px) for visual identification
- **Document templates** with README files

### 2. Identifier Strategy

- **Always use unique identifiers** (reverse DNS recommended)
- **Include version** in identifier for major changes
- **Example**: `com.company.projectName.templateType.v2`

### 3. Placeholder Usage

- **Prefer standard macros** when available
- **Use transformations** to ensure valid identifiers
- **Provide sensible defaults** in Options
- **Validate user input** with NotPersisted options

### 4. File Organization

- **Use Definitions** to specify file locations
- **Leverage Groups** to organize project structure
- **Set TargetIndices** appropriately
- **Include MainTemplateFile** for user convenience

### 5. Testing Templates

1. **Install** template to correct location
2. **Restart Xcode** to detect changes
3. **Create test project** using template
4. **Verify**:
   - All files created correctly
   - Placeholders substituted properly
   - Files added to correct targets
   - Build succeeds without errors
5. **Check console** for template errors (`Console.app`)

### 6. Compatibility

- **Test on multiple Xcode versions** if supporting older versions
- **Document minimum Xcode version** required
- **Use platform checks** when targeting specific platforms
- **Avoid deprecated keys** from older template formats

## Common Pitfalls and Solutions

### Problem: Template doesn't appear in Xcode

**Causes:**
1. Template not in correct directory
2. TemplateInfo.plist has syntax errors
3. Missing required keys (Identifier, Kind, Description)
4. Xcode hasn't been restarted after installation

**Solutions:**
- Verify location: `~/Library/Developer/Xcode/Templates/File Templates/Custom/`
- Validate plist: `plutil -lint TemplateInfo.plist`
- Check required keys are present
- Restart Xcode

### Problem: Placeholders not substituting

**Causes:**
1. Incorrect placeholder syntax
2. Variable not defined in Options
3. File encoding issues
4. Triple underscores not matching exactly

**Solutions:**
- Use exactly three underscores: `___VARIABLE___`
- Define variables in Options array with matching Identifier
- Save template files as UTF-8
- Check for invisible characters or extra spaces

### Problem: Files created in wrong location

**Causes:**
1. Path in Definitions doesn't match desired location
2. Group not specified
3. TargetIndices not set correctly

**Solutions:**
- Set Path explicitly in Definitions
- Use Group key to specify Xcode group
- Verify TargetIndices array matches target order

### Problem: Template inheritance not working

**Causes:**
1. Ancestor identifier doesn't exist or is misspelled
2. Ancestor template not installed
3. Circular inheritance

**Solutions:**
- Verify ancestor Identifier exactly
- Ensure base template is installed
- Check inheritance chain for cycles
- Use Console.app to view template loading errors

### Problem: Build settings not applied

**Causes:**
1. Settings in wrong configuration dictionary
2. Typo in build setting name
3. Setting overridden by later definition

**Solutions:**
- Use SharedSettings for all-configuration settings
- Verify build setting names against Xcode documentation
- Check inheritance order and overrides

## Template Installation

### Manual Installation

1. **Create template bundle** with `.xctemplate` extension
2. **Copy to location**:
   - File Templates: `~/Library/Developer/Xcode/Templates/File Templates/Custom/`
   - Project Templates: `~/Library/Developer/Xcode/Templates/Project Templates/Custom/`
3. **Create directories** if they don't exist:
   ```bash
   mkdir -p ~/Library/Developer/Xcode/Templates/File\ Templates/Custom
   ```
4. **Restart Xcode**

### Automated Installation Script

```bash
#!/bin/bash

TEMPLATE_NAME="MyTemplate.xctemplate"
TEMPLATE_DIR="$HOME/Library/Developer/Xcode/Templates/File Templates/Custom"

# Create directory if needed
mkdir -p "$TEMPLATE_DIR"

# Copy template
cp -R "$TEMPLATE_NAME" "$TEMPLATE_DIR/"

echo "Template installed to: $TEMPLATE_DIR/$TEMPLATE_NAME"
echo "Please restart Xcode to see the new template."
```

### Distribution

For sharing templates:

1. **Package as .zip** or .dmg
2. **Include installer script** or instructions
3. **Document requirements** (Xcode version, platforms)
4. **Provide examples** of generated output
5. **Include uninstall instructions**

## Troubleshooting

### Debugging Template Issues

1. **Check Console.app** while using template:
   - Filter for "Xcode" or "IDEKit"
   - Look for template-related errors

2. **Validate plist syntax**:
   ```bash
   plutil -lint TemplateInfo.plist
   ```

3. **Print plist contents**:
   ```bash
   plutil -p TemplateInfo.plist
   ```

4. **Extract specific fields**:
   ```bash
   plutil -extract Identifier raw TemplateInfo.plist
   plutil -extract Kind raw TemplateInfo.plist
   ```

5. **Compare with working template**:
   ```bash
   diff -r MyTemplate.xctemplate WorkingTemplate.xctemplate
   ```

### Common Error Messages

**"Template not found"**
- Check installation path
- Verify .xctemplate extension
- Restart Xcode

**"Invalid template configuration"**
- Validate TemplateInfo.plist syntax
- Check required keys present
- Verify Kind value is correct

**"Could not create file from template"**
- Check file permissions
- Verify Definitions dictionary
- Ensure Nodes array lists all files

## Reference: TemplateInfo.plist Keys

### Complete Key Reference

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| Identifier | String | ✅ | Unique template identifier (reverse DNS) |
| Kind | String | ✅ | Template type (File/Project) |
| Description | String | ✅ | User-facing description |
| Ancestors | Array | ❌ | Parent template identifiers |
| Options | Array | ❌ | User input fields |
| Definitions | Dictionary | ❌ | File contents and locations |
| Nodes | Array | ❌ | List of files to create |
| Platforms | Array | ❌ | Supported platforms |
| AllowedTypes | Array | ❌ | Allowed UTIs for template usage |
| SortOrder | Integer | ❌ | Display order (default: 100) |
| MainTemplateFile | String | ❌ | Primary file for editing |
| Summary | String | ❌ | Brief one-line summary |
| Concrete | Boolean | ❌ | Show in chooser (default: true) |
| HiddenFromChooser | String | ❌ | Hide from UI ("YES"/"NO") |
| HiddenFromLibrary | String | ❌ | Hide from library ("YES"/"NO") |
| Project | Dictionary | ❌ | Project-level settings (project templates) |
| Targets | Array | ❌ | Build targets (project templates) |
| SharedSettings | Dictionary | ❌ | Build settings for all configs |
| Components | Array | ❌ | Reusable template components |

## Additional Resources

### Xcode Template Locations

**System Templates:**
- `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/`
- Good source for examples and inheritance

**User Templates:**
- `~/Library/Developer/Xcode/Templates/File Templates/`
- `~/Library/Developer/Xcode/Templates/Project Templates/`

### Useful Commands

```bash
# Find all template bundles
find /Applications/Xcode.app -name "*.xctemplate" -type d

# List user templates
ls -la ~/Library/Developer/Xcode/Templates/File\ Templates/

# Validate plist
plutil -lint TemplateInfo.plist

# Convert plist to XML format
plutil -convert xml1 TemplateInfo.plist

# Extract all keys from plist
plutil -p TemplateInfo.plist | grep "=>"
```

## Version History and Compatibility

### Xcode 3 vs Xcode 4+ Templates

**Xcode 3 Format:**
- Used `.pbfilespec` and `.pblangspec` files
- More complex specification files
- Largely deprecated

**Xcode 4+ Format (Current):**
- Uses `.xctemplate` bundles
- TemplateInfo.plist configuration
- Simpler, more maintainable
- **This is the format documented here**

### Breaking Changes by Xcode Version

**Xcode 4.0:**
- Introduced `.xctemplate` format
- Removed .pbfilespec support

**Xcode 6.0:**
- Swift template support added
- New placeholder transformations

**Xcode 9.0:**
- Swift 4 migration templates

**Xcode 11.0:**
- SwiftUI template support
- Catalyst platform support

**Xcode 12.0+:**
- Apple Silicon support
- Updated default templates

## Conclusion

Xcode templates provide powerful code generation capabilities through a relatively simple property list configuration. By understanding the template structure, placeholder system, and inheritance model, you can create sophisticated templates that enforce architectural patterns and accelerate development workflows.

Key takeaways:
1. **Identifier must be unique** - This is the most common cause of silent failures
2. **Use standard macros** when possible - They're well-tested and reliable
3. **Test thoroughly** - Template bugs affect all generated code
4. **Leverage inheritance** - Reduce duplication through template composition
5. **Document your templates** - Future maintainers will thank you

For the XcodeTemplateKit project, this reference provides the foundation for implementing the TemplateGenerator's serialization logic, ensuring generated plists conform to Xcode's expectations and can be successfully parsed by Xcode's template system.
