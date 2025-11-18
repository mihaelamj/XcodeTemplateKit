# SwiftUI Documentation Findings

## Research Date
November 17, 2025

## Source
SwiftUI documentation at `/Volumes/Code/DeveloperExt/cupertino_test`

---

## 1. TAP TARGET SIZING (Apple HIG Compliance)

### Minimum Standards
- **Standard tap target**: 44x44 points (Apple Human Interface Guidelines)
- **List row minimum**: 28+ points height recommended
- **Tab bar items**: 44+ points recommended

### Implementation

```swift
// Tab bar items
Button(action: { }) {
    VStack {
        Image(systemName: "icon")
        Text("Label")
    }
    .frame(maxWidth: .infinity, minHeight: 44)  // Minimum tap target
    .padding(.vertical, 12)                      // Additional touch area
    .contentShape(Rectangle())                    // Make entire frame tappable
}
.buttonStyle(.plain)

// List rows
HStack {
    Image(systemName: "icon")
    Text("Item")
}
.frame(minHeight: 28)              // Adequate tap target
.padding(.vertical, 4)             // Additional padding
.contentShape(Rectangle())         // Full row tappable
```

### Key Modifiers
- `.frame(minHeight:)` - Enforce minimum sizes
- `.contentShape(Rectangle())` - Expand hit-testing beyond visual bounds
- `.padding()` - Increase touch areas
- `.buttonStyle(.plain)` - Custom button styling

---

## 2. CODE SYNTAX HIGHLIGHTING

### Using AttributedString with Markdown

```swift
let content = try! AttributedString(
    markdown: "Use `UIView` for custom views."
)

var body: some View {
    Text(content)  // Backticks apply code voice styling
}
```

### InlinePresentationIntent

```swift
var styledCode: AttributedString {
    var code = AttributedString("let x = 42")
    code.inlinePresentationIntent = .code  // Code voice

    // Style specific ranges
    if let range = code.range(of: "let") {
        code[range].swiftUI.foregroundColor = .purple
    }

    return code
}
```

### Monospaced Fonts

```swift
// Font modifier
Text("let x = 42")
    .font(.system(size: 13))
    .monospaced(true)

// OR
Text("let x = 42")
    .font(.custom("Menlo", size: 13))

// For entire VStack
VStack {
    Text("func main() {}")
    Text("    print(\"Hello\")")
}
.monospaced()  // Applies to all children (iOS 16+)
```

---

## 3. CODE DISPLAY BEST PRACTICES

### Scrollable Code Blocks

```swift
ScrollView(.horizontal, showsIndicators: true) {
    Text("""
    func greet() {
        print("Hello")
    }
    """)
    .font(.custom("Menlo", size: 12))
    .monospaced()
    .padding()
    .background(Color(white: 0.95))
    .cornerRadius(6)
}
```

### Complete Code Block Component

```swift
struct CodeBlockView: View {
    let code: String

    var body: some View {
        ScrollView(.horizontal) {
            Text(code)
                .font(.custom("Menlo", size: 13))
                .monospaced()
                .lineSpacing(2)
                .padding(12)
                .background(Color(nsColor: .textBackgroundColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(nsColor: .separatorColor), lineWidth: 1)
                )
        }
    }
}
```

---

## 4. STATE MANAGEMENT (@Observable)

### Modern Pattern (iOS 17+)

```swift
import Observation

@Observable
final class TemplateTreeModel {
    var rootNodes: [TreeNode] = []
    var expandedNodes: Set<String> = []

    // No @Published needed - plain properties work

    func toggleExpansion(for nodeID: String) {
        if expandedNodes.contains(nodeID) {
            expandedNodes.remove(nodeID)
        } else {
            expandedNodes.insert(nodeID)
        }
    }
}

// In View
struct MyView: View {
    var model: TemplateTreeModel  // No property wrapper needed
    @State private var selection: String?

    var body: some View {
        List(selection: $selection) {
            // Use model properties directly
            ForEach(model.rootNodes) { node in
                Text(node.label)
            }
        }
    }
}
```

### Benefits
- **Performance**: Only updates when properties read by body change
- **Simplicity**: No @Published, @ObservedObject, or @StateObject
- **Clean**: Plain `var` in model, plain `var` in view
- **No warnings**: Eliminates "Publishing changes from within view updates"

---

## 5. TEXT ATTRIBUTES FOR CODE STYLING

### Supported Attributes in Text(AttributedString)

