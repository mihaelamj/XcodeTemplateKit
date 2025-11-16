# Xcode Template Collection

Complete collection of Xcode template artifacts and generated projects.

## 📁 Structure

```
XcodeTemplateCollection/
├── TemplateArtifacts/        # File template artifacts with samples
│   ├── File Templates/       # All 58 file templates
│   │   ├── MultiPlatform > Source/
│   │   ├── MultiPlatform > Test/
│   │   ├── SiriKit/
│   │   ├── Resource/
│   │   └── ...
│   └── Project Templates/    # All 88 project templates (metadata only)
│       ├── MultiPlatform > Application/
│       ├── MultiPlatform > Framework/
│       └── ...
│
└── GeneratedProjects/        # Actual working projects from templates
    ├── MultiPlatform_Application/
    │   ├── MultiplatformApp/
    │   ├── DocumentApp/
    │   ├── GameProject/
    │   ├── SafariExtensionApp/
    │   └── AudioUnitExtensionApp/
    ├── MultiPlatform_Extension/
    │   ├── GenericExtension/
    │   ├── WidgetExtension/
    │   └── AudioUnitExtension/
    ├── MultiPlatform_Framework/
    │   └── MultiplatformFramework/
    ├── MultiPlatform_Test/
    │   ├── UITestingBundle/
    │   └── UnitTestingBundle/
    └── Other/
        ├── EmptyProject/
        ├── ExternalBuildSystem/
        └── AggregateTarget/
```

## 📊 Contents

### TemplateArtifacts/
- **58 File Templates** - Each with:
  - Template metadata (JSON)
  - Raw template files
  - Generated sample files with variable substitution

- **88 Project Templates** - Each with:
  - Template metadata (JSON)
  - Raw template bundle
  - README with instructions

### GeneratedProjects/
- **14 Working Projects** - Modern Swift Packages:
  - 5 Applications
  - 3 Extensions
  - 1 Framework
  - 2 Test Bundles
  - 3 Other project types

All projects can be opened directly in Xcode and build successfully.

## 🚀 Quick Start

### Browse Template Artifacts
```bash
# View all file template samples
open ~/Documents/XcodeTemplateCollection/TemplateArtifacts/File\ Templates/

# View project template metadata
open ~/Documents/XcodeTemplateCollection/TemplateArtifacts/Project\ Templates/
```

### Open Generated Projects
```bash
# Open a working project in Xcode
open ~/Documents/XcodeTemplateCollection/GeneratedProjects/MultiPlatform_Application/MultiplatformApp

# Or browse all projects
open ~/Documents/XcodeTemplateCollection/GeneratedProjects/
```

### Build and Run
```bash
cd ~/Documents/XcodeTemplateCollection/GeneratedProjects/MultiPlatform_Application/MultiplatformApp
swift build
swift run
```

## 📚 Documentation

See the Templatomat repository for full documentation:
- `TEMPLATE_ANALYSIS.md` - Template structure analysis
- `GENERATED_PROJECTS_SUMMARY.md` - Generated projects guide
- `Scripts/README.md` - Automation scripts documentation

## 🔄 Regenerating

To regenerate all artifacts and projects:

```bash
# Navigate to Templatomat repository
cd ~/Developer/personal/templatomat

# Regenerate file template artifacts
./Scripts/generate_all_artifacts.sh ~/Documents/XcodeTemplateCollection/TemplateArtifacts

# Regenerate projects
./Scripts/generate_all_projects.sh ~/Documents/XcodeTemplateCollection/GeneratedProjects
```

---

**Total Templates Processed**: 146 (58 file + 88 project)
**Working Projects Generated**: 14
**All saved in one convenient location** ✨
