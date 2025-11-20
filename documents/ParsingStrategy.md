# Template Parsing Strategy

## Overview

The XcodeTemplateKit uses a **hybrid parsing approach** combining PropertyListDecoder (primary) with PointFree swift-parsing (selective) for optimal performance and maintainability.

## Primary Method: PropertyListDecoder

**Use PropertyListDecoder for:**
- ✅ Simple fields (String, Int, Bool, Double)
- ✅ Homogeneous arrays (all elements have same type/structure)
- ✅ Standard dictionaries with predictable structure
- ✅ Codable types with consistent schemas
- ✅ All top-level fields that work well with standard decoding

**Examples of what works well with PropertyListDecoder:**
```swift
// Simple fields
let name = plist["Name"] as? String
let sortOrder = plist["SortOrder"] as? Int
let concrete = plist["Concrete"] as? Bool

// Homogeneous arrays
let platforms = plist["Platforms"] as? [String]
let ancestors = plist["Ancestors"] as? [String]

// Standard Codable structures
let components = try PropertyListDecoder().decode(Components.self, from: data)
let targets = try PropertyListDecoder().decode(Targets.self, from: data)
```

## Secondary Method: PointFree Parsing

**Use PointFree swift-parsing ONLY for special cases:**
- ⚠️ **Heterogeneous structures** - Fields with varying shapes per value
- ⚠️ **Polymorphic values** - Same field can be different types
- ⚠️ **Dynamic property sets** - Unknown/variable properties at compile time
- ⚠️ **Complex validation** - Need custom parsing logic beyond type coercion

## Specific Use Cases for PointFree Parsing

### 1. Options[].Units (PRIMARY CANDIDATE)

**Problem:**
```swift
"Units": {
    "Swift": {
        "Definitions": { ... },
        "Nodes": [ ... ],
        "Project": { ... },
        "RequiredOptions": { ... },
        "Targets": [ ... ]
    },
    "Objective-C": {
        "Definitions": { ... },
        "Components": [ ... ]  // Different properties!
    },
    "Metal 4": {
        "Targets": [ ... ]     // Only Targets!
    }
}
```

Each unit value has **different optional properties**. PropertyListDecoder expects consistent structure.

**Solution:**
```swift
// Step 1: PropertyListDecoder handles Options array
let options = try PropertyListDecoder().decode([Option].self, from: data)

// Step 2: For Units field, use PointFree parser
extension Template.Parser.Content {
    struct UnitItemParser: Parser {
        // Parse heterogeneous unit items
        var body: some Parser<[String: Any], [String: UnitItem]> {
            // Custom parsing logic for variable properties
        }
    }
}

// Step 3: Apply in Scanner
if let unitsDict = optionDict["Units"] as? [String: Any] {
    let unitItems = try UnitItemParser().parse(unitsDict)
    option.units = unitItems
}
```

### 2. Definitions with Special Keys (POTENTIAL CANDIDATE)

**Problem:**
Definitions has keys like `*:implementation:methods:*` where `*` is a wildcard.

**Current approach:** Store as `[String: DefinitionValue]` dictionary
**Alternative with PointFree:** Parse and validate special key patterns

**Decision:** Keep current approach unless we need validation.

### 3. Project Configuration (EVALUATE)

**Problem:**
`Project` field can be:
- A string reference
- A nested dictionary with complex structure
- An enum value

**Current approach:** Use `ProjectConfiguration` enum
**Status:** Working fine with PropertyListDecoder

## Implementation Guidelines

### When to Add PointFree Parsing

**Criteria checklist:**
1. ❓ Does PropertyListDecoder fail or produce incorrect results?
2. ❓ Do we have heterogeneous data (different shapes for same field)?
3. ❓ Do we need custom validation beyond type checking?
4. ❓ Are error messages from PropertyListDecoder insufficient?

**If YES to 2+ questions:** Consider PointFree parsing

**If NO to all:** Keep PropertyListDecoder

### Adding PointFree Parser

**Pattern to follow:**

```swift
// 1. Create parser in appropriate namespace
extension Template.Parser.Content {
    struct SpecialFieldParser: Parser {
        func parse(_ input: inout [String: Any]) throws -> SpecialFieldType {
            // Custom parsing logic
        }
    }
}

// 2. Use in Scanner for specific field
private func parseSpecialField(_ value: Any?) -> SpecialFieldType? {
    guard let dict = value as? [String: Any] else { return nil }

    var input = dict
    return try? SpecialFieldParser().parse(&input)
}

// 3. Integrate in main parseTemplate method
if let specialValue = plist["SpecialField"] {
    metadata.specialField = parseSpecialField(specialValue)
}
```

## Current Status

### Already using PointFree parsing:
- ✅ Template content (variables like `___VARIABLE___`)
- ✅ Transformation syntax parsing
- ✅ Variable token parsing

