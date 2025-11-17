# Xcode Template Kinds - Complete Analysis

**Date**: 2025-11-16
**Total Templates Found**: 146
**Unique Template Kinds**: 11

## Summary

This document catalogs ALL template kinds found in `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/` and analyzes which ones are supported by our `TemplateParser`.

---

## All Template Kinds (Sorted by Frequency)

### 1. `Xcode.Xcode3.ProjectTemplateUnitKind`
**Count**: 83 templates
**Category**: Project Templates
**Status**: ✅ **SUPPORTED**
**Description**: Traditional Xcode project templates that create full applications, frameworks, extensions, etc.

**Example Path**:
```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/MultiPlatform/Application/App.xctemplate/
```

**Metadata Structure**:
- `Kind`: ProjectTemplateUnitKind identifier
- `Identifier`: Unique template ID (e.g., `com.apple.dt.unit.appTemplate`)
- `Ancestors`: Array of parent template IDs for inheritance
- `Options`: Array of configuration options for project generation
- `Definitions`: Build settings and configurations

---

### 2. `Xcode.IDEFoundation.TextSubstitutionFileTemplateKind`
**Count**: 44 templates
**Category**: File Templates
**Status**: ✅ **SUPPORTED**
**Description**: Standard file templates with variable substitution (Swift files, headers, etc.)

**Example Path**:
```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/MultiPlatform/Source/Swift File.xctemplate/
```

**Metadata Structure**:
- `Kind`: TextSubstitutionFileTemplateKind identifier
- `MainTemplateFile`: The template file with variables (e.g., `___FILEBASENAME___.swift`)
- `AllowedTypes`: File type UTIs
- Variables use pattern: `___VARIABLE_NAME___`

---

