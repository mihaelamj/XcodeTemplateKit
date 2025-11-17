# Phase 0: Comprehensive Template Generation Plan

**Created**: November 17, 2025
**Priority**: 🔴 HIGHEST - Must complete before Phase 1
**Status**: Planning

---

## 🎯 Goal

**Generate EVERY possible combination of EVERY Xcode template through actual Xcode automation to create ground truth reference data.**

---

## 💡 Why This is Critical

### **The Multi-Layer Reality of Xcode Templates**

When you create a new file or project in Xcode:

1. **Select Template** → "Multiplatform App"
2. **Xcode Shows Options Dialog** →
   - Interface: SwiftUI / UIKit
   - Storage: None / Core Data / SwiftData
   - Include Tests: Yes / No
   - Include UI Tests: Yes / No
3. **Fill in Variables** →
   - Product Name: "MyApp"
   - Organization: "Acme Inc"
   - Bundle ID: "com.acme.myapp"
4. **Xcode Generates Files** → Different combinations produce DIFFERENT code!

### **What We're Missing**

Currently we have:
- ❌ Template `.xctemplate` files (static)
- ❌ Our parser (untested against real output)
- ❌ Assumptions about how options work

What we NEED:
- ✅ Actual generated output from ALL combinations
- ✅ Verified working projects that compile
- ✅ Ground truth to validate our parser against
- ✅ Understanding of how options affect generation

---

## 📋 Complete Generation Plan

### **Step 1: Template Inventory** (1-2 days)

**Goal**: Catalog every template and its options

**Tasks**:

1. **Extract All Template Metadata**
   ```swift
   // For each .xctemplate in Xcode.app/Contents/Developer/Library/Xcode/Templates/

   struct TemplateInventory {
       let name: String
       let kind: String  // file vs project
       let category: String
       let identifier: String
       let options: [TemplateOption]
   }

   struct TemplateOption {
       let name: String
       let type: OptionType  // boolean, popup, text, static
       let defaultValue: Any
       let choices: [String]?  // for popup
       let description: String
   }
   ```

2. **Calculate Combination Matrix**
   ```
   Example: Multiplatform App

   Interface: 2 choices (SwiftUI, UIKit)
   Storage: 3 choices (None, CoreData, SwiftData)
   Include Tests: 2 choices (Yes, No)
   Include UI Tests: 2 choices (Yes, No)

   Total combinations: 2 × 3 × 2 × 2 = 24 variants
   ```

3. **Generate Combination Catalog**
   ```json
   {
     "template": "Multiplatform App",
     "identifier": "com.apple.dt.unit.multiPlatform.app",
     "totalCombinations": 24,
     "combinations": [
       {
         "id": "combo-001",
         "options": {
           "interface": "SwiftUI",
           "storage": "None",
           "includeTests": true,
           "includeUITests": false
         }
       },
       {
         "id": "combo-002",
         "options": {
           "interface": "SwiftUI",
           "storage": "CoreData",
           "includeTests": true,
           "includeUITests": false
         }
       },
       // ... 22 more combinations
     ]
   }
   ```

**Deliverable**: `TemplateInventory.json` with all templates and combinations

---

### **Step 2: Enhanced AppleScript Automation** (2-3 days)

**Goal**: Automate Xcode to generate ALL combinations

**Required Enhancements**:

1. **Template Navigation**
   - Find template in sidebar by name
   - Handle nested categories
   - Select correct template programmatically

2. **Option Selection**
   - Identify option UI elements (radio buttons, checkboxes, popups)
   - Set values for each option
   - Handle conditional options (options that appear based on other selections)

3. **Variable Input**
   - Fill in project/file name
   - Fill in organization name
   - Fill in bundle identifier
   - Handle optional fields

4. **Output Management**
   - Create organized directory structure
   - Name outputs based on combination ID
   - Save metadata alongside generated files
   - Handle existing files (overwrite vs skip)

**New Script Structure**:

```applescript
on generateAllCombinations(templateName, combinations, outputBaseDir)
    repeat with combo in combinations
        set comboID to id of combo
        set options to options of combo

        -- Create output directory
        set outputDir to outputBaseDir & "/" & templateName & "/" & comboID

        -- Open Xcode new project dialog
        openXcodeNewProjectDialog()

        -- Navigate to template
        selectTemplate(templateName)

        -- Fill in options
        repeat with opt in options
            setOption(name of opt, value of opt)
        end repeat

        -- Fill in variables
        setProjectName("Generated_" & comboID)
        setOrganization("XcodeTemplateKit")

        -- Generate
        clickNext()
        selectOutputLocation(outputDir)
        clickCreate()

        -- Save metadata
        saveMetadata(outputDir, combo)

        -- Close project
        closeProject()

        delay 2
    end repeat
end generateAllCombinations
```

