# Template Scanner Audit Plan (2025-11-18)

## Goals
- Verify that `TemplateScanner` captures **all** metadata present in Apple’s `.xctemplate` bundles.
- Identify discrepancies between the generated JSON (`TemplateInventory`) and the actual template contents on disk.
- Document findings to drive fixes before artifact generation.

## Steps
1. **Regenerate JSON**
   - Run the existing scanner to produce the latest `TemplateInventory` (same data used for `all-templates.json`).
   - Store/inspect the output to use as reference.

2. **Inspect Xcode bundles directly**
   - Traverse `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/` for Project, File, and Package templates.
   - For each `.xctemplate`, read `TemplateInfo.plist`, `Nodes`, localized resources, and any embedded files.

3. **Compare scanner output vs on-disk data**
   - For every template:
     - Compare `kind`, `ancestors`, identifiers.
     - Diff options (`TemplateOptionJSON`) with raw `Definitions` (choices, defaults, descriptions).
     - Diff file trees (`fileStructure`) with actual directory contents.
     - Note metadata the scanner ignores (Commands, localized descriptions, etc.).

4. **Document discrepancies**
   - Summaries per template type (project/file/package).
   - Specific examples where data mismatches (missing files, missing option metadata, etc.).
   - Highlight recurring patterns.

5. **Review & prioritize fixes**
   - Share the discrepancy report so we can decide how to update `TemplateScanner` and the JSON format.

## Next Action
- Run the scanner and begin cross-checking templates.
