import SwiftUI
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif

public struct OutlineRowConfiguration: Hashable {
    public let id: String
    public let level: Int
    public let hasChildren: Bool
    public let iconName: String
    public let iconColor: Color
    public let label: String
    public let subtitle: String?
    public let fontSize: CGFloat

    public init(
        id: String,
        level: Int,
        hasChildren: Bool,
        iconName: String,
        iconColor: Color,
        label: String,
        subtitle: String?,
        fontSize: CGFloat
    ) {
        self.id = id
        self.level = level
        self.hasChildren = hasChildren
        self.iconName = iconName
        self.iconColor = iconColor
        self.label = label
        self.subtitle = subtitle
        self.fontSize = fontSize
    }
}

public struct OutlineRowView: View {
    private let configuration: OutlineRowConfiguration
    private let isExpanded: Bool
    private let isSearching: Bool
    private let onToggle: () -> Void

    public init(
        configuration: OutlineRowConfiguration,
        isExpanded: Bool,
        isSearching: Bool,
        onToggle: @escaping () -> Void
    ) {
        self.configuration = configuration
        self.isExpanded = isExpanded
        self.isSearching = isSearching
        self.onToggle = onToggle
    }

    public var body: some View {
        HStack(spacing: 6) {
            Color.clear
                .frame(width: CGFloat(configuration.level) * 14, height: 1)

            if configuration.hasChildren {
                Button(
                    action: onToggle,
                    label: {
                        Image(systemName: "chevron.right")
                            .rotationEffect(.degrees(isExpanded ? 90 : 0))
                            .foregroundStyle(.secondary)
                            .frame(width: 14, height: 14)
                    }
                )
                .buttonStyle(.plain)
                .disabled(isSearching)
            } else {
                Color.clear
                    .frame(width: 14, height: 1)
            }

            Image(systemName: configuration.iconName)
                .foregroundStyle(configuration.iconColor)
                .font(.system(size: max(configuration.fontSize - 1, 8)))
                .frame(width: configuration.fontSize + 4)

            VStack(alignment: .leading, spacing: 2) {
                Text(configuration.label)
                    .font(.system(size: configuration.fontSize))
                    .lineLimit(1)
                if let subtitle = configuration.subtitle {
                    Text(subtitle)
                        .font(.system(size: max(configuration.fontSize - 2, 8)))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
        }
        .frame(minHeight: 28)
        .padding(.vertical, 4)
        .contentShape(Rectangle())
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(configuration.label)
        .accessibilityValue(configuration.subtitle ?? "")
        .accessibilityHint(accessibilityHint ?? "")
        .accessibilityAddTraits(configuration.hasChildren ? .isButton : [])
        .accessibilityAction(named: configuration.hasChildren ? (isExpanded ? "Collapse" : "Expand") : "Select") {
            guard configuration.hasChildren else { return }
            onToggle()
        }
    }

    private var accessibilityHint: String? {
        guard configuration.hasChildren else {
            return "Leaf node"
        }
        return isExpanded ? "Collapse node" : "Expand node"
    }
}

public struct OutlineSearchBar: View {
    @Binding private var text: String
    private let placeholder: String

    public init(text: Binding<String>, placeholder: String = "Search") {
        _text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField(placeholder, text: $text)
                .textFieldStyle(.plain)
            if !text.isEmpty {
                Button(
                    action: { text = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                )
                .buttonStyle(.plain)
            }
        }
        .padding(8)
        .background(searchBackgroundColor)
    }

    private var searchBackgroundColor: Color {
        #if canImport(AppKit)
        return Color(nsColor: .controlBackgroundColor)
        #elseif canImport(UIKit)
        return Color(.secondarySystemBackground)
        #else
        return Color.gray.opacity(0.2)
        #endif
    }
}

public struct OutlineToolbar: View {
    private let onExpandAll: () -> Void
    private let onCollapseAll: () -> Void
    private let onIncreaseFont: (() -> Void)?
    private let onDecreaseFont: (() -> Void)?
    private let onResetFont: (() -> Void)?

    public init(
        onExpandAll: @escaping () -> Void,
        onCollapseAll: @escaping () -> Void,
        onIncreaseFont: (() -> Void)? = nil,
        onDecreaseFont: (() -> Void)? = nil,
        onResetFont: (() -> Void)? = nil
    ) {
        self.onExpandAll = onExpandAll
        self.onCollapseAll = onCollapseAll
        self.onIncreaseFont = onIncreaseFont
        self.onDecreaseFont = onDecreaseFont
        self.onResetFont = onResetFont
    }

    public var body: some View {
        Group {
            Button(
                action: onExpandAll,
                label: {
                    Label("Expand All", systemImage: "arrow.down.right.and.arrow.up.left")
                }
            )

            Button(
                action: onCollapseAll,
                label: {
                    Label("Collapse All", systemImage: "arrow.up.left.and.arrow.down.right")
                }
            )

            if hasFontControls {
                Divider()
            }

            if let onIncreaseFont {
                Button(
                    action: onIncreaseFont,
                    label: {
                        Label("Increase Font Size", systemImage: "textformat.size.larger")
                    }
                )
                .keyboardShortcut("+", modifiers: shortcutModifiers)
            }

            if let onDecreaseFont {
                Button(
                    action: onDecreaseFont,
                    label: {
                        Label("Decrease Font Size", systemImage: "textformat.size.smaller")
                    }
                )
                .keyboardShortcut("-", modifiers: shortcutModifiers)
            }

            if let onResetFont {
                Button(
                    action: onResetFont,
                    label: {
                        Label("Reset Font Size", systemImage: "textformat.size")
                    }
                )
                .keyboardShortcut("0", modifiers: shortcutModifiers)
            }
        }
    }

    private var hasFontControls: Bool {
        onIncreaseFont != nil || onDecreaseFont != nil || onResetFont != nil
    }

    private var shortcutModifiers: EventModifiers {
        #if os(macOS)
        return .command
        #else
        return .control
        #endif
    }
}
