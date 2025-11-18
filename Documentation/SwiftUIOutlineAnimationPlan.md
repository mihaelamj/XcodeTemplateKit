# SwiftUI Outline Animation Remediation

This note catalogs the concrete source updates needed to stop the sidebar rows from jumping upward before settling when a node expands. Every change references the relevant code plus the primary Apple docs inside `/Volumes/Code/DeveloperExt/cupertino_test/`.

## Goal

Adopt SwiftUI’s purpose-built outline APIs so that each tree node occupies its own list row, letting the system animate insertions naturally instead of resizing the parent disclosure row.

## Targeted Source Changes

### 1. `ExpandableTemplateTreeView` (`Packages/Sources/AppFeature/ExpandableTemplateTreeView.swift`)

- **Current behavior**: Manual recursion builds nested `DisclosureGroup`s inside a single `List` row (`lines 30-196`). SwiftUI first collapses the row back to the label, then re-expands it, which produces the “jump up, then down” glitch.
- **Proposed change**: Replace the inner `ForEach + TreeNodeView` stack with an `OutlineGroup(treeModel.rootNodes, children: \.children)` inside the `List`. Each node renders through a single `TreeNodeRow` that handles icon, font, and selection. Bind the branch’s `isExpanded` to `treeModel.expandedNodes` so OutlineGroup can animate insertions smoothly (`documentation_swiftui_outlinegroup.md`).
- **Expected result**: Rows animate by inserting siblings rather than resizing the parent, eliminating the bounce and giving macOS/iPadOS-native outline gestures for free.

### 2. Search + expansion coupling (`ExpandableTemplateTreeView.swift` lines 30-65)

- **Current behavior**: `filteredNodes` mutates `treeModel.expandedNodes` while SwiftUI is computing the body, violating “no state changes during view update” guidance and cancelling animations.
- **Proposed change**: Keep `filteredNodes` pure (just return filtered data). Use `onChange(of: searchText)` to `withAnimation` expand matching IDs and store a filtered tree snapshot in a new `@State` cache.
- **Expected result**: No more runtime warnings, and animations remain intact because all mutations happen inside explicit transactions.

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

- **Current behavior**: Maintains `expandedCategories`/`expandedKinds` plus toolbar actions that never read those sets, which confuses future contributors.
- **Proposed change**: Either remove the unused state or hook it up to the OutlineGroup-based implementation. Document whichever view remains the canonical sidebar so there aren’t two divergent approaches.
- **Expected result**: One authoritative outline implementation, reducing maintenance overhead.

## Validation Plan

1. Run the app on macOS and iPadOS simulators. Expand/collapse multiple depths to ensure rows no longer bounce.
2. Trigger the search field and verify OutlineGroup auto-expands matches without warnings about “publishing changes during view updates.”
3. Use accessibility VoiceOver to confirm OutlineGroup exposes tree semantics (built-in trait support).
4. Re-run `swiftformat`/`swiftlint` and the existing parser tests to ensure no regressions.

Once these changes land, update `SWIFTUI_FINDINGS.md` with any new best practices learned from the OutlineGroup adoption.
