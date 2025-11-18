# XcodeTemplateKit Project Summary

This document collects the essential context so you can skim the entire effort quickly.

## Purpose

- Extract every Xcode template (`/Applications/Xcode.app/.../Templates`) and model its metadata (`TemplateMetadata`, `TemplateOptionJSON`, `FileNode`) via `TemplateScanner`.
- Parse template variables/macros with `TemplateParser` so custom tooling can instantiate templates deterministically.
- Provide an inspector UI (`AppFeature`) that loads the live inventory, visualizes the full hierarchy, and exposes inspector tabs for attributes, documentation, and examples.

## Architecture Snapshot

| Layer | Location | Notes |
| --- | --- | --- |
| Domain models | `Packages/Sources/SharedModels` | Pure data structures, no dependencies. |
| Parser + scanner | `Packages/Sources/TemplateParser` | Uses `swift-parsing`; `TemplateScanner` reads plists and builds the tree. |
| UI feature | `Packages/Sources/AppFeature` | SwiftUI NavigationSplitView + inspector tabs; depends on SharedModels + TemplateParser. |
| Docs & scripts | `Documentation/`, `Scripts/` | Detailed parsing strategy, automation helpers. |

## Outline View Refactor (Current Work)

- **Problem**: Nested `DisclosureGroup`s caused rows to jump upward when expanding because each parent row resized before its children were inserted.
- **Solution**: Flatten the tree into `[FlattenedNode]` (node + depth) so each outline row is independent. Expansion now inserts rows instead of resizing parents, aligning with Apple’s OutlineGroup behavior.
- **Key files**:
  - `Packages/Sources/AppFeature/TemplateTreeModel.swift` — adds `FlattenedNode`, `filteredNodes(matching:)`, and helpers to collect/flatten IDs.
  - `Packages/Sources/AppFeature/ExpandableTemplateTreeView.swift` — renders the flattened list, auto-expands search results without touching live state, animates toolbar expand/collapse, and enforces `defaultMinListRowHeight`.
  - `Documentation/SwiftUIOutlineAnimationPlan.md` — records the remediation strategy and data guidelines for large outlines.
- **Status**: `ExpandableTemplateTreeView` is now the canonical sidebar; the legacy `TemplateTreeView` implementation has been removed.

## Outstanding Items

- `swift test` currently fails before compiling because SwiftPM cannot write to `/Users/mmj/.cache/clang/ModuleCache`. Re-run once filesystem permissions are granted to exercise `SharedModels` and `TemplateParser` test suites.
- UI tests do not exist; consider snapshot/unit coverage for `TemplateTreeModel` transformations when time allows.

## Quick Next Steps

1. Verify the new outline UI manually on macOS/iPadOS (open/close branches, run search, test toolbar actions).
2. Resolve SwiftPM cache permissions and run `swift test`.
3. Extend the inspector or documentation as needed, referencing this summary for context.
