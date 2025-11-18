# Xcode Template Analysis & Artifact Generation

## Overview

This document summarizes the comprehensive analysis and artifact generation system created for understanding Xcode templates.

## Key Understanding: Template Complexity

### 1. **Not Just Plist Files**
Xcode templates are complex bundles containing:
- `TemplateInfo.plist` or `TemplateInfo.json` (metadata)
- Multiple template files with special naming (e.g., `___FILEBASENAME___.swift`)
- Nested directory structures
- Option-dependent file sets
- Inheritance hierarchies

### 2. **Non-Linear Variable Structures**
Templates use sophisticated variable patterns:

#### Basic Variables
```
___FILEBASENAME___          → File name without extension
___FILENAME___              → Complete filename
___PACKAGENAME___           → Package/module name
___PROJECTNAME___           → Project name
```

#### Advanced Variables (Multi-Component)
```
___VARIABLE_productName:identifier___
___VARIABLE_bundleIdentifierPrefix:bundleIdentifier___
___PACKAGENAME:RFC1034Identifier___
___FILEBASENAME:identifier___
```

#### Special Macros
```
___FILEHEADER___            → Generated copyright header
___UUID:exampleServiceID___ → Generated UUID with key
___DATE___                  → Current date
___YEAR___                  → Current year
```

### 3. **Non-Standard Options Structure**
Options in templates are highly complex:
- **Popup selections** with value dependencies
- **Conditional visibility** based on other options
- **RequiredOptionsForValues** - option constraints
- **Units structure** - defines what gets generated per option value
- **Suffixes dictionary** - option-specific name suffixes
- **FallbackHeader** - default values
- **EmptyReplacement** - handling empty option values

Example from real template:
```xml
<key>Options</key>
<array>
    <dict>
        <key>Identifier</key>
        <string>testingSystem</string>
        <key>Type</key>
        <string>popup</string>
        <key>Values</key>
        <array>
            <string>None</string>
            <string>XCTest</string>
            <string>Swift Testing</string>
        </array>
        <key>RequiredOptionsForValues</key>
        <dict>
            <key>Swift Testing</key>
            <dict>
                <key>languageChoice</key>
                <string>Swift</string>
            </dict>
        </dict>
        <key>Units</key>
        <dict>
            <key>XCTest</key>
            <dict>
                <key>Components</key>
                <array>
                    <dict>
                        <key>Identifier</key>
                        <string>com.apple.dt.unit.tests.unit</string>
                        <key>Name</key>
                        <string>___PACKAGENAME___Tests</string>
                    </dict>
                </array>
            </dict>
        </dict>
    </dict>
</array>
```

### 4. **Template Bundles with File Contents**
Templates include actual file contents with replacement values:

**Example: Swift File Template**
```swift
//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_cocoaTouchSubclass___ {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

### 5. **Multi-Step, Multi-Layer Process**

#### For File Templates:
1. **Parse metadata** - Read TemplateInfo.plist
2. **Resolve variables** - Basic substitutions
3. **Apply transformations** - `:identifier`, `:RFC1034Identifier`, etc.
4. **Generate files** - Create actual file content

#### For Project Templates:
1. **Resolve ancestors** - Templates inherit from other templates
2. **Evaluate options** - Check dependencies and constraints
3. **Select files** - Based on option values (language, UI framework, etc.)
4. **Process definitions** - Map nodes to actual file paths
5. **Expand variables** - Multi-pass variable expansion
6. **Generate hierarchy** - Create complete project structure

## Artifact Generation System

### Created Scripts

1. **`Scripts/TemplateGenerator.swift`** (342 lines)
   - Scans all Xcode templates
   - Parses metadata
   - Generates sample files with variable substitution
   - Organizes output by category

2. **`Scripts/generate_all_artifacts.sh`** (71 lines)
   - Orchestrates the generation process
   - Provides user feedback
   - Opens output directory

3. **`Scripts/GenerateProjectFromTemplate.scpt`** (31 lines)
   - AppleScript for Xcode automation (future use)

### Results

**Successfully Generated Artifacts for All 146 Templates:**
- ✅ 58 File Templates
- ✅ 88 Project Templates
- ✅ 0 Failures

### Output Structure

```
XcodeTemplateArtifacts/
├── File Templates/
│   ├── [Category]/
│   │   └── [Template Name]/
│   │       ├── _template_metadata.json    (extracted metadata)
│   │       ├── _generated_sample/         (instantiated files)
│   │       └── [raw template files]       (original files)
└── Project Templates/
    └── [Category]/
        └── [Template Name]/
            ├── _template_metadata.json    (extracted metadata)
            ├── _README.txt                (usage instructions)
            └── [raw template files]       (complete bundle)
