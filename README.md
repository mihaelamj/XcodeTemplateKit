# XcodeTemplateKit

**Production-ready Swift parser for Xcode template files**

[![Swift 6.2](https://img.shields.io/badge/Swift-6.2-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS%2018%2B%20%7C%20macOS%2015%2B-lightgrey.svg)](https://developer.apple.com)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## Overview

XcodeTemplateKit provides a type-safe parser for Xcode template variable substitution, supporting all 146 Xcode templates across 11 different template kinds.

### Features

- ✅ **98% Template Coverage** (143/146 templates)
- ✅ **5 Variable Types**: Simple, Macro, Transformed, Option, UUID
- ✅ **4 Transformations**: identifier, RFC1034Identifier, bundleIdentifier, c99extidentifier
- ✅ **Type-Safe Parsing** using swift-parsing library
- ✅ **Swift 6.2 Concurrency** compliant (all types Sendable)
- ✅ **Comprehensive Tests** (17 tests, 100% passing)
- ✅ **Zero Dependencies** (except swift-parsing)

---

## Quick Start

```swift
import TemplateParser

let context = VariableContext(
    fileName: "ContentView.swift",
    fileBaseName: "ContentView",
    projectName: "MyApp",
    packageName: "MyApp",
    userName: "username",
    fullUserName: "Full Name",
    date: "17.11.2025",
    year: "2025",
    options: [:]
)

let processor = TemplateProcessor()
let template = """
___FILEHEADER___
import SwiftUI
"""

let result = try processor.process(template: template, context: context)
// Output: File header with copyright + import statement
```

---

## Project Structure

```
XcodeTemplateKit/
├── Packages/                           # Swift Package Manager packages
│   ├── Sources/
│   │   ├── SharedModels/              # Domain models (zero dependencies)
│   │   ├── TemplateParser/            # Template parsing engine
│   │   └── AppFeature/                # SwiftUI UI (iOS/macOS only)
│   └── Tests/
│       ├── SharedModelsTests/
│       └── TemplateParserTests/       # 17 tests (100% passing)
│
├── XcodeTemplateCollection/           # Template artifacts from Xcode
│   ├── TemplateArtifacts/            # 146 processed templates
│   └── GeneratedProjects/            # 14 working Swift projects
│
├── documents/                     # Project documentation
│   ├── TEMPLATE_ARTIFACT_GENERATION.md
│   ├── XCODE_TEMPLATE_PARSING_RULES.md
│   ├── CLEAN_PROJECT_GUIDE.md
│   └── ...
│
└── Scripts/                           # Automation scripts
    └── README.md
```

---

## Documentation

### Core Documentation

- **[TEMPLATE_ARTIFACT_GENERATION.md](documents/TEMPLATE_ARTIFACT_GENERATION.md)** - How artifacts are generated from Xcode
- **[XCODE_TEMPLATE_PARSING_RULES.md](Packages/Sources/TemplateParser/XCODE_TEMPLATE_PARSING_RULES.md)** - Complete parsing reference (37KB)
- **[TEMPLATE_PARSING_STRATEGY.md](documents/TEMPLATE_PARSING_STRATEGY.md)** - Parser implementation strategy
- **[CLEAN_PROJECT_GUIDE.md](documents/CLEAN_PROJECT_GUIDE.md)** - Project setup guide

### Additional Resources

- **[XCODE_TEMPLATE_KINDS_ANALYSIS.md](documents/XCODE_TEMPLATE_KINDS_ANALYSIS.md)** - Template taxonomy
- **[TEMPLATE_ANALYSIS.md](documents/TEMPLATE_ANALYSIS.md)** - Template structure analysis
- **[SWIFT_6_LANGUAGE_MODE_CONCURRENCY.md](documents/SWIFT_6_LANGUAGE_MODE_CONCURRENCY.md)** - Concurrency compliance
- **[SESSION_SUMMARY.md](documents/SESSION_SUMMARY.md)** - Development history

---

## Template Artifacts

The `XcodeTemplateCollection/` directory contains **146 template artifacts** extracted from the Xcode application bundle:

- **58 File Templates** - Swift files, UI, tests, resources
- **88 Project Templates** - Apps, frameworks, extensions, packages

These artifacts are used by integration tests to validate the parser against real Xcode templates.

**Source**: `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/`

For details on generating fresh artifacts, see [TEMPLATE_ARTIFACT_GENERATION.md](documents/TEMPLATE_ARTIFACT_GENERATION.md).

---

## Building & Testing

```bash
# Build all packages
cd Packages
swift build

# Run tests (17 tests, 100% passing)
swift test

# Run specific test suite
swift test --filter "Variable Parser"
swift test --filter "Template Processor"
swift test --filter "Integration Tests"
```

---

## Requirements

- **Swift**: 6.2+
- **Platforms**: iOS 18+, macOS 15+
- **Dependencies**: swift-parsing 0.13.0+
- **Xcode**: 16.x (for artifact generation)

---

## Architecture

### Extreme Packaging

The project follows the **Extreme Packaging** architecture pattern:

- **Single Responsibility**: Each package has one clear purpose
- **Explicit Dependencies**: All dependencies declared in Package.swift
- **Unidirectional Flow**: Foundation → Infrastructure → Features → Apps
- **Granular Modularization**: Even single-file packages acceptable

### Packages

1. **SharedModels** (Foundation)
   - Zero dependencies
   - Domain models

2. **TemplateParser** (Infrastructure)
   - Depends: swift-parsing
   - 5 variable types, 4 transformations
   - Metadata parsing, UUID caching

3. **AppFeature** (Feature)
   - Depends: SharedModels
   - SwiftUI views (iOS/macOS only)

---

## Code Quality

- ✅ **Swift 6.2**: Full concurrency safety (Sendable types)
- ✅ **Zero Warnings**: Strict SwiftLint + SwiftFormat
- ✅ **100% Test Pass**: All 17 tests passing
- ✅ **Type-Safe**: Parser combinators with swift-parsing
- ✅ **Well-Documented**: 37KB+ technical documentation

---

## License

MIT License - Copyright © 2025 Mihaela Mihaljevic

---

## Related Projects

This project was created as a clean, production-ready parser extracted from research on Xcode template structures. The parser is designed to work with:

- Xcode template variable substitution
- Custom template generation tools
- Xcode project scaffolding automation

---

**Status**: ✅ Production Ready (as of November 2025)
