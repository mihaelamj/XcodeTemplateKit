# SwiftUI Outline Animation Remediation

This note catalogs the concrete source updates needed to stop the sidebar rows from jumping upward before settling when a node expands. Every change references the relevant code plus the primary Apple docs inside `/Volumes/Code/DeveloperExt/cupertino_test/`.

## Goal

Adopt SwiftUI’s purpose-built outline APIs so that each tree node occupies its own list row, letting the system animate insertions naturally instead of resizing the parent disclosure row.

## Targeted Source Changes

### 1. `ExpandableTemplateTreeView` (`Packages/Sources/AppFeature/ExpandableTemplateTreeView.swift`)

- **Current behavior**: Manual recursion builds nested `DisclosureGroup`s inside a single `List` row (`lines 30-196`). SwiftUI first collapses the row back to the label, then re-expands it, which produces the “jump up, then down” glitch.
- **Action taken**: Flatten the tree into a `[FlattenedNode]` collection (node + depth) and render it with a single `List` row per node. Each row shows its own indent, chevron, and label while expansion state lives in `TemplateTreeModel.expandedNodes`. This mirrors OutlineGroup semantics (per `documentation_swiftui_outlinegroup.md`) but keeps programmatic expand/collapse support.
- **Result**: Rows now animate by inserting/removing siblings rather than resizing parent rows, eliminating the bounce while honoring toolbar expand/collapse controls.

### 2. Search + expansion coupling (`ExpandableTemplateTreeView.swift` lines 30-65)

- **Current behavior**: `filteredNodes` mutates `treeModel.expandedNodes` while SwiftUI is computing the body, violating “no state changes during view update” guidance and cancelling animations.
- **Action taken**: Move filtering logic into `TemplateTreeModel.filteredNodes(matching:)` (pure) and have the view compute `flattenedNodes` with an `autoExpandAll` flag during active search.
- **Result**: No runtime warnings, and search results display fully expanded without touching the live expansion set.

### 3. Toolbar actions (`ExpandableTemplateTreeView.swift` lines 105-112)

- **Current behavior**: `expandAll()` / `collapseAll()` toggle hundreds of IDs instantly with no animation, so rows snap open/closed.
- **Proposed change**: Wrap both calls in `withAnimation(.easeInOut(duration: 0.25)) { … }` and, after switching to OutlineGroup, call `treeModel.expandedNodes = Set(treeModel.allExpandableIDs)` so the outline grows/shrinks with the same transaction.
- **Expected result**: Bulk expand/collapse transitions feel consistent with individual disclosure gestures.

### 4. Row sizing

- **Current behavior**: Row height depends on the nested child stack, so SwiftUI keeps recomputing constraints and briefly shrinks the row before expansion.
- **Proposed change**: Apply `.environment(\.defaultMinListRowHeight, 28)` and consistent `listRowInsets` to the outline `List` (see `documentation_swiftui_environmentvalues_defaultminlistrowheight.md`). With OutlineGroup, each row keeps a constant height while children insert beneath it.
- **Expected result**: Stable layout metrics remove the original justification for `.animation(nil, …)` and produce predictable tap targets.

### 5. `TemplateTreeModel` helpers

- **Current behavior**: `expandAll()` builds a Set by recursing every time; search also mutates the same set. There are no utilities for “collect all expandable IDs”.
- **Proposed change**: Add internal helpers (`allExpandableIDs`, `matchingIDs(for searchText:)`) and make `expandAll()`/`collapseAll()` pure so they can be animated by callers.
- **Expected result**: Cleaner API for OutlineGroup bindings and less duplicated traversal logic.

### 6. Legacy `TemplateTreeView` (`Packages/Sources/AppFeature/TemplateTreeView.swift`)

- **Status**: Removed. `ExpandableTemplateTreeView` is the single authoritative outline implementation, eliminating duplicated state and toolbar logic.
- **Follow-up**: Future sidebar work should continue to evolve `ExpandableTemplateTreeView` and shared components rather than recreating alternate tree views.

### 7. Data strategy for large outlines

- **Current behavior**: Nodes are rebuilt when filtering or expanding to avoid materializing the entire tree, which produces new IDs each time and invalidates SwiftUI’s animation state.
- **Proposed change**: Keep the full `TemplateTreeModel` tree resident (20k nodes is manageable) and let the UI be lazy. OutlineGroup and `List` already render rows on demand, so you don’t pay the cost of 20k views at once. If you must defer child construction, hand OutlineGroup stable IDs plus a lightweight on-demand children provider rather than recreating whole subtrees.
- **Expected result**: Stable identity enables smooth animations and persistent selection while avoiding heavy rendering costs.

## Validation Plan

1. Run the app on macOS and iPadOS simulators. Expand/collapse multiple depths to ensure rows no longer bounce.
2. Trigger the search field and verify OutlineGroup auto-expands matches without warnings about “publishing changes during view updates.”
3. Use accessibility VoiceOver to confirm OutlineGroup exposes tree semantics (built-in trait support).
4. Re-run `swiftformat`/`swiftlint` and the existing parser tests to ensure no regressions.

Once these changes land, update `SWIFTUI_FINDINGS.md` with any new best practices learned from the OutlineGroup adoption.
