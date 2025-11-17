# Template Artifact Generation Guide

**Last Updated**: November 17, 2025
**Xcode Version**: Xcode 16.x
**Total Templates**: 146 (58 File + 88 Project)

---

## Overview

This guide documents how to generate template artifacts from the Xcode application bundle. These artifacts are used by the `TemplateParser` package and integration tests to validate parsing of real Xcode templates.

---

## Table of Contents

1. [Template Sources](#template-sources)
2. [Artifact Structure](#artifact-structure)
3. [Generation Process](#generation-process)
4. [Automated Scripts](#automated-scripts)
5. [Manual Generation](#manual-generation)
6. [Verification](#verification)
7. [Troubleshooting](#troubleshooting)

---

## Template Sources

### Xcode Application Bundle

All Xcode templates are located in the Xcode application bundle:

```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/
├── File Templates/      (58 templates)
│   ├── MultiPlatform/
│   │   ├── Source/
│   │   ├── Test/
│   │   ├── Resource/
│   │   ├── User Interface/
│   │   └── Documentation/
│   ├── SiriKit/
│   ├── Resource/
│   ├── User Interface/
│   ├── Source/
│   └── Other/
│
└── Project Templates/   (88 templates)
    ├── MultiPlatform/
    │   ├── Application/
    │   ├── Extension/
    │   ├── Framework/
    │   ├── Test/
    │   └── Library/
    ├── Base/
    └── Other/
```

### Template Structure

Each template is a `.xctemplate` directory containing:

```
TemplateExample.xctemplate/
├── TemplateInfo.plist          # Metadata (Kind, Identifier, Options, etc.)
├── ___FILEBASENAME___.swift    # Template file with variables
└── (optional subdirectories)
```

---

## Artifact Structure

Generated artifacts are stored in the repository:

```
XcodeTemplateCollection/
├── TemplateArtifacts/
│   ├── File Templates/
│   │   └── [Category]/
│   │       └── [Template Name]/
│   │           ├── _template_metadata.json    # Extracted metadata
│   │           ├── ___FILEBASENAME___.swift   # Raw template
│   │           └── _generated_sample/         # Processed samples
│   │               └── File.swift
│   │
│   └── Project Templates/
│       └── [Category]/
│           └── [Template Name]/
│               ├── _template_metadata.json
│               ├── TemplateInfo.plist
│               └── _README.txt
│
└── GeneratedProjects/
    └── [Category]/
        └── [Project Name]/
            ├── Package.swift
            ├── Sources/
            └── Tests/
```

---

## Generation Process

### Overview

The generation process extracts templates from Xcode and creates:

1. **Metadata JSON** - Parsed from `TemplateInfo.plist`
2. **Raw Template Files** - Copy of original template files
3. **Generated Samples** - Templates with variables substituted
4. **Working Projects** - Buildable Xcode projects (for project templates)

### What Gets Generated

#### For File Templates
- ✅ Template metadata (JSON format)
- ✅ Raw template files (with `___VARIABLE___` patterns)
- ✅ Generated sample files (variables substituted)
- ✅ README with usage instructions

#### For Project Templates
- ✅ Template metadata (JSON format)
- ✅ Complete template bundle structure
- ✅ README with generation instructions
- ⚠️ Working projects (manual generation via Xcode)

---

## Automated Scripts

### Script Location

```bash
Scripts/
├── generate_artifacts.sh       # Main generation script
├── TemplateGenerator.swift     # Swift-based generator
└── README.md                    # Script documentation
```

### Quick Start

```bash
# Generate all artifacts (overwrites existing)
./Scripts/generate_artifacts.sh

# Generate to custom location
./Scripts/generate_artifacts.sh ~/Desktop/CustomLocation

# Generate only file templates
./Scripts/generate_artifacts.sh --files-only

# Generate only project templates
./Scripts/generate_artifacts.sh --projects-only
```

### Script Features

- ✅ Automatically finds Xcode templates
- ✅ Extracts metadata from plist files
- ✅ Processes template variables
- ✅ Creates organized directory structure
- ✅ Generates sample files with context
- ✅ Preserves file permissions
- ✅ Provides progress feedback
- ✅ Validates output

---

## Manual Generation

### Prerequisites

1. **Xcode Installed**
   ```bash
   xcode-select -p
   # Should output: /Applications/Xcode.app/Contents/Developer
   ```

2. **Swift Installed**
   ```bash
   swift --version
   # Should output: Swift version 6.x
   ```

3. **TemplateParser Package**
   ```bash
   cd Packages
   swift build --target TemplateParser
   ```

### Step-by-Step Process

#### 1. Find Template Location

```bash
# List all Xcode templates
find /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates \
  -name "*.xctemplate" -type d
```

#### 2. Create Output Directory

```bash
mkdir -p XcodeTemplateCollection/TemplateArtifacts/File\ Templates
mkdir -p XcodeTemplateCollection/TemplateArtifacts/Project\ Templates
```

#### 3. Process Individual Template

```bash
# Example: Process Swift File template
TEMPLATE_PATH="/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/MultiPlatform/Source/Swift File.xctemplate"
OUTPUT_PATH="XcodeTemplateCollection/TemplateArtifacts/File Templates/MultiPlatform > Source/Swift File"

# Create output directory
mkdir -p "$OUTPUT_PATH"

# Copy template files
cp -R "$TEMPLATE_PATH"/* "$OUTPUT_PATH/"

# Extract metadata (requires plutil or swift-parsing)
plutil -convert json "$TEMPLATE_PATH/TemplateInfo.plist" -o "$OUTPUT_PATH/_template_metadata.json"
```

#### 4. Generate Sample File

```swift
// Use TemplateParser to process template
import TemplateParser

let context = VariableContext(
    fileName: "File.swift",
    fileBaseName: "File",
    projectName: "MyProject",
    packageName: "MyPackage",
    userName: "username",
    fullUserName: "Full Name",
    date: "17.11.2025",
    year: "2025",
    options: [:]
)

let processor = TemplateProcessor()
let templateContent = try String(contentsOfFile: templatePath)
let result = try processor.process(template: templateContent, context: context)

// Save to _generated_sample/
try result.write(toFile: outputPath, atomically: true, encoding: .utf8)
```

---

## Verification

### Check Generated Artifacts

```bash
# Count file templates
find XcodeTemplateCollection/TemplateArtifacts/File\ Templates \
  -name "_template_metadata.json" | wc -l
# Expected: 58

# Count project templates
find XcodeTemplateCollection/TemplateArtifacts/Project\ Templates \
  -name "_template_metadata.json" | wc -l
# Expected: 88

# Verify generated samples
find XcodeTemplateCollection/TemplateArtifacts/File\ Templates \
  -name "_generated_sample" -type d | wc -l
# Expected: 58
```

### Run Integration Tests

```bash
cd Packages
swift test --filter "Integration Tests"
```

Expected output:
```
✅ Process Swift File template from XcodeTemplateCollection
✅ Process SwiftUI View template
✅ Process all file templates successfully
✅ Compare parser output with Xcode-generated sample
✅ Variable transformations work correctly
```

### Validate Artifact Structure

```bash
# Check a specific template artifact
ls -la "XcodeTemplateCollection/TemplateArtifacts/File Templates/MultiPlatform > Source/Swift File/"

# Should contain:
# - _template_metadata.json
# - ___FILEBASENAME___.swift
# - _generated_sample/
#   - File.swift
# - TemplateInfo.plist (optional)
```

---

## Troubleshooting

### Issue: Templates Not Found

**Symptom**: Script reports "Xcode templates not found"

**Solution**:
```bash
# Verify Xcode installation
xcode-select -p

# If wrong path, set correct one
sudo xcode-select -s /Applications/Xcode.app

# Verify templates exist
ls /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/
```

### Issue: Permission Denied

**Symptom**: Cannot read template files

**Solution**:
```bash
# Check permissions
ls -la /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/

# Templates should be world-readable (r--r--r--)
# If not, Xcode installation may be corrupted
```

### Issue: Metadata Extraction Fails

**Symptom**: `_template_metadata.json` files are empty or malformed

**Solution**:
```bash
# Verify plutil works
plutil -lint /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/MultiPlatform/Source/Swift\ File.xctemplate/TemplateInfo.plist

# If plutil fails, use alternative parser
# (Swift-based parser included in Scripts/)
```

### Issue: Generated Samples Missing

**Symptom**: `_generated_sample` directories are empty

**Solution**:
```bash
# Verify TemplateParser builds
cd Packages
swift build --target TemplateParser

# Check if template has sample files
# (Some templates don't have ___FILEBASENAME___ files)
```

### Issue: Integration Tests Fail

**Symptom**: Tests report "Template file not found"

**Solution**:
```bash
# Update test paths in IntegrationTests.swift
# Line 11 should point to correct location:
let templatesBasePath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/XcodeTemplateCollection/TemplateArtifacts"

# Verify artifacts exist
ls -la XcodeTemplateCollection/TemplateArtifacts/File\ Templates/
```

---

## Best Practices

### When to Regenerate

✅ **Do regenerate** when:
- Xcode updates to new version (template changes)
- Adding new template support to parser
- Template structure changes in Xcode
- Validating parser against fresh templates

❌ **Don't regenerate** when:
- Making minor code changes
- Running daily tests
- Templates haven't changed
- Just need to verify existing artifacts

### Version Control

**What to Commit**:
- ✅ Generated artifacts in `XcodeTemplateCollection/`
- ✅ Metadata JSON files
- ✅ Generated sample files
- ✅ README files

**What to .gitignore**:
- ❌ Temporary files during generation
- ❌ Large binary resources (if any)
- ❌ Build artifacts from GeneratedProjects/

### Artifact Hygiene

```bash
# Before regenerating, clean old artifacts
rm -rf XcodeTemplateCollection/TemplateArtifacts/*

# Regenerate fresh
./Scripts/generate_artifacts.sh

# Commit with descriptive message
git add XcodeTemplateCollection/
git commit -m "chore: regenerate template artifacts from Xcode 16.x"
```

---

## Reference

### Template Kinds

All 11 template kinds supported:

1. `Xcode.Xcode3.ProjectTemplateUnitKind` (83 templates)
2. `Xcode.IDEFoundation.TextSubstitutionFileTemplateKind` (44 templates)
3. `Xcode.IDEKit.TextSubstitutionFileTemplateKind` (7 templates)
4. `Xcode.IDESwiftPackageSupport.PackageTemplateKind` (5 templates)
5. `Xcode.IDETestPlanEditor.TestPlanTemplateKind` (1 template)
6. `Xcode.IDEKit.RefactoringFileTemplateKind.NewSuperclass` (1 template)
7-11. SiriKit Intent Builder kinds (5 templates)

### Variable Types

All 5 variable types in templates:

1. **Simple**: `___FILEBASENAME___`
2. **Transformed**: `___FILEBASENAME:identifier___`
3. **Option**: `___VARIABLE_productName___`
4. **UUID**: `___UUID:key___`
5. **Macro**: `___FILEHEADER___`, `___COPYRIGHT___`

### Transformations

All 4 transformations supported:

1. `:identifier` - Swift/ObjC identifier
2. `:RFC1034Identifier` - DNS-compliant identifier
3. `:bundleIdentifier` - Bundle ID format
4. `:c99extidentifier` - C99 identifier

---

## Related Documentation

- [XCODE_TEMPLATE_PARSING_RULES.md](XCODE_TEMPLATE_PARSING_RULES.md) - Complete parsing reference
- [XCODE_TEMPLATE_KINDS_ANALYSIS.md](XCODE_TEMPLATE_KINDS_ANALYSIS.md) - Template taxonomy
- [TEMPLATE_PARSING_STRATEGY.md](TEMPLATE_PARSING_STRATEGY.md) - Parser implementation
- [CLEAN_PROJECT_GUIDE.md](CLEAN_PROJECT_GUIDE.md) - Project setup guide
- [XcodeTemplateCollection/README.md](../XcodeTemplateCollection/README.md) - Artifact collection overview

---

## Summary

Template artifact generation is a **reproducible process** that extracts all 146 Xcode templates and creates parseable artifacts for testing and validation. The artifacts are committed to version control, but can be regenerated at any time from the Xcode application bundle.

**Key Points**:
- ✅ Templates sourced from Xcode bundle
- ✅ 146 total templates (58 file + 88 project)
- ✅ Artifacts committed to Git
- ✅ Regeneration script available
- ✅ Integration tests validate parser
- ✅ Full documentation provided

---

**End of Template Artifact Generation Guide**
