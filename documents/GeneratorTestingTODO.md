# Generator Testing TODO

## Current Status

### ✅ Complete
- **Parser**: All 33 metadata fields can be parsed from plist files (Scanner.swift)
- **Generator**: All 33 metadata fields can be serialized to plist format (Writer.swift)
- **Parser Tests**: All 2,161 parser field tests passing
- **Test Infrastructure**: Fixtures exist for all template kinds

### ❌ Incomplete
- **Generator Tests**: Tests are scaffolded but don't verify output
  - Tests load fixtures but don't parse them into Metadata
  - Tests create empty Metadata objects (with TODOs)
  - Tests don't compare generated output with fixtures
  - Tests pass without actually testing anything

## What's Needed for Round-Trip Testing

### Step 1: Parse Fixture → Metadata
Use existing `Template.Parser.Scanning.Scanner.parseTemplate()` to convert fixture plists into `Template.Model.Metadata` objects.

### Step 2: Generate Metadata → Plist
Use existing `Template.Generator.Writer.createPlist()` to serialize metadata back to plist dictionaries.

### Step 3: Semantic Comparison
Compare generated plist with original fixture:
- All fields present in original must be in generated
- All values must match semantically (same type, same value)
- Order doesn't matter
- Format differences OK (e.g., "YES" vs true for booleans is OK, as long as semantically equal)

## Implementation Plan

1. **Update Generator Test Pattern**:
   ```swift
   @Test("Generate Image for Aggregate")
   func generateAggregate() throws {
       // 1. Load and parse fixture into Metadata
       let fixturePath = #filePath.replacingOccurrences(...)
       let metadata = try parseFixture(at: fixturePath)

       // 2. Generate plist from Metadata
       let writer = Template.Generator.Writer()
       let generatedPlist = try writer.createPlist(from: metadata)

       // 3. Load original fixture for comparison
       let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
       let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

       // 4. Semantic comparison
       try assertSemanticallyEqual(generatedPlist, originalPlist)
   }
   ```

2. **Create Semantic Comparison Helper**:
   - Compare all keys present
   - Compare all values (handling type conversions)
   - Handle boolean format differences (YES/NO vs true/false)
   - Handle nil vs missing key
   - Recursive comparison for nested structures

3. **Apply to All Generator Tests**:
   - Update all 33 field test suites
   - Remove TODOs
   - Verify round-trip for every fixture

## Notes

- Parser already handles all 33 fields correctly
- Generator already handles all 33 fields correctly
- This is purely about **testing** that they work together
- Goal: Verify that parse(fixture) → generate → equals fixture semantically