```

## Template Categories

### File Templates (58)

#### SiriKit (5)
- Transient App Entity
- INIntent subclass
- App Entity
- App Enum
- Link action

#### Source (10)
- Package Swift File
- Package Test Case
- C File
- C++ File
- Swift File
- Objective-C File
- Header File
- Metal File
- Objective-C new superclass
- Sources Folder Swift File

#### MultiPlatform - Documentation (6)
- Extension File
- Article File
- Tutorial Table of Contents File
- Tutorial File
- Empty
- Documentation Catalog

#### MultiPlatform - Test (4)
- XCTest Unit Test
- Test Plan
- Swift Testing Unit Test
- XCTest UI Test

#### MultiPlatform - Resource (10)
- Property List
- Asset Catalog
- App Privacy
- RTF File
- SiriKit Intent Definition File
- Touch Alternatives Property List
- Module Map
- Strings File (Legacy)
- Stringsdict File (Legacy)

#### MultiPlatform - User Interface (1)
- SwiftUI View

#### Resource - SpriteKit (4)
- SpriteKit Tile Set
- SpriteKit Action
- SpriteKit Particle File
- SpriteKit Scene

#### Resource - SceneKit (3)
- SceneKit Asset Catalog
- SceneKit Scene File
- SceneKit Asset Cache

#### User Interface (6)
- Window
- Application
- Main Menu
- View
- Storyboard
- Empty

#### Other (9)
- Configuration Settings File
- Shell Script
- PCH File
- Markdown File
- Empty File
- CLIPS File
- Exports File
- Assembly File
- File List

### Project Templates (88)

#### Other (3)
- External Build System
- Aggregate
- Empty

#### MultiPlatform (77)
Including:
- App (iOS, macOS, tvOS, visionOS)
- Games (SpriteKit, SceneKit, Metal, RealityKit)
- Safari Extensions
- Audio Unit Extensions
- Widget Extensions
- Generic Extensions
- Testing Bundles (Unit, UI)
- Library
- Swift Macro
- Build Tool Plug-in
- Command Plug-in
- Document App
- Compositor Services
- Immersive Space App

#### Base (8)
Template inheritance foundations:
- Base
- Multiplatform Base
- Framework Base
- Bundle Base
- App Base
- SwiftUI App Base
- Testing System
- Language Choice
- Storage Type
- Base_Options
- Base_DefinitionsLanguage
- Base_DefinitionsAppLifecycle
- Base_DefinitionsInfoPlist
- And more...

## What This Reveals

### Template Parser Requirements

Based on generated artifacts, the template parser needs to handle:

1. **Variable Resolution Engine**
   - Basic variables (`___FILEBASENAME___`, etc.)
   - Option-referenced variables (`___VARIABLE_*___`)
   - Transformations (`:identifier`, `:RFC1034Identifier`, `:bundleIdentifier`)
   - UUID generation (`___UUID:key___`)
   - Header generation (`___FILEHEADER___`)

2. **Options Processing**
   - Parse complex option structures
   - Handle RequiredOptionsForValues constraints
   - Process Units for conditional generation
   - Support Suffixes, FallbackHeader, EmptyReplacement

3. **Template Inheritance**
   - Resolve Ancestors chain
   - Merge option definitions
   - Combine file definitions
   - Override specifications

4. **File Generation**
   - Process Definitions structure
   - Map Nodes to file paths
   - Handle conditional file inclusion
   - Support multiple passes for variable expansion

5. **Platform Support**
   - iOS, macOS, tvOS, visionOS, watchOS
   - Cross-platform projects
   - Platform-specific options

## Sample Artifacts

### Swift File Template

**Generated File**: `_generated_sample/File.swift`
```swift
//
//  File.swift
//  MyProject
//
//  Created by Mihaela Mihaljevic on 16.11.2025.
//  Copyright © 2025 Mihaela Mihaljevic. All rights reserved.
//

import Foundation
```

**Metadata**: `_template_metadata.json`
```json
{
  "name": "Swift File",
  "type": "File",
  "category": "MultiPlatform > Source",
  "kind": "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind",
  "description": "An empty Swift file.",
  "source_path": "/Applications/Xcode.app/.../Swift File.xctemplate"
}
```

### Multiplatform App Template

**Metadata**: `_template_metadata.json`
```json
{
  "name": "App",
  "type": "Project",
  "category": "MultiPlatform > Application",
  "identifier": "com.apple.dt.unit.multiPlatform.app",
  "kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
  "description": "This template creates a multi-platform SwiftUI application.",
  "ancestors": [
    "com.apple.dt.unit.multiPlatform.app.SwiftUI"
  ],
  "concrete": true
}
```

## Usage

### Generate All Artifacts

```bash
# From repository root
./Scripts/generate_all_artifacts.sh

# Custom output location
./Scripts/generate_all_artifacts.sh ~/Desktop/MyArtifacts
```

### Explore Generated Artifacts

```bash
# Default location
open ~/Documents/XcodeTemplateArtifacts
```

## Next Steps

1. **Study generated artifacts** - Understand variable patterns and option structures
2. **Enhance parser** - Add support for complex variables and transformations
3. **Implement options engine** - Handle conditional generation
4. **Add inheritance resolver** - Process ancestor templates
5. **Create file generator** - Actually instantiate templates from within Templatomat

## Documentation

See `Scripts/README.md` for detailed documentation on:
- Script usage
- Output structure
- Template kinds
- Variable patterns
- Transformation types

## Summary

This automation system provides a **complete reference** of all Xcode templates by:
- ✅ Extracting metadata from 146 templates
- ✅ Generating sample instantiated files
- ✅ Organizing by category and type
- ✅ Documenting variable patterns
- ✅ Revealing template structure

The generated artifacts serve as a **comprehensive knowledge base** for understanding Xcode's proprietary template system and implementing a complete template parser in Templatomat.
