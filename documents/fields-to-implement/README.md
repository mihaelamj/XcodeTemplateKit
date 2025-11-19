# Complex Fields Implementation Guide

This directory contains detailed documentation for template fields that are currently stored as unparsed binary data (`Data?`) and need proper Swift type implementations.

## Overview

| Field | Occurrences | Priority | Parsing Strategy | Complexity |
|-------|-------------|----------|------------------|------------|
| [Targets](./Targets.md) | 45 | **High** | Hybrid (structured + dynamic) | ⭐⭐⭐⭐ |
| [Definitions](./Definitions.md) | 43 | **High** | Hybrid (structured + dynamic) | ⭐⭐⭐ |
| [OptionConstraints](./OptionConstraints.md) | 8 | Medium | Structured | ⭐⭐ |
| [Components](./Components.md) | 2 | Low | Structured | ⭐⭐ |

## Parsing Strategy Decision Matrix

### When to use **Standard Decodable** (Structured Parsing)
✅ Fixed, well-defined schema
✅ Small, finite set of keys
✅ No complex text parsing needed
✅ Hierarchical structure maps well to Swift types

**Examples:** Components, OptionConstraints

### When to use **Hybrid Approach** (Decodable + Dynamic Types)
✅ Outer structure is known, inner content is variable
✅ Dictionary keys are dynamic (filename-based, setting-based)
✅ Values can be multiple types (polymorphic)
✅ Need to preserve exact structure for later use

**Examples:** Targets, Definitions

### When to use **pointfree-parsing** (Parser Combinators)
✅ Complex text parsing with grammar rules
✅ Nested or recursive structures
✅ Context-dependent parsing
✅ Error recovery and diagnostics needed

**Not needed for current fields** - all have well-defined plist structures

## Implementation Priority

### Phase 1: High-Priority Fields (Common, Complex)
1. **Targets** (45 occurrences)
   - Most complex field
   - Essential for project templates
   - Requires `PropertyListValue` helper type
   - See: [Targets.md](./Targets.md)

2. **Definitions** (43 occurrences)
   - Critical for file templates
   - Requires `DefinitionValue` enum
   - See: [Definitions.md](./Definitions.md)

### Phase 2: Medium-Priority Fields (Validation)
3. **OptionConstraints** (8 occurrences)
   - Important for template validation
   - Straightforward structured parsing
   - See: [OptionConstraints.md](./OptionConstraints.md)

### Phase 3: Low-Priority Fields (Rare)
4. **Components** (2 occurrences)
   - Only used in app extension templates
   - Simple nested structure
   - See: [Components.md](./Components.md)

## Shared Implementation Needs

### PropertyListValue Enum
Required by both Targets and Definitions to handle heterogeneous dictionary values:

```swift
public enum PropertyListValue: Codable, Sendable {
    case string(String)
    case int(Int)
    case bool(Bool)
    case array([PropertyListValue])
    case dictionary([String: PropertyListValue])

    // Helper accessors
    public var stringValue: String? {
        if case .string(let value) = self { return value }
        return nil
    }

    public var intValue: Int? {
        if case .int(let value) = self { return value }
        return nil
    }

    public var boolValue: Bool? {
        if case .bool(let value) = self { return value }
        return nil
    }
}
```

### Template Variable Preservation
All fields must preserve template variables like:
- `___PACKAGENAME___`
- `___FILEBASENAME___`
- `___ASSOCIATEDTARGET_bundleIdentifier___`

**Don't try to resolve these during parsing** - they're substituted by Xcode at instantiation time.

## External Resources

### Xcode Build Settings
- [xcodebuild](https://github.com/mxcl/xcodebuild) - Swift package for working with Xcode build settings
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) - Generates Xcode projects from YAML (extensive build settings handling)

### Related Apple Documentation
- Xcode Template Authoring Guide (if available)
- Property List Programming Guide
- Xcode Build Setting Reference

## Current Status

### Already Implemented ✅
- Simple fields (String, Int, Bool, [String])
- Enum fields (TemplateKind, BuildableType, PackageType, etc.)
- Boolean format handling (Objective-C vs Swift booleans)
- Options field (`[TemplateOptionJSON]`)

### Needs Implementation ⚠️
- Targets (stored as `Data?`)
- Definitions (stored as `Data?`)
- OptionConstraints (stored as `Data?`)
- Components (stored as `Data?`)

### Generator Tests Status
- Parser tests: **2,147 passing** (including 2,065 field tests)
- Generator tests: **Not yet implemented** (waiting for field implementations)

## Testing Strategy

### For Each Field Implementation:
1. **Parser Tests** - Already exist (parsing plist → Swift)
2. **Generator Tests** - Need implementation (Swift → plist)
3. **Round-Trip Tests** - Ensure parse → generate → parse produces identical results

### Test Coverage Goals:
- All 45 Targets fixtures
- All 43 Definitions fixtures
- All 8 OptionConstraints fixtures
- All 2 Components fixtures

Total: **98 fixtures** need proper parsing + generation

## Migration Path

### Step 1: Create Shared Types
```swift
// In TemplateModels package
public enum PropertyListValue { ... }
public struct TargetDefinition { ... }
public struct CodeBlockDefinition { ... }
public struct OptionConstraint { ... }
public struct TemplateComponent { ... }
```

### Step 2: Update TemplateMetadata
```swift
// Change from:
public let targets: Data?

// To:
public let targets: [TargetDefinition]?
```

### Step 3: Update TemplateParser
Implement custom decoding logic for complex fields

### Step 4: Update TemplateWriter
Implement encoding logic to serialize back to plist

### Step 5: Run Tests
Verify all 2,147 parser tests still pass with new types

### Step 6: Implement Generator Tests
Add round-trip tests for each field

## Benefits of Proper Implementation

### Current State (Data storage)
❌ No type safety
❌ Can't inspect field contents without deserializing
❌ Can't validate structure
❌ Generator tests can't verify correctness
❌ Documentation requires examining fixtures

### After Implementation
✅ Full type safety
✅ IDE autocomplete for field access
✅ Compile-time validation
✅ Generator tests can verify round-trip behavior
✅ Self-documenting code via types

## Notes

- The `Options` field is already properly typed as `[TemplateOptionJSON]` - it's **not** in the Data category
- All fields have extensive fixture coverage for testing
- Parser tests already exist for all fields (they just store as Data)
- Generator implementation can start once types are defined

## Next Steps

1. ✅ Document all complex fields (this directory)
2. ⏳ Decide on implementation priority
3. ⏳ Create shared `PropertyListValue` type
4. ⏳ Implement `Targets` field (highest priority)
5. ⏳ Implement `Definitions` field
6. ⏳ Implement `OptionConstraints` field
7. ⏳ Implement `Components` field
8. ⏳ Implement generator tests for all fields