**Foundation Attributes:**
- `inlinePresentationIntent` - `.code`, `.emphasized`, `.stronglyEmphasized`
- `foregroundColor` - Text color
- `link` - Hyperlinks
- `writingDirection` - Text direction

**SwiftUI Attributes:**
- `swiftUI.foregroundColor` - Color
- `swiftUI.font` - Font

### Example

```swift
var highlightedCode: AttributedString {
    var code = AttributedString("let message = \"Hello\"")

    // Keyword
    if let letRange = code.range(of: "let") {
        code[letRange].swiftUI.foregroundColor = .purple
        code[letRange].inlinePresentationIntent = .stronglyEmphasized
    }

    // String literal
    if let stringRange = code.range(of: "\"Hello\"") {
        code[stringRange].swiftUI.foregroundColor = .red
    }

    return code
}
```

---

## 6. RECOMMENDED FONTS FOR CODE

### macOS System Fonts
- **Menlo** - Default Xcode font
- **Monaco** - Classic monospaced
- **SF Mono** - Apple's modern mono font

### Usage

```swift
.font(.custom("Menlo", size: 13))
// OR
.font(.system(size: 13, design: .monospaced))
```

---

## 7. TYPE ANNOTATIONS AND VALUE DISPLAY

### Pattern for IDE-like Property Display

```swift
struct PropertyRow: View {
    let key: String
    let value: String
    let type: PropertyType  // Custom enum

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Key with type icon
            HStack(spacing: 4) {
                Image(systemName: type.icon)
                    .font(.system(size: 9))
                    .foregroundStyle(.tertiary)
                Text(key)
                    .font(.system(size: 11))
                    .foregroundStyle(.secondary)
                Spacer()
                Text(type.displayName)  // e.g., "Integer", "Boolean"
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundStyle(.tertiary)
            }

            // Value
            Text(value)
                .font(.system(size: 13))
                .textSelection(.enabled)
        }
    }
}
```

### Type System Example

```swift
enum PropertyType {
    case string
    case integer
    case boolean
    case templateKind
    case arrayOfStrings

    var displayName: String {
        switch self {
        case .string: return "String"
        case .integer: return "Integer"
        case .boolean: return "Boolean"
        case .templateKind: return "TemplateKind"
        case .arrayOfStrings: return "Array<String>"
        }
    }

    var icon: String {
        switch self {
        case .string: return "textformat"
        case .integer: return "number"
        case .boolean: return "checkmark.circle"
        case .templateKind: return "tag"
        case .arrayOfStrings: return "list.bullet"
        }
    }

    var possibleValues: [String] {
        switch self {
        case .boolean:
            return ["true", "false"]
        case .templateKind:
            return TemplateKind.allCases.map { $0.rawValue }
        default:
            return []
        }
    }
}
```

---

## 8. KEY REFERENCE FILES

1. **Monospaced Fonts**:
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/swiftui/documentation_swiftui_font_monospaced.md`
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/swiftui/documentation_swiftui_view_monospaced.md`

2. **Attributed Strings**:
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/swiftui/documentation_swiftui_text_init_-1a4oh.md`
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/foundation/documentation_foundation_attributedstring.md`

3. **Scroll Views**:
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/swiftui/documentation_swiftui_scrollview.md`

4. **Observable Macro**:
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/swiftui/documentation_swiftui_model-data.md`

5. **Lists**:
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/swiftui/documentation_swiftui_lists.md`

6. **Markdown**:
   - `/Volumes/Code/DeveloperExt/cupertino_test/docs/foundation/documentation_foundation_instantiating-attributed-strings-with-markdown-syntax.md`

---

## SUMMARY

### Core Principles
1. **Use @Observable** for models (iOS 17+) - no @Published needed
2. **Minimum 44pt** tap targets for all interactive elements
3. **Use .contentShape(Rectangle())** to expand hit areas
4. **Monospaced fonts** (.custom("Menlo") or .monospaced()) for code
5. **AttributedString** with .code presentation intent for syntax
6. **Show type annotations** like IDEs (Integer, Boolean, etc.)
7. **Display all possible values** for enums and constrained types

### Quick Wins
- Replace @ObservedObject/@StateObject with plain var + @Observable
- Add .frame(minHeight: 44) to all buttons
- Add .contentShape(Rectangle()) to interactive rows
- Use ScrollView(.horizontal) for wide code blocks
- Apply .monospaced() to code text
