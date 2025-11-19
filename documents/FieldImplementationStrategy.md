# Field Implementation Strategy

## Overview

This document outlines the strategy for implementing all 33 template fields found in Xcode's TemplateInfo.plist files.

**Current Status:** 5/33 fields implemented (15%)

## Architecture

### Parsing Approach
- **Technology:** Foundation's `PropertyListSerialization` (NOT swift-parsing or Yams)
- **Location:** `TemplateScanner.swift:parseTemplate(at:templateType:)`
- **Pattern:** Extract from plist dictionary → Add to TemplateMetadata struct → Include in Codable support

### Implementation Steps Per Field

For each field, we need to:

1. **Extract in TemplateScanner** (line ~134):
   ```swift
   let fieldName = plist["FieldName"] as? Type
   ```

2. **Add to TemplateMetadata struct** (TemplateTreeBuilder.swift:~310):
   ```swift
   public let fieldName: Type?
   ```

3. **Add to initializer** (TemplateTreeBuilder.swift:~333):
   ```swift
   fieldName: Type? = nil
   ```

4. **Add to init(from decoder:)** (TemplateTreeBuilder.swift:~358):
   ```swift
   fieldName = try container.decodeIfPresent(Type.self, forKey: .fieldName)
   ```

5. **Add to encode(to encoder:)** (TemplateTreeBuilder.swift:~380):
   ```swift
   try container.encodeIfPresent(fieldName, forKey: .fieldName)
   ```

6. **Add CodingKey** (TemplateTreeBuilder.swift:~394):
   ```swift
   case fieldName
   ```

7. **Write real tests** (Tests/FieldTests/{FieldName}Tests/{FieldName}Tests.swift)

## Field Classification

### ✅ Implemented (5 fields)

| Field | Type | Complexity | Templates | Status |
|-------|------|------------|-----------|--------|
| **Kind** | String | Simple | 146/146 | ✅ Complete |
| **Identifier** | String | Simple | 87/146 | ✅ Complete |
| **Ancestors** | [String] | Simple Array | 83/146 | ✅ Complete |
| **Options** | [[String: Any]] | Complex Array | 23/146 | ✅ Complete |
| **Description** | String | Simple | 69/146 | ✅ Complete |

### 🟡 Simple String Fields (13 fields)

These are straightforward `String?` extractions:

| Field | Templates | Notes |
|-------|-----------|-------|
| **AssociatedTargetSpecification** | 5 | Target association ID |
| **BuildableType** | 16 | Build phase type |
| **DefaultCompletionName** | 69 | Default filename |
| **HiddenFromChooser** | 9 | UI visibility flag (stored as string) |
| **HiddenFromLibrary** | 9 | Library visibility flag |
| **Icon** | 5 | Icon filename |
| **Image** | 59 | Image asset name |
| **MainTemplateFile** | 47 | Primary template file |
| **Name** | 9 | Display name |
| **NameOfInitialFileForEditor** | 8 | Initial file to open |
| **PackageType** | 5 | Swift Package type |
| **Project** | 10 | Project configuration |
| **Summary** | _Unknown_ | Template summary text |

**Implementation Priority:** HIGH (easy wins, low risk)

### 🟢 Simple Boolean Fields (6 fields)

These are `Bool?` extractions:

| Field | Templates | Notes |
|-------|-----------|-------|
| **Concrete** | 17 | Is concrete template |
| **LocalizedByDefault** | 2 | Localization flag |
| **ProjectOnly** | 1 | Project-only template |
| **SupportsSwiftPackage** | 25 | Swift Package support |
| **SuppressTopLevelGroup** | 3 | Group suppression |
| **TargetOnly** | 7 | Target-only template |

**Implementation Priority:** HIGH (trivial, safe)

### 🟠 Simple Integer Field (1 field)

| Field | Templates | Type | Notes |
|-------|-----------|------|-------|
| **SortOrder** | 41 | Int? | UI sort order |

**Implementation Priority:** HIGH (trivial)

### 🔴 Array Fields (4 fields)

Arrays of primitive types:

| Field | Templates | Type | Notes |
|-------|-----------|------|-------|
| **AllowedTypes** | 26 | [String]? | UTI types allowed |
| **Nodes** | 40 | [String]? | Node identifiers |
| **Platforms** | 73 | [String]? | Platform identifiers |
| **Title** | 6 | _Verify type_ | Could be String or [String] |

**Implementation Priority:** MEDIUM (slightly more complex parsing)

