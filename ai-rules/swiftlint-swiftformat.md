# SwiftLint & SwiftFormat Configuration Rules

**Last Updated**: November 17, 2025

---

## 🚨 Critical Rule

**NEVER modify SwiftLint or SwiftFormat configuration files except for path exclusions.**

---

## What This Means

### ❌ FORBIDDEN Changes

**DO NOT modify**:
- Code style rules (indentation, line length, etc.)
- Quality rules (complexity, function length, etc.)
- Naming conventions (identifier names, type names, etc.)
- Custom rules logic
- Warning/error thresholds
- Opt-in rules selection
- Disabled rules (unless adding path exclusions)

### ✅ ALLOWED Changes

**ONLY modify for**:
- Adding path exclusions (`excluded:`)
- Adding path inclusions (`included:`)
- Excluding generated code
- Excluding external dependencies
- Excluding template artifacts
- Excluding build artifacts

---

## Examples

### ✅ ALLOWED: Adding Path Exclusions

```yaml
# GOOD - Adding exclusions for template artifacts
excluded:
  - "*.generated"
  - "Packages/Tests/**"
  - "XcodeTemplateCollection/**"     # NEW - template artifacts
  - "XcodeTemplateCollection_NEW/**" # NEW - generated artifacts
  - "Scripts/**"                      # NEW - external scripts
```

**Reason**: These are not our source files and shouldn't be linted.

---

### ❌ FORBIDDEN: Changing Style Rules

```yaml
# BAD - DO NOT DO THIS
line_length:
  warning: 200  # Changed from 180
  error: 250    # Changed from 180

# BAD - DO NOT DO THIS
disabled_rules:
  - opening_brace
  - operator_whitespace
  - force_cast  # NEW - DO NOT ADD THIS
```

**Reason**: Style rules are project standards. Changing them means avoiding fixing actual code issues.

---

### ❌ FORBIDDEN: Relaxing Quality Rules

```yaml
# BAD - DO NOT DO THIS
cyclomatic_complexity:
  warning: 50  # Changed from 20 - TOO HIGH

# BAD - DO NOT DO THIS
function_body_length:
  warning: 200  # Changed from 50 - TOO HIGH
  error: 300    # Changed from 100 - TOO HIGH

# BAD - DO NOT DO THIS
type_body_length:
  - 500  # Changed from 300 - TOO HIGH
  - 500
```

**Reason**: Quality rules enforce code maintainability. Relaxing them hides code smells.

---

### ❌ FORBIDDEN: Disabling Warnings

```yaml
# BAD - DO NOT DO THIS
force_cast: warning  # Changed from error
force_try: warning   # Changed from error

# BAD - DO NOT DO THIS
disabled_rules:
  - todo  # DO NOT DISABLE
  - trailing_comma  # DO NOT DISABLE
```

**Reason**: Warnings indicate real issues. Disabling them means ignoring problems.

---

## Why This Rule Exists

### 1. **Maintain Code Quality**
- SwiftLint/SwiftFormat enforce project-wide standards
- Changing rules means lowering quality
- Fixing code is better than changing rules

### 2. **Consistency**
- All code follows same standards
- Easy code review
- Predictable codebase

### 3. **Avoid Technical Debt**
- Relaxing rules creates debt
- Harder to fix later
- Compounds over time

### 4. **Professional Standards**
- Industry best practices
- Apple Swift style guide compliance
- Modern Swift conventions

---

## What To Do Instead

### If SwiftLint Complains About Your Code

#### ❌ **WRONG**: Change SwiftLint config
```yaml
# DON'T DO THIS
function_body_length:
  warning: 200  # Increased to avoid warning
```

#### ✅ **RIGHT**: Fix the code
```swift
// DO THIS - Refactor long function
func processTemplate() {
    parseMetadata()
    extractVariables()
    resolveReferences()
    generateOutput()
}

private func parseMetadata() { ... }
private func extractVariables() { ... }
private func resolveReferences() { ... }
private func generateOutput() { ... }
```

---

### If SwiftLint Complains About External Code

#### ❌ **WRONG**: Disable the rule
```yaml
# DON'T DO THIS
disabled_rules:
  - force_cast
```