**Deliverable**: `GenerateAllCombinations.scpt` - robust automation script

---

### **Step 3: Actual Generation** (1 week - mostly automated)

**Goal**: Run the automation and generate everything

**Process**:

1. **Prepare Environment**
   ```bash
   # Clean Xcode derived data
   rm -rf ~/Library/Developer/Xcode/DerivedData/*

   # Create output directory
   mkdir -p ~/XcodeGeneratedArtifacts

   # Close all Xcode windows
   osascript -e 'quit app "Xcode"'
   ```

2. **Run Generation Script**
   ```bash
   osascript GenerateAllCombinations.scpt \
       --inventory TemplateInventory.json \
       --output ~/XcodeGeneratedArtifacts \
       --mode batch \
       --log generation.log
   ```

3. **Monitor Progress**
   - Real-time logging
   - Error handling (screenshot on failure)
   - Resume capability (if Xcode crashes)
   - Progress tracking (X/Y completed)

4. **Estimated Output**
   ```
   File Templates:
   ~58 templates × ~2-3 combinations = ~150 files

   Project Templates:
   ~88 templates × ~5-10 combinations = ~500-800 projects

   Total Artifacts:
   ~650-1000 generated items

   Estimated Time:
   - Average 30 seconds per generation
   - Total: ~5-8 hours of automated execution
   - Spread over 1 week (with retries, error handling)
   ```

**Deliverable**: `~/XcodeGeneratedArtifacts/` directory with ALL generated code

---

### **Step 4: Compilation Validation** (1 week)

**Goal**: Verify generated projects actually compile and run

**Process**:

1. **Build All Projects**
   ```swift
   // For each generated project:

   func buildProject(at path: String) -> BuildResult {
       let process = Process()
       process.launchPath = "/usr/bin/xcodebuild"
       process.arguments = [
           "-project", "\(path)/Project.xcodeproj",
           "-scheme", "App",
           "-destination", "generic/platform=iOS",
           "clean", "build"
       ]

       process.launch()
       process.waitUntilExit()

       return BuildResult(
           success: process.terminationStatus == 0,
           log: captureOutput(),
           errors: parseErrors()
       )
   }
   ```

2. **Categorize Results**
   ```json
   {
     "buildResults": {
       "successful": 450,
       "failed": 200,
       "totalAttempted": 650,
       "successRate": "69%"
     },
     "failureReasons": {
       "missingFiles": 50,
       "compilerErrors": 100,
       "signingIssues": 30,
       "unknownErrors": 20
     }
   }
   ```

3. **Document Build Failures**
   - Capture full build logs
   - Categorize error types
   - Identify patterns in failures
   - Determine if template bugs or generation issues

**Deliverable**: `BuildResults.json` with compilation status for all projects

---

### **Step 5: Cataloging & Analysis** (3-4 days)

**Goal**: Organize and analyze all generated artifacts

**Tasks**:

1. **Create Metadata Index**
   ```json
   {
     "template": "Multiplatform App",
     "combination": "SwiftUI-CoreData-Tests",
     "metadata": {
       "generated": "2025-11-17T10:30:00Z",
       "template_path": "/Applications/Xcode.app/.../MultiPlatform App.xctemplate",
       "options": {
         "interface": "SwiftUI",
         "storage": "CoreData",
         "includeTests": true,
         "includeUITests": false
       },
       "files_generated": [
         "MyApp/ContentView.swift",
         "MyApp/MyAppApp.swift",
         "MyApp/Persistence.swift",
         "MyApp/MyApp.xcdatamodeld",
         "MyAppTests/MyAppTests.swift"
       ],
       "build_status": "success",
       "file_count": 12,
       "total_lines": 345
     }
   }
   ```

2. **Compare Variants**
   ```
   # For each template, compare all combinations

   MultiPlatform App:
   ├─ SwiftUI-None:
   │  ├─ ContentView.swift (50 lines)
   │  └─ MyAppApp.swift (20 lines)
   ├─ SwiftUI-CoreData:
   │  ├─ ContentView.swift (50 lines) [SAME as None]
   │  ├─ MyAppApp.swift (25 lines) [+5 lines - persistence]
   │  └─ Persistence.swift (80 lines) [NEW FILE]
   └─ SwiftUI-SwiftData:
      ├─ ContentView.swift (55 lines) [+5 lines - @Query]
      └─ MyAppApp.swift (25 lines) [+5 lines - modelContainer]

   Pattern: Storage option adds files and modifies AppApp.swift
   ```

3. **Extract Patterns**
   - Common files across all variants
   - Files added by specific options
   - Code changes based on options
   - Variable substitution patterns

