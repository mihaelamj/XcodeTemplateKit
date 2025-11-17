# Template Types & Generation Strategy

**Created**: November 17, 2025
**Purpose**: Document ALL Xcode template types and how to generate from each

---

## 🎯 Template Type Overview

Xcode has MULTIPLE template types, each accessed differently:

| Template Type | Location in Xcode | Shortcut | Context Needed | Output |
|--------------|-------------------|----------|----------------|--------|
| **File Templates** | File > New > File | Cmd+N | Open project | .swift, .h, .m files |
| **Project Templates** | File > New > Project | Cmd+Shift+N | None | .xcodeproj + files |
| **Playground Templates** | File > New > Playground | | None | .playground |
| **Package Templates** | File > New > Package | | None | Package.swift + structure |
| **Test Templates** | File > New > File (Test section) | Cmd+N | Open project | XCTest files |
| **UI Test Templates** | File > New > File (Test section) | Cmd+N | Open project | UI test files |

---

## 📂 Template Categories

### **File Templates** (58 total)

Located in: `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/`

Categories:
- **MultiPlatform > Source** (18 templates)
  - Swift File
  - SwiftUI View
  - Objective-C File
  - C File, C++ File
  - Header File
  - Metal File
  - etc.

- **MultiPlatform > User Interface** (5 templates)
  - SwiftUI View
  - Storyboard
  - View
  - etc.

- **MultiPlatform > Resource** (12 templates)
  - Asset Catalog
  - Property List
  - Strings File
  - etc.

- **MultiPlatform > Test** (8 templates)
  - Swift Testing Unit Test
  - XCTest Unit Test
  - XCTest UI Test
  - Test Plan
  - etc.

- **MultiPlatform > Documentation** (7 templates)
  - Documentation Catalog
  - Article File
  - Tutorial File
  - etc.

- **Other** (8 templates)
  - Empty File
  - Configuration Settings File
  - Shell Script
  - etc.

**Generation Method**: Requires an OPEN PROJECT, then Cmd+N

---

### **Project Templates** (88 total)

Located in: `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/`

Categories:
- **MultiPlatform > Application** (15 templates)
  - App
  - Document App
  - Game
  - Safari Extension App
  - Audio Unit Extension App
  - etc.

- **MultiPlatform > Application Extension** (5 templates)
  - Widget Extension
  - Audio Unit Extension
  - Generic Extension
  - etc.

- **MultiPlatform > Framework** (3 templates)
  - Framework
  - Metal Framework
  - XCFramework

- **MultiPlatform > Test** (2 templates)
  - Unit Testing Bundle
  - UI Testing Bundle

- **MultiPlatform > Other** (3 templates)
  - Swift Macro
  - Swift Package
  - etc.

- **Other** (5 templates)
  - Empty
  - Aggregate Target
  - External Build System
  - etc.

**Generation Method**: Cmd+Shift+N (no project needed)

---

## 🔧 Generation Strategy Per Type

### **1. Project Templates** (EASIEST - No context needed)

```applescript
-- Cmd+Shift+N opens dialog directly
keystroke "n" using {command down, shift down}
delay 2

-- Select template, fill options, create
-- Output: Full Xcode project
```

**Automation Complexity**: ⭐ Easy
**Priority**: 🔴 HIGH (most important for validation)

---

### **2. File Templates** (REQUIRES PROJECT CONTEXT)

```applescript
-- FIRST: Create or open a project
-- THEN: Cmd+N for new file
keystroke "n" using command down
delay 2

-- Select file template, create
-- Output: Single file added to project
```

**Challenge**: Need a "dummy project" context

**Solution**:
1. Create a temporary minimal project first
2. Then generate files into it
3. Extract generated files
4. Discard temp project

**Automation Complexity**: ⭐⭐ Medium
**Priority**: 🟡 MEDIUM (important for file-level parsing)

---

### **3. Playground Templates**

```applescript
-- File > New > Playground
-- Or use menu bar clicking

-- Output: .playground bundle
```

**Automation Complexity**: ⭐⭐ Medium
**Priority**: 🟢 LOW (less critical for core parsing)

---

### **4. Package Templates** (Special - uses `swift package init`)

Actually, Swift Package templates are often created via:
```bash
mkdir MyPackage
cd MyPackage
swift package init --type library
```

OR via Xcode: File > New > Package

**Automation Complexity**: ⭐ Easy (command-line)
**Priority**: 🟡 MEDIUM (packages are important)