### Should use PointFree parsing:
- ⚠️ **Options[].Units** - Heterogeneous unit items per value

### Keep PropertyListDecoder:
- ✅ All top-level fields (33 fields)
- ✅ Components
- ✅ Targets (has consistent structure)
- ✅ Definitions (works as generic dictionary)
- ✅ OptionConstraints

## Decision Tree

```
Parsing a new field?
  │
  ├─ Is it a simple type (String, Int, Bool, Array)?
  │  └─ YES → Use PropertyListDecoder ✅
  │
  ├─ Is it a homogeneous structure (all items same shape)?
  │  └─ YES → Use PropertyListDecoder ✅
  │
  ├─ Does it have variable/optional properties per value?
  │  └─ YES → Consider PointFree parsing ⚠️
  │
  ├─ Do you need custom validation or parsing logic?
  │  └─ YES → Consider PointFree parsing ⚠️
  │
  └─ Default: Try PropertyListDecoder first ✅
     └─ If it fails → Add PointFree parser ⚠️
```

## Rationale

**Why hybrid approach:**
1. **Performance** - PropertyListDecoder is optimized and fast
2. **Maintainability** - Standard Codable is familiar to Swift developers
3. **Flexibility** - PointFree handles edge cases PropertyListDecoder can't
4. **Don't reinvent the wheel** - Use built-in tools when they work

**When NOT to use PointFree:**
- ❌ When PropertyListDecoder works fine
- ❌ For simple type coercion
- ❌ Just because we have the dependency
- ❌ To replace working code

**When TO use PointFree:**
- ✅ PropertyListDecoder fundamentally can't handle the structure
- ✅ Need better error messages for complex parsing
- ✅ Have heterogeneous/polymorphic data
- ✅ Need composable parsing logic

## Example: Units Field Implementation

### Step 1: Define UnitItem Type

```swift
extension Template.Model {
    /// Item in Options[].Units dictionary
    /// Each key (Swift, Objective-C, Metal, etc.) maps to a UnitItem
    /// with varying optional properties
    public struct UnitItem: Codable, Hashable, Sendable {
        public let definitions: Definitions?
        public let nodes: [String]?
        public let project: ProjectConfiguration?
        public let requiredOptions: [String: String]?
        public let targets: Targets?
        public let components: [Component]?

        // Custom init for parser
        public init(
            definitions: Definitions? = nil,
            nodes: [String]? = nil,
            project: ProjectConfiguration? = nil,
            requiredOptions: [String: String]? = nil,
            targets: Targets? = nil,
            components: [Component]? = nil
        ) {
            self.definitions = definitions
            self.nodes = nodes
            self.project = project
            self.requiredOptions = requiredOptions
            self.targets = targets
            self.components = components
        }
    }
}
```

### Step 2: Create PointFree Parser

```swift
import Parsing

extension Template.Parser.Content {
    struct UnitItemParser: Parser {
        func parse(_ input: inout [String: Any]) throws -> Template.Model.UnitItem {
            // Parse each optional field
            let definitions = parseDefinitions(input["Definitions"])
            let nodes = input["Nodes"] as? [String]
            let project = parseProject(input["Project"])
            let requiredOptions = input["RequiredOptions"] as? [String: String]
            let targets = parseTargets(input["Targets"])
            let components = parseComponents(input["Components"])

            return Template.Model.UnitItem(
                definitions: definitions,
                nodes: nodes,
                project: project,
                requiredOptions: requiredOptions,
                targets: targets,
                components: components
            )
        }

        private func parseDefinitions(_ value: Any?) -> Template.Model.Definitions? {
            // Use existing Definitions parser
            guard let dict = value as? [String: Any] else { return nil }
            // ... parse logic
        }

        // Similar helpers for other fields...
    }
}
```

### Step 3: Integrate in Scanner

```swift
extension Template.Parser.Scanning.Scanner {
    private func parseUnits(_ value: Any?) -> [String: Template.Model.UnitItem]? {
        guard let unitsDict = value as? [String: Any] else { return nil }

        var result: [String: Template.Model.UnitItem] = [:]

        for (key, value) in unitsDict {
            guard var unitDict = value as? [String: Any] else { continue }

            if let unitItem = try? UnitItemParser().parse(&unitDict) {
                result[key] = unitItem
            }
        }

        return result.isEmpty ? nil : result
    }

    // Use in extractOptions:
    if let unitsDict = optionDict["Units"] as? [String: Any] {
        option.units = parseUnits(unitsDict)
    }
}
```

## Summary

**Default to PropertyListDecoder** - It's fast, standard, and works for 90% of cases.

**Add PointFree parsing selectively** - Only when PropertyListDecoder fundamentally can't handle the structure (like Options[].Units with heterogeneous properties).

**Don't replace what works** - Keep existing PropertyListDecoder-based parsing that's working correctly.

**Evaluate case-by-case** - Each complex field should be evaluated independently to determine the best parsing approach.