4. **Generate Comparison Reports**
   ```markdown
   # Template: Multiplatform App

   ## Base Files (All Variants)
   - ContentView.swift
   - {ProjectName}App.swift
   - Assets.xcassets

   ## Conditional Files

   ### Storage = CoreData
   - Persistence.swift
   - {ProjectName}.xcdatamodeld

   ### Storage = SwiftData
   - (modifies existing files, no new files)

   ### includeTests = true
   - {ProjectName}Tests/{ProjectName}Tests.swift

   ### includeUITests = true
   - {ProjectName}UITests/{ProjectName}UITests.swift
   ```

**Deliverable**: `ArtifactCatalog/` with organized analysis and reports

---

## 📂 Output Directory Structure

```
~/XcodeGeneratedArtifacts/
├── README.md                       # Overview of generation process
├── TemplateInventory.json          # All templates and their options
├── GenerationLog.txt              # Full log of generation process
├── BuildResults.json              # Compilation results
│
├── FileTemplates/
│   ├── SwiftFile/
│   │   └── default/
│   │       ├── File.swift
│   │       ├── metadata.json
│   │       └── build.log
│   │
│   ├── SwiftUIView/
│   │   ├── with-preview/
│   │   │   ├── ContentView.swift
│   │   │   └── metadata.json
│   │   └── without-preview/
│   │       ├── ContentView.swift
│   │       └── metadata.json
│   │
│   └── [56 more file templates...]
│
├── ProjectTemplates/
│   ├── MultiplatformApp/
│   │   ├── SwiftUI-None-NoTests/
│   │   │   ├── MyApp.xcodeproj/
│   │   │   ├── MyApp/
│   │   │   │   ├── ContentView.swift
│   │   │   │   ├── MyAppApp.swift
│   │   │   │   └── Assets.xcassets/
│   │   │   ├── metadata.json
│   │   │   ├── build.log
│   │   │   └── build-status.json
│   │   │
│   │   ├── SwiftUI-CoreData-Tests/
│   │   │   ├── MyApp.xcodeproj/
│   │   │   ├── MyApp/
│   │   │   │   ├── ContentView.swift
│   │   │   │   ├── MyAppApp.swift
│   │   │   │   ├── Persistence.swift
│   │   │   │   ├── MyApp.xcdatamodeld/
│   │   │   │   └── Assets.xcassets/
│   │   │   ├── MyAppTests/
│   │   │   │   └── MyAppTests.swift
│   │   │   ├── metadata.json
│   │   │   ├── build.log
│   │   │   └── build-status.json
│   │   │
│   │   └── [22 more combinations...]
│   │
│   ├── DocumentApp/
│   │   └── [all combinations...]
│   │
│   └── [86 more project templates...]
│
└── Analysis/
    ├── Patterns.md                # Common patterns across templates
    ├── OptionEffects.md           # How each option affects output
    ├── VariableSubstitution.md   # Variable replacement rules
    ├── CompilationReport.md       # Build success/failure analysis
    └── Comparisons/
        ├── MultiplatformApp-variants.diff
        ├── SwiftUIView-variants.diff
        └── [more comparison files...]
```

---

## 🛠️ Tools We Need to Build

### **1. Template Inventory Scanner**

```swift
// Scans all .xctemplate bundles and extracts metadata

struct TemplateInventoryScanner {
    func scanAllTemplates() -> TemplateInventory {
        let templatesPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates"

        let fileTemplates = scanDirectory("\(templatesPath)/File Templates")
        let projectTemplates = scanDirectory("\(templatesPath)/Project Templates")

        return TemplateInventory(
            fileTemplates: fileTemplates,
            projectTemplates: projectTemplates,
            totalCombinations: calculateTotalCombinations()
        )
    }

    func extractOptions(from plist: PropertyList) -> [TemplateOption] {
        // Parse Options, RequiredOptions, AllowedTypes, Units
        // Calculate all possible combinations
    }
}
```

### **2. Combination Generator**

```swift
// Generates all possible option combinations

struct CombinationGenerator {
    func generateCombinations(for template: Template) -> [OptionCombination] {
        let options = template.options

        // For boolean options: [true, false]
        // For popup options: all choices
        // For text options: sample values

        return cartesianProduct(of: options)
    }
}
```

### **3. AppleScript Automation Framework**

```applescript
-- Enhanced automation with error recovery

on generateCombination(template, combination, outputDir)
    try
        openXcode()
        navigateToTemplate(template)
        setAllOptions(combination)
        fillVariables()
        generate()
        saveTo(outputDir)
        return {success: true}
    on error errMsg
        takeScreenshot()
        logError(errMsg)
        return {success: false, error: errMsg}
    end try
end generateCombination
```

### **4. Build Validator**

