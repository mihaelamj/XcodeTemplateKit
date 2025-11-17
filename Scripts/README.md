# Scripts Directory

Automation scripts for generating Xcode template artifacts and projects.

---

## Overview

This directory contains scripts to automatically generate artifacts from **all 146 Xcode templates** located in the Xcode application bundle.

**Source**: `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/`

---

## 📦 Available Scripts

### 1. `generate_all_artifacts.sh`

**Purpose**: Extract and process all Xcode template files into parseable artifacts

**Usage**:
```bash
# Generate to XcodeTemplateCollection (default)
./Scripts/generate_all_artifacts.sh XcodeTemplateCollection/TemplateArtifacts

# Generate to custom location
./Scripts/generate_all_artifacts.sh ~/Desktop/MyArtifacts
```

**What it generates**:
- **58 File Templates** - Each with:
  - `_template_metadata.json` - Extracted metadata
  - `___FILEBASENAME___.swift` - Raw template file
  - `_generated_sample/` - Processed sample with variables substituted

- **88 Project Templates** - Each with:
  - `_template_metadata.json` - Template metadata
  - Complete template bundle
  - `_README.txt` - Usage instructions

**Output Structure**:
```
TemplateArtifacts/
├── File Templates/
│   └── [Category]/
│       └── [Template Name]/
│           ├── _template_metadata.json
│           ├── ___FILEBASENAME___.swift
│           └── _generated_sample/
│               └── File.swift
└── Project Templates/
    └── [Category]/
        └── [Template Name]/
            ├── _template_metadata.json
            └── _README.txt
```

---

### 2. `generate_all_projects.sh`

**Purpose**: Generate working Swift Package projects from Xcode templates

**Usage**:
```bash
# Generate to XcodeTemplateCollection (default)
./Scripts/generate_all_projects.sh XcodeTemplateCollection/GeneratedProjects

# Generate to custom location
./Scripts/generate_all_projects.sh ~/Desktop/MyProjects
```

**What it generates**:
- **14 Working Swift Packages**:
  - 5 Applications
  - 3 Extensions
  - 1 Framework
  - 2 Test Bundles
  - 3 Other project types

**Features**:
- ✅ Creates `Package.swift` with proper configuration
- ✅ Generates source file structure
- ✅ Includes README for each project
- ✅ Builds successfully with `swift build`
- ✅ Can generate Xcode projects with `swift package generate-xcodeproj`

**Output Structure**:
```
GeneratedProjects/
├── MultiPlatform_Application/
│   ├── MultiplatformApp/
│   │   ├── Package.swift
│   │   ├── Sources/
│   │   └── README.md
│   ├── DocumentApp/
│   └── GameProject/
├── MultiPlatform_Extension/
└── Other/
```

---

## 🔧 Swift Generator Scripts

### Core Generators

1. **`TemplateGenerator.swift`**
   - Main artifact generator
   - Scans Xcode template directories
   - Parses `TemplateInfo.plist` files
   - Generates sample files with variable substitution
   - Creates metadata JSON files

2. **`SwiftPackageProjectGenerator.swift`**
   - Generates Swift Package projects from templates
   - Creates `Package.swift` manifests
   - Sets up source directory structure
   - Handles platform-specific configurations

3. **`XcodeProjectGenerator.swift`**
   - Generates `.xcodeproj` files
   - Wraps `swift package generate-xcodeproj`
   - Batch processes multiple packages

4. **`DirectProjectGenerator.swift`**
   - Alternative project generation approach
   - Direct template instantiation
   - Advanced variable substitution

---

## 🚀 Quick Start

### Generate All Artifacts

```bash
# 1. Ensure Xcode is installed
xcode-select -p

# 2. Navigate to project root
cd /Volumes/Code/DeveloperExt/private/XcodeTemplateKit

# 3. Generate artifacts
./Scripts/generate_all_artifacts.sh XcodeTemplateCollection/TemplateArtifacts

# 4. Verify output
ls XcodeTemplateCollection/TemplateArtifacts/File\ Templates/
```

### Generate All Projects

```bash
# 1. Generate projects
./Scripts/generate_all_projects.sh XcodeTemplateCollection/GeneratedProjects

# 2. Test a generated project
cd XcodeTemplateCollection/GeneratedProjects/MultiPlatform_Application/MultiplatformApp
swift build
swift run

# 3. Generate Xcode project (optional)
swift package generate-xcodeproj
```

---

## 📊 What Gets Generated

### Template Artifacts (146 total)

**File Templates (58)**:
- SiriKit (5)
- Source (10) - Swift, C, C++, Objective-C, Metal, Header
- MultiPlatform > Documentation (6)
- MultiPlatform > Test (4)
- MultiPlatform > Resource (10)
- MultiPlatform > User Interface (1)
- Resource > SpriteKit (4)
- Resource > SceneKit (3)
- User Interface (6)
- Other (9)

**Project Templates (88)**:
- MultiPlatform (77) - Apps, Frameworks, Extensions, Libraries, Tests
- Base (8) - Template inheritance foundations
- Other (3) - Empty, Aggregate, External Build System

### Generated Projects (14 total)

**Applications (5)**:
- MultiplatformApp
- DocumentApp
- GameProject
- SafariExtensionApp
- AudioUnitExtensionApp

**Extensions (3)**:
- GenericExtension
- WidgetExtension
- AudioUnitExtension

**Framework (1)**:
- MultiplatformFramework