---

## 📋 Comprehensive Generation Plan

### **Phase 1: Project Templates** (Week 1)

**What**: Generate from all 88 project templates
**How**: AppleScript with Cmd+Shift+N
**Output**: ~88-500 projects (depending on option combinations)

**Steps**:
1. Run TemplateOptionsExtractor.swift → get all project templates + options
2. Generate combination matrix
3. Run automated AppleScript for each combination
4. Validate: Try to build each project

**Script**: `AutoGenerateAllProjects.scpt`

---

### **Phase 2: File Templates** (Week 2)

**What**: Generate from all 58 file templates
**How**: Create temp project, then Cmd+N for each template

**Steps**:
1. Create minimal iOS app project (temp)
2. For each file template:
   - Cmd+N
   - Select template
   - Generate file
   - Extract file content
   - Save to artifacts directory
3. Discard temp project

**Script**: `AutoGenerateAllFiles.scpt`

**Output**: ~58-150 individual files

---

### **Phase 3: Package Templates** (Week 3)

**What**: Generate Swift Package variants
**How**: Command-line `swift package init` + Xcode File > New > Package

**Steps**:
1. Use `swift package init` for standard layouts:
   ```bash
   swift package init --type library
   swift package init --type executable
   swift package init --type tool
   ```
2. Use Xcode automation for special package templates

**Script**: `generate-packages.sh`

**Output**: ~10-20 package variants

---

### **Phase 4: Other Templates** (Week 4)

**What**: Playgrounds, special templates
**How**: Mix of AppleScript and direct file inspection

---

## 🎯 Immediate Next Steps

### **TODAY: Focus on Project Templates**

1. ✅ Run `TemplateOptionsExtractor.swift`
   ```bash
   swift Scripts/TemplateOptionsExtractor.swift project-templates.json
   ```

2. ✅ Review generated JSON to understand options

3. ✅ Update `AutoGenerateAll.scpt` to read from JSON

4. ✅ Test on 5 project templates

5. ✅ Run full batch (88 templates)

### **TOMORROW: File Templates**

1. Create minimal temp project script
2. Build file generation automation
3. Extract and catalog files

---

## 📊 Expected Output Structure

```
XcodeGeneratedArtifacts/
├── README.md                         # What was generated
├── project-templates.json            # Template metadata
├── generation-log.txt                # Full log
│
├── Projects/                         # Phase 1
│   ├── Multiplatform_App/
│   │   ├── SwiftUI-None/
│   │   │   ├── MyApp.xcodeproj/
│   │   │   ├── MyApp/
│   │   │   └── _metadata.json
│   │   ├── SwiftUI-CoreData/
│   │   └── UIKit-None/
│   │
│   ├── Multiplatform_Game/
│   └── ... (all 88 templates)
│
├── Files/                            # Phase 2
│   ├── SwiftFile/
│   │   └── MyFile.swift
│   ├── SwiftUIView/
│   │   └── ContentView.swift
│   └── ... (all 58 templates)
│
├── Packages/                         # Phase 3
│   ├── LibraryPackage/
│   ├── ExecutablePackage/
│   └── ... (all package variants)
│
└── Other/                            # Phase 4
    ├── Playgrounds/
    └── Special/
```

---

## 🚀 Why This Matters

**For each template type, we get**:
- ✅ Ground truth artifacts (actual Xcode output)
- ✅ Option combinations tested
- ✅ Validation data for our parser
- ✅ Understanding of how templates work

**Without this**:
- ❌ We're guessing how templates work
- ❌ Parser might be wrong
- ❌ No way to validate
- ❌ Missing edge cases

---

## 📖 Summary

| Template Type | Count | Automation Method | Priority | Timeline |
|--------------|-------|-------------------|----------|----------|
| Projects | 88 | AppleScript (Cmd+Shift+N) | 🔴 HIGH | Week 1 |
| Files | 58 | AppleScript (Cmd+N + temp project) | 🟡 MED | Week 2 |
| Packages | ~10 | CLI + AppleScript | 🟡 MED | Week 3 |
| Other | ~10 | Mixed | 🟢 LOW | Week 4 |
| **TOTAL** | **~166** | **Various** | | **1 month** |

With option combinations: **~600-1000 total artifacts**

---

**Last Updated**: November 17, 2025
**Status**: Planning → Ready to execute
**Next**: Run TemplateOptionsExtractor.swift