```swift
// Attempts to compile all generated projects

struct BuildValidator {
    func validateAll(in directory: URL) async -> BuildResults {
        let projects = findAllXcodeProjects(in: directory)

        var results: [BuildResult] = []

        for project in projects {
            let result = await build(project)
            results.append(result)
        }

        return BuildResults(results: results)
    }

    func build(_ project: URL) async -> BuildResult {
        // Use xcodebuild to compile
        // Capture output
        // Parse errors
        // Return result
    }
}
```

### **5. Artifact Analyzer**

```swift
// Analyzes and compares generated artifacts

struct ArtifactAnalyzer {
    func compareVariants(for template: String) -> VariantComparison {
        let variants = loadAllVariants(template)

        let commonFiles = findCommonFiles(across: variants)
        let conditionalFiles = findConditionalFiles(across: variants)
        let codeDifferences = analyzeCodeDifferences(between: variants)

        return VariantComparison(
            common: commonFiles,
            conditional: conditionalFiles,
            differences: codeDifferences
        )
    }
}
```

---

## ⏱️ Detailed Timeline

### **Week 1: Inventory & Tooling**
- Days 1-2: Build Template Inventory Scanner
- Days 3-4: Create Combination Generator
- Day 5: Test on small subset (5 templates)

### **Week 2: Automation**
- Days 1-2: Enhance AppleScript automation
- Days 3-4: Add error handling and recovery
- Day 5: Test automation on 10 templates

### **Week 3: Generation**
- Days 1-5: Run automated generation (monitored)
- Generate all ~650-1000 combinations
- Handle failures and retries

### **Week 4: Validation**
- Days 1-3: Build all projects
- Days 4-5: Analyze build results

### **Week 5: Analysis**
- Days 1-2: Create comparison reports
- Days 3-4: Extract patterns
- Day 5: Document findings

**Total: 5 weeks** to complete Phase 0

---

## 🎯 Success Criteria

✅ **Generated ALL template combinations** (~650-1000 artifacts)
✅ **Attempted to compile ALL projects**
✅ **>70% compilation success rate** (some templates may have bugs)
✅ **Complete metadata catalog** for all variants
✅ **Comparison reports** showing option effects
✅ **Pattern library** of common structures
✅ **Ground truth dataset** for parser validation

---

## 🔗 Integration with Phase 1

**After Phase 0 completes, we have**:
- ✅ Real-world examples of every template combination
- ✅ Ground truth to test parser against
- ✅ Understanding of how options affect output
- ✅ Working projects to verify our generation

**Then Phase 1 becomes**:
- Use real artifacts to validate parser
- Compare parser output vs actual Xcode output
- Ensure character-for-character matching
- Handle edge cases found in real templates

**Flow**:
```
Phase 0: Generate Everything
    ↓
Phase 1: Parse Everything (validate against Phase 0 output)
    ↓
Phase 1.5: Visualize Everything (show Phase 0 artifacts)
    ↓
Phase 2: Analyze Patterns (from Phase 0 data)
    ↓
Phase 3: Build API (based on Phase 0 & 2 insights)
    ↓
Phase 4: Generate Templates (validate against Phase 0)
```

---

## 📊 Expected Learnings

From this exercise, we'll discover:

1. **How options work**
   - Which options add files
   - Which options modify existing files
   - How options interact with each other
   - Default values and their effects

2. **Variable substitution rules**
   - Where variables appear
   - How transformations are applied
   - Macro expansion details
   - Edge cases in replacement

3. **Template inheritance**
   - How Ancestors work
   - What Concrete means
   - Inheritance vs composition
   - Override mechanisms

4. **Conditional logic**
   - IncludeIf/ExcludeIf patterns
   - RequiredOptionsForValues
   - Complex conditions (AND/OR)
   - Validation rules

5. **Quality insights**
   - Which templates are buggy
   - Which combinations don't compile
   - Common errors in templates
   - Best vs worst practices

---

## 🚀 Immediate Next Steps

1. **Commit current work** ✅ (ROADMAP.md, PHASE_0_GENERATION_PLAN.md)

2. **Build Template Inventory Scanner** (2 days)
   - Swift script to scan all .xctemplate bundles
   - Extract metadata from TemplateInfo.plist
   - Parse options and calculate combinations
   - Output TemplateInventory.json

3. **Enhance AppleScript automation** (2 days)
   - Improve template navigation
   - Add option selection logic
   - Implement error recovery
   - Test on sample templates

4. **Run pilot generation** (1 day)
   - Test on 10 representative templates
   - Verify output structure
   - Validate metadata capture
   - Fix issues before full run

5. **Execute full generation** (1 week)
   - Run on all templates
   - Monitor progress
   - Handle errors
   - Catalog results

---

**This changes everything!** By generating ALL combinations first, we build a solid foundation of ground truth that makes everything else easier and more accurate.

---

**Last Updated**: November 17, 2025
**Status**: Planning → Ready to implement
**Next Step**: Build Template Inventory Scanner