### 🔴 Complex Dictionary Fields (3 fields)

Nested dictionaries requiring custom types:

| Field | Templates | Type | Complexity |
|-------|-----------|------|------------|
| **Definitions** | 28 | [String: Any] | HIGH - Complex nested structure |
| **Components** | 2 | [[String: Any]] | MEDIUM - Array of component dictionaries |
| **Targets** | 71 | [[String: Any]] | HIGH - Array of target configurations |

**Implementation Priority:** LOW (requires careful type modeling)

### 🔴 Advanced Dictionary Field (1 field)

| Field | Templates | Type | Complexity |
|-------|-----------|------|------------|
| **OptionConstraints** | 8 | [String: Any] | HIGH - Constraint rules |

**Implementation Priority:** LOW (complex validation logic)

## Implementation Phases

### Phase 1: Quick Wins (20 fields)
**Estimated time:** 2-3 hours
**Risk:** Very Low

Implement all Simple String, Boolean, and Integer fields:
- 13 String fields
- 6 Boolean fields
- 1 Integer field

These follow the exact same pattern as Description and Identifier.

### Phase 2: Simple Arrays (4 fields)
**Estimated time:** 1 hour
**Risk:** Low

Implement array fields that are just `[String]?`:
- AllowedTypes
- Nodes
- Platforms
- Title (after verifying type)

These follow the Ancestors pattern.

### Phase 3: Complex Structures (4 fields)
**Estimated time:** 4-6 hours
**Risk:** Medium-High

Implement complex nested structures:
1. **Components** - Array of component dictionaries
2. **Targets** - Array of target configurations (most complex)
3. **Definitions** - Nested template definitions
4. **OptionConstraints** - Constraint validation rules

These require:
- Custom Codable types
- Careful analysis of all variations
- Comprehensive tests

## Recommended Implementation Order

### Batch 1: Strings (Day 1, 2-3 hours)
1. AssociatedTargetSpecification
2. BuildableType
3. DefaultCompletionName
4. HiddenFromChooser
5. HiddenFromLibrary
6. Icon
7. Image
8. MainTemplateFile
9. Name
10. NameOfInitialFileForEditor
11. PackageType
12. Project
13. Summary

### Batch 2: Booleans + Integer (Day 1, 30 min)
14. Concrete
15. LocalizedByDefault
16. ProjectOnly
17. SupportsSwiftPackage
18. SuppressTopLevelGroup
19. TargetOnly
20. SortOrder

### Batch 3: Arrays (Day 2, 1 hour)
21. AllowedTypes
22. Nodes
23. Platforms
24. Title

### Batch 4: Complex (Day 3-4, 6 hours)
25. Components
26. Targets
27. Definitions
28. OptionConstraints

## Testing Strategy

### For Each Field:
1. Load fixture with field present → Verify extraction
2. Load fixture with field missing → Verify nil handling
3. Load fixture with multiple examples → Verify variations
4. Verify JSON encoding/decoding roundtrip

### Test Pattern:
```swift
@Test("Parse {Field} from template")
func parse{Field}() throws {
    let fixturePath = #filePath.replacingOccurrences(
        of: "{Field}Tests.swift",
        with: "Fixtures/Example_value.plist"
    )
    let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
    let plist = try PropertyListSerialization.propertyList(
        from: plistData,
        format: nil
    ) as! [String: Any]

    let field = plist["{Field}"] as? {Type}

    #expect(field != nil, "{Field} should be present")
    #expect(field == {expectedValue}, "{Field} should match expected value")
}
```

## Success Criteria

- [ ] All 33 fields extracted from plist
- [ ] All 33 fields in TemplateMetadata struct
- [ ] All 33 fields support Codable (encode/decode)
- [ ] All 33 test suites have real implementations (not .disabled())
- [ ] All 136+ tests passing
- [ ] TemplateInventory.json contains all field data
- [ ] Documentation updated with all field descriptions

## Current Test Infrastructure

✅ 33 separate test targets created
✅ All fixtures copied to test directories
✅ Test structure follows ExtremePackaging principles
✅ 5 fields have real test implementations
⏳ 28 fields have placeholder tests (.disabled())

## Notes

- **Maintain backward compatibility:** All new fields should be optional (`?`)
- **Preserve unknown values:** Use `.unknown(String)` pattern where applicable
- **Document prevalence:** Note how many templates use each field
- **Reference fixtures:** All field examples are in Tests/FieldTests/*/Fixtures/
