# Template Generators - Modular Approach

## Strategy

Instead of ONE giant script, we have **specialized scripts per template category**.

## Structure

```
TemplateGenerators/
├── README.md                           (this file)
├── Generate_Multiplatform_App.scpt     (SwiftUI/UIKit, Storage options)
├── Generate_Multiplatform_Game.scpt    (Game templates with options)
├── Generate_Framework.scpt             (Framework variants)
├── Generate_SwiftFile.scpt             (File templates)
├── Generate_SwiftUIView.scpt           (SwiftUI files with options)
└── ... (one per major template category)
```

## Benefits

✅ **Maintainable**: Each script focuses on ONE template type
✅ **Testable**: Test each category independently
✅ **Debuggable**: Easy to fix issues in specific templates
✅ **Extensible**: Add new templates without touching existing scripts
✅ **Parallel**: Run multiple scripts concurrently

## Usage

### Individual Script
```bash
# Generate all variants of Multiplatform App template
osascript Generate_Multiplatform_App.scpt ~/Artifacts/Projects
```

### Orchestrated Batch
```bash
# Run all generators
./RunAllGenerators.sh ~/Artifacts
```

## Script Responsibilities

Each script:
1. Knows its template's options
2. Generates ALL option combinations
3. Saves with descriptive names
4. Logs what was generated
5. Returns success/failure count

## Naming Convention

**Projects**: `Generate_<TemplateName>.scpt`
- `Generate_Multiplatform_App.scpt`
- `Generate_Document_App.scpt`
- `Generate_Game.scpt`

**Files**: `Generate_<FileType>.scpt`
- `Generate_SwiftFile.scpt`
- `Generate_SwiftUIView.scpt`
- `Generate_ObjectiveCFile.scpt`

## Option Variations

Each script hard-codes its known option combinations:

```applescript
-- In Generate_Multiplatform_App.scpt

set optionSets to {¬
    {interface:"SwiftUI", storage:"None", tests:false},¬
    {interface:"SwiftUI", storage:"Core Data", tests:false},¬
    {interface:"SwiftUI", storage:"SwiftData", tests:false},¬
    {interface:"UIKit", storage:"None", tests:false},¬
    -- ... all combinations
}

repeat with options in optionSets
    my generateWithOptions(options)
end repeat
```

## Progress Tracking

Each script outputs:
```
[1/12] Generating: SwiftUI-None-NoTests
✓ Success

[2/12] Generating: SwiftUI-CoreData-NoTests  
✓ Success

...

Summary: 12 generated, 0 failed
```

## Next Steps

1. Start with most important: Multiplatform App
2. Add others incrementally
3. Test each thoroughly
4. Build orchestration last