#### ✅ **RIGHT**: Exclude the external code
```yaml
# DO THIS
excluded:
  - "ThirdParty/**"
  - "Generated/**"
  - "XcodeTemplateCollection/**"
```

---

### If You Think a Rule Is Wrong

#### ❌ **WRONG**: Change it immediately
```yaml
# DON'T DO THIS
line_length: 300  # "I think 180 is too short"
```

#### ✅ **RIGHT**: Follow these steps
1. **Understand why the rule exists**
2. **Try to fix your code first**
3. **If still needed, discuss with team/user**
4. **Only change with explicit approval**
5. **Document why the change was made**

---

## Configuration File Ownership

### `.swiftlint.yml`
- **Owner**: Project standards
- **Changes**: Rare, only with good reason
- **Current config**: Zero tolerance, strict rules
- **Philosophy**: Fix code, not rules

### `.swiftformat`
- **Owner**: Code style standards
- **Changes**: Almost never
- **Current config**: 4-space indent, 180-char width, trailing commas
- **Philosophy**: Consistent formatting everywhere

---

## Valid Reasons to Change Config

### ✅ Acceptable Reasons

1. **Path Exclusions**
   - Generated code (`.generated` files)
   - Third-party code (dependencies)
   - Template artifacts (not our code)
   - Build artifacts (DerivedData, .build)

2. **Project Evolution**
   - Moving to new Swift version with new rules
   - Adopting new best practices
   - Upgrading SwiftLint version with breaking changes

3. **Explicit User Request**
   - User specifically asks to change a rule
   - Documented reason provided
   - Team consensus reached

### ❌ Unacceptable Reasons

1. **Avoiding Warnings**
   - "My code triggers too many warnings"
   - "This function is too long but I don't want to refactor"
   - "I like my style better"

2. **Convenience**
   - "It's faster to change the config"
   - "I don't have time to fix the code"
   - "The rule is annoying"

3. **Disagreement**
   - "I don't like trailing commas"
   - "180 characters is too short"
   - "Force unwrapping is fine"

---

## Current Configuration Standards

### Line Length: 180 characters
**Reason**: Wide monitors, complex Swift code
**Do not change**: Fix by breaking lines appropriately

### Indentation: 4 spaces
**Reason**: Apple Swift conventions
**Do not change**: Use SwiftFormat to fix

### Trailing Commas: Mandatory
**Reason**: Clean diffs, easier to add items
**Do not change**: Add trailing commas

### Function Length: 50 lines (warning), 100 lines (error)
**Reason**: Maintainability, single responsibility
**Do not change**: Extract helper functions

### Type Length: 300 lines (warning/error)
**Reason**: Keep types focused
**Do not change**: Split into smaller types

### Cyclomatic Complexity: 20 (warning)
**Reason**: Code understandability
**Do not change**: Simplify logic, extract functions

---

## Emergency Override

**ONLY IF**:
- User explicitly requests it
- Well-documented reason
- Temporary measure with plan to fix
- Add TODO comment explaining why

**Example**:
```yaml
# TEMPORARY: Excluding Scripts/ while we refactor external code
# TODO: Fix SwiftLint violations in Scripts/ and remove this exclusion
# See issue #123
excluded:
  - "Scripts/**"
```

---

## Summary

### The Golden Rule

> **Fix the code, not the configuration.**

### The Exception

> **Only change configuration for path exclusions (external code, generated code, artifacts).**

### The Philosophy

> **SwiftLint and SwiftFormat are guardians of code quality. They protect us from ourselves. Respect them.**

---

## Quick Checklist

Before changing `.swiftlint.yml` or `.swiftformat`, ask:

- [ ] Is this just adding a path exclusion?
- [ ] If yes → Allowed ✅
- [ ] If no → Ask user first ⚠️
- [ ] Did I try fixing the code instead?
- [ ] Is there explicit user approval?
- [ ] Did I document why this change is needed?

---

**Remember: Code quality standards exist for a reason. Maintain them!** 🎯

---

**Last Updated**: November 17, 2025
**Next Review**: Only when explicitly requested by user