**Test Bundles (2)**:
- UITestingBundle
- UnitTestingBundle

**Other (3)**:
- EmptyProject
- ExternalBuildSystem
- AggregateTarget

---

## 🔍 Variable Substitution

The generators handle these variable patterns:

### Simple Variables
- `___FILEBASENAME___` → Base filename without extension
- `___FILENAME___` → Complete filename
- `___PROJECTNAME___` → Project name
- `___PACKAGENAME___` → Package/module name
- `___USERNAME___` → Short username
- `___FULLUSERNAME___` → Full user name
- `___DATE___` → Current date
- `___YEAR___` → Current year

### Transformed Variables
- `___FILEBASENAME:identifier___` → Swift/ObjC identifier
- `___PACKAGENAME:RFC1034Identifier___` → DNS-compliant
- `___VARIABLE_name:bundleIdentifier___` → Bundle ID format

### Macro Variables
- `___FILEHEADER___` → Complete copyright header
- `___COPYRIGHT___` → Copyright notice
- `___UUID:key___` → Generated UUID

---

## 📝 Examples

### Example: Generate Swift File Template Artifact

```bash
# Run artifact generator
./Scripts/generate_all_artifacts.sh XcodeTemplateCollection/TemplateArtifacts

# Check generated Swift File template
cat "XcodeTemplateCollection/TemplateArtifacts/File Templates/MultiPlatform > Source/Swift File/_generated_sample/File.swift"
```

**Output**:
```swift
//
//  File.swift
//  MyProject
//
//  Created by Mihaela Mihaljevic on 17.11.2025.
//  Copyright © 2025 Mihaela Mihaljevic. All rights reserved.
//

import Foundation
```

### Example: Generate and Build a Project

```bash
# Generate projects
./Scripts/generate_all_projects.sh XcodeTemplateCollection/GeneratedProjects

# Build a generated app
cd XcodeTemplateCollection/GeneratedProjects/MultiPlatform_Application/MultiplatformApp
swift build

# Run it
swift run
```

---

## 🔄 Regeneration

### When to Regenerate

✅ **Do regenerate** when:
- Xcode updates to new version
- Template structure changes
- Adding new template support
- Testing parser against fresh templates

❌ **Don't need to regenerate** when:
- Making code changes to parser
- Running daily tests
- Templates haven't changed

### Clean Regeneration

```bash
# 1. Remove old artifacts
rm -rf XcodeTemplateCollection/TemplateArtifacts/*
rm -rf XcodeTemplateCollection/GeneratedProjects/*

# 2. Regenerate fresh
./Scripts/generate_all_artifacts.sh XcodeTemplateCollection/TemplateArtifacts
./Scripts/generate_all_projects.sh XcodeTemplateCollection/GeneratedProjects

# 3. Run integration tests to verify
cd Packages
swift test --filter "Integration Tests"

# 4. Commit with descriptive message
git add XcodeTemplateCollection/
git commit -m "chore: regenerate template artifacts from Xcode 16.x"
```

---

## 🛠 Prerequisites

### Required
- ✅ **Xcode** installed at `/Applications/Xcode.app`
- ✅ **Swift** 6.2+ (comes with Xcode)
- ✅ **Command Line Tools** (`xcode-select --install`)

### Verification
```bash
# Check Xcode installation
xcode-select -p
# Expected: /Applications/Xcode.app/Contents/Developer

# Check Swift version
swift --version
# Expected: Swift version 6.x

# Check templates exist
ls /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/
# Expected: File Templates, Project Templates
```

---

## 📖 Related Documentation

- **[TEMPLATE_ARTIFACT_GENERATION.md](../Documentation/TEMPLATE_ARTIFACT_GENERATION.md)** - Comprehensive generation guide
- **[XCODE_TEMPLATE_PARSING_RULES.md](../Packages/Sources/TemplateParser/XCODE_TEMPLATE_PARSING_RULES.md)** - Complete parsing reference
- **[XcodeTemplateCollection/README.md](../XcodeTemplateCollection/README.md)** - Artifacts overview

---

## 💡 Tips

### Faster Development
```bash
# Generate only file templates (faster)
swift Scripts/TemplateGenerator.swift --files-only output/

# Generate specific category
# (requires script modification)
```

### Debugging
```bash
# Run Swift generator directly with verbose output
swift Scripts/TemplateGenerator.swift XcodeTemplateCollection/TemplateArtifacts 2>&1 | tee generation.log

# Check for errors
grep -i error generation.log
```

### Validation
```bash
# Count generated artifacts
find XcodeTemplateCollection/TemplateArtifacts/File\ Templates -name "_template_metadata.json" | wc -l
# Expected: 58

find XcodeTemplateCollection/TemplateArtifacts/Project\ Templates -name "_template_metadata.json" | wc -l
# Expected: 88

# Verify generated projects build
cd XcodeTemplateCollection/GeneratedProjects/MultiPlatform_Application/MultiplatformApp
swift build
# Expected: Build successful
```

---

## Summary

The scripts in this directory automate the extraction and processing of all 146 Xcode templates, creating:

1. **Template Artifacts** - Parseable metadata and sample files
2. **Generated Projects** - Working Swift Packages and Xcode projects

These artifacts are used by:
- ✅ Integration tests (validate parser)
- ✅ Documentation (reference templates)
- ✅ Development (understand template structure)

---

**Last Updated**: November 17, 2025
**Scripts Source**: Copied from templatomat repository
**Total Templates**: 146 (58 file + 88 project)
