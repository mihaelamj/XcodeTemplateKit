# XcodeTemplateKit Refactor Plan

This plan sequences the factoring and validation work needed to harden the new outline architecture and keep the SwiftUI inspector maintainable. Each phase ends with explicit validation (tests or manual steps) so we can commit confidently.

## Apple References & Concurrency Requirements
- Primary docs live under `/Volumes/Code/DeveloperExt/cupertino_test`, specifically the structured concurrency guidance in `docs/swift/documentation_swift_taskgroup.md` and related ThrowingTaskGroup/DiscardingTaskGroup pages. These reinforce Swift 6 strict concurrency, Sendable safety, and `withTaskGroup`/`async let` lifetimes.
- Every phase must keep both SwiftUI-driven tasks and background parser work within structured concurrency boundaries—no escaping tasks, no `Task.detached` unless absolutely necessary, and all shared state marked `Sendable` when crossing actor boundaries.

## Phase 1 – Canonical Outline Entry Point _(Completed)_
- **Outcome**: `ExpandableTemplateTreeView` is now the sole sidebar implementation and the legacy `TemplateTreeView` has been removed.
- **Notes**:
  - Navigation wiring already pointed at `ExpandableTemplateTreeView` via `TemplateBrowserView`, so no additional runtime changes were required.
  - This document and `ProjectSummary.md` describe the consolidated setup for future contributors.
  - Proceed to Phase 2 for API stabilization and testing.

## Phase 2 – TemplateTreeModel API Stabilization _(Completed)_
- **Outcome**: `TemplateTreeModel` now caches expandable IDs, filtered node sets, and a lookup dictionary for fast `node(withID:)` access. `TemplateBrowserView` consumes the lookup to avoid ad-hoc recursion.
- **Validation**:
  - Added `AppFeatureTests/TemplateTreeModelTests.swift` using Swift Testing to cover `expandAll`, `flattenedNodes`, `filteredNodes`, and `node(withID:)`.
  - `swift test --test-product AppFeatureTests` currently fails in the sandbox because SwiftPM cannot write to `~/.cache/clang/ModuleCache`; rerun locally to exercise the suite.
  - Targeted `swiftlint` runs over the modified Swift files succeed (apart from the sandbox cache-writing warning).

## Phase 3 – Shared UI Extraction _(Completed)_
- **Outcome**: Introduced the `SharedViews` target (see `Packages/Sources/SharedViews/OutlineComponents.swift`) that hosts reusable outline widgets—`OutlineSearchBar`, `OutlineToolbar`, and `OutlineRowView`. `ExpandableTemplateTreeView` now imports SharedViews so the sidebar layout lives in one place.
- **Validation**:
  - Targeted SwiftLint runs over `ExpandableTemplateTreeView.swift` and the new shared components pass (sandbox still blocks SwiftLint’s cache plist).
  - `swift test` remains blocked by module-cache permissions in this sandbox; rerun locally to exercise the full suite with the new SharedViews dependency.

## Phase 4 – Test Backfill & CI Hook
- **Goal**: Automate regression detection for the outline + parser stack.
- **Tasks**:
  - Resolve local SwiftPM cache permissions so `swift test` can run.
  - Add Swift Testing targets for TemplateTreeModel, parser fixtures, and any new SharedViews utilities.
  - Wire `swift test` + `swiftlint` into pre-commit hooks (already partially enforced).
  - Include concurrency-focused tests (e.g., @MainActor enforcement for SwiftUI code, Sendable conformance checks for async utilities).
- **Validation**:
  - Successful `swift test`.
  - CI/pre-commit output showing both lint + tests pass.

## Phase 5 – Performance & Accessibility Pass
- **Goal**: Ensure the flattened outline performs well on large inventories and remains accessible.
- **Tasks**:
  - Profile expansion/search on large template sets (Instruments + signposts).
  - Run VoiceOver and keyboard navigation to confirm Outline semantics.
  - Capture findings inside `SwiftUIOutlineAnimationPlan.md` for future reference.
- **Validation**:
  - Documented metrics (frame rate, expansion duration) and accessibility checklist results.
  - Bug fixes filed or implemented if issues appear.

We will tackle each phase sequentially, writing or updating tests before merging and committing after every successful milestone.