### 3. `Xcode.IDEKit.TextSubstitutionFileTemplateKind`
**Count**: 7 templates
**Category**: File Templates (IDE Kit)
**Status**: ✅ **SUPPORTED** (same as #2, different namespace)
**Description**: File templates from IDE Kit framework (similar structure to IDEFoundation)

**Example Path**:
```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/Source/Package Swift File.xctemplate/
```

**Note**: This is functionally identical to `IDEFoundation.TextSubstitutionFileTemplateKind`, just from a different framework. Our parser treats them the same.

---

### 4. `Xcode.IDESwiftPackageSupport.PackageTemplateKind`
**Count**: 5 templates
**Category**: Swift Package Templates
**Status**: ⚠️ **PARTIALLY SUPPORTED**
**Description**: Templates for creating Swift Package Manager packages (libraries, macros, plugins)

**Example Paths**:
```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/MultiPlatform/Library/Library.xctemplate/
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/MultiPlatform/Other/Swift Macro.xctemplate/
```

**Unique Metadata**:
- `PackageType`: `"library"`, `"macro"`, `"plugin"`, etc.
- `Options`: Testing system selection (None, XCTest, Swift Testing)
- No Ancestors or Definitions (simpler than project templates)

**Current Support**: Our parser can read the metadata but doesn't have dedicated `PackageTemplateInfo` model or specific handling for `PackageType` field.

---

### 5. `Xcode.IDETestPlanEditor.TestPlanTemplateKind`
**Count**: 1 template
**Category**: Test Plan Templates
**Status**: ❌ **NOT SUPPORTED**
**Description**: Template for creating `.xctestplan` files

**Example Path**:
```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/MultiPlatform/Test/Test Plan.xctemplate/
```

**Metadata Structure**:
- `Kind`: TestPlanTemplateKind identifier
- `MainTemplateFile`: `___FILEBASENAME___.xctestplan`
- `BuildableType`: `"Hidden"`
- No variable substitution (generates JSON/plist, not code)

**Why Not Supported**: Test plans use JSON structure, not text substitution variables. Would need different parsing approach.

---

### 6. `Xcode.IDEKit.RefactoringFileTemplateKind.NewSuperclass`
**Count**: 1 template
**Category**: Refactoring Templates
**Status**: ❌ **NOT SUPPORTED**
**Description**: Used by Xcode's refactoring tools (Extract Superclass)

**Example Path**:
```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/MultiPlatform/Source/Objective-C new superclass.xctemplate/
```

**Metadata Structure**:
- `Kind`: RefactoringFileTemplateKind.NewSuperclass
- `SupportsSwiftPackage`: Boolean flag
- Minimal metadata (designed for IDE internal use)

**Why Not Supported**: This is an IDE-internal template triggered by refactoring actions, not user-facing template creation. Low priority for our parser.

---

### 7-11. SiriKit Intent Builder Templates

#### 7. `Xcode.IDEIntentBuilderEditor.AppEntityTemplateKind`
**Count**: 1 template
**Status**: ❌ **NOT SUPPORTED**

#### 8. `Xcode.IDEIntentBuilderEditor.AppEnumerationTemplateKind`
**Count**: 1 template
**Status**: ❌ **NOT SUPPORTED**

#### 9. `Xcode.IDEIntentBuilderEditor.IntentTemplateKind`
**Count**: 1 template
**Status**: ❌ **NOT SUPPORTED**

#### 10. `Xcode.IDEIntentBuilderEditor.LinkActionTemplateKind`
**Count**: 1 template
**Status**: ❌ **NOT SUPPORTED**

#### 11. `Xcode.IDEIntentBuilderEditor.TransientAppEntityTemplateKind`
**Count**: 1 template
**Status**: ❌ **NOT SUPPORTED**

**Category**: SiriKit/App Intents Templates
**Description**: Templates for creating App Intents entities, enumerations, and actions (used by Siri and Shortcuts)

**Example Paths**:
```
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/SiriKit/App Entity.xctemplate/
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/SiriKit/App Enum.xctemplate/
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/SiriKit/INIntent subclass.xctemplate/
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/SiriKit/Link action.xctemplate/
/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/SiriKit/Transient App Entity.xctemplate/
```

**Metadata Structure** (all similar):
```
{
    "Kind" = "Xcode.IDEIntentBuilderEditor.AppEntityTemplateKind";
    "DefaultCompletionName" = Class;
    "Description" = "An App Entity.";
    "AllowedTypes" = ("public.swift-source");
    "Options" = ();
    "HiddenFromLibrary" = YES;
    "HiddenFromChooser" = YES;
}
```

**Why Not Supported**: These are IDE-internal templates used by the Intent Builder UI. They're hidden from the template chooser and meant for programmatic generation by Xcode's intent editor, not user-facing file creation. The `HiddenFromLibrary` and `HiddenFromChooser` flags indicate they're not meant for direct use.

---

## Coverage Analysis

### ✅ Fully Supported (130 templates / 89.0%)
- **83** × `Xcode.Xcode3.ProjectTemplateUnitKind`
- **44** × `Xcode.IDEFoundation.TextSubstitutionFileTemplateKind`
- **7** × `Xcode.IDEKit.TextSubstitutionFileTemplateKind` (treated as file templates)

### ⚠️ Partially Supported (5 templates / 3.4%)
- **5** × `Xcode.IDESwiftPackageSupport.PackageTemplateKind`
  - Can parse metadata
  - Missing dedicated model for `PackageType` field
  - Missing specific Swift Package handling logic

### ❌ Not Supported (11 templates / 7.5%)
- **5** × SiriKit Intent Builder templates (hidden, IDE-internal)
- **1** × Test Plan template (different file format)
- **1** × Refactoring template (IDE-internal)

### Priority Assessment

**High Priority** (should add):
- ✅ Swift Package templates - user-facing, important for modern Swift development

**Low Priority** (optional):
- ❌ Test Plan templates - different format (JSON/plist), not text substitution
- ❌ Refactoring templates - IDE-internal only
- ❌ SiriKit templates - hidden from UI, generated programmatically

---

## Recommendations

### 1. Add Full Swift Package Support ✅ HIGH PRIORITY

**Action Items**:
1. Create `PackageTemplateInfo` model in `Packages/Sources/TemplateParser/Metadata/`
2. Add `PackageType` enum: `.library`, `.macro`, `.buildToolPlugin`, `.commandPlugin`, `.empty`
3. Update `UnifiedTemplateProcessor` to detect and handle PackageTemplateKind
4. Add tests for all 5 Swift Package templates

**Impact**: Covers the remaining 3.4% of user-facing templates

### 2. Document Unsupported Templates ✅ COMPLETE

**Action**: This document serves as the reference

### 3. Test Coverage Verification 🔄 IN PROGRESS

**Action Items**:
1. Verify parser works with all 44 `IDEFoundation.TextSubstitutionFileTemplateKind` templates
2. Verify parser works with all 83 `Xcode.Xcode3.ProjectTemplateUnitKind` templates
3. Test edge cases (templates with complex options, ancestors, etc.)

---

## Template Kind Detection Logic

Our parser's `identifyTemplateType()` currently handles:

```swift
public func identifyTemplateType(metadata: [String: Any]) -> TemplateType {
    guard let kind = templateInfoParser.extractKind(from: metadata) else {
        return .unknown
    }

    if kind.contains("FileTemplateKind") {
        return .file
    } else if kind.contains("ProjectTemplateUnitKind") || kind.contains("ProjectTemplateKind") {
        return .project
    } else {
        return .unknown
    }
}
```

**Gaps**:
- Doesn't distinguish between text substitution file templates and SiriKit/RefactoringFileTemplateKind
- Doesn't detect `PackageTemplateKind` specifically
- Treats all unrecognized kinds as `.unknown`

**Recommended Update**:
```swift
public enum TemplateType: String, Sendable {
    case file = "File"
    case project = "Project"
    case package = "Package"
    case testPlan = "TestPlan"
    case refactoring = "Refactoring"
    case siriKitIntent = "SiriKitIntent"
    case unknown = "Unknown"
}
```

---

## Conclusion

Our `TemplateParser` currently supports **89% of all Xcode templates** (130/146), covering all standard file and project templates. The main gap is **Swift Package templates** (5 templates), which should be added for completeness. The remaining unsupported templates (11 total) are either IDE-internal or use different file formats, making them low priority for a general-purpose template parser.
