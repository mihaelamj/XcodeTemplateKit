# UI Design Rules for Template Browser

## Voice Communication
- **Always use Zoe voice** for audio feedback: `say -v "Zoe" "message"`
- Speak important updates and completions to the user

## Tap Target Sizing (Apple HIG Compliance)
- **Minimum tap target**: 44x44 points for all interactive elements
- **Tab bar items**: `minHeight: 44` with `padding(.vertical, 12)`
- **List row items**: `minHeight: 28` with `padding(.vertical, 4)`
- **Always use** `.contentShape(Rectangle())` to ensure entire frame is tappable
- **Always add** proper padding to increase touch areas

## Type Annotations and Value Display
- **Show type information** for all properties like an IDE:
  - Integer (Int)
  - Boolean (Bool)
  - String
  - Array<T>
  - Custom types (TemplateKind, TemplateCategory, etc.)

- **Show all possible values** for each type:
  - Enums: Display all cases with descriptions
  - Boolean: true/false
  - Integer: Show range if applicable
  - String: Show format/pattern if applicable
  - Arrays: Show element type and possible values

## Type Icon Mapping
- `textformat` → String
- `number` → Int, Double, Float
- `checkmark.circle` → Bool
- `list.bullet` → Array
- `folder` → File structure
- `questionmark.circle` → Unknown/Any

## Inspector Tabs
1. **Attributes Tab**: Shows metadata with type annotations
2. **Documentation Tab**: Shows copyable descriptions
3. **Examples Tab**: Shows syntax-highlighted code examples

## State Management
- Use `@Observable` macro (iOS 17+) for models
- No `@Published` needed - plain `var` properties
- Use `@State` for view-level state
- Use `@Binding` for child view connections

## SwiftUI Best Practices
- Prefer dedicated tools over bash: Read, Edit, Write, Glob, Grep
- Use `.buttonStyle(.plain)` for custom button styling
- Use `List` for hierarchical data
- Use `DisclosureGroup` for expandable sections
- Always provide accessibility labels
