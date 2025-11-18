import SwiftUI

/// Displays a labeled property value in a key-value format.
///
/// Shows a label and monospaced value with selectable text.
///
/// ## Example
/// ```swift
/// PropertyRow(label: "Kind", value: "App Template")
/// PropertyRow(label: "Identifier", value: "com.apple.dt.unit.app")
/// ```
struct PropertyRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .top) {
            Text(label + ":")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(width: 80, alignment: .leading)

            Text(value)
                .font(.caption.monospaced())
                .textSelection(.enabled)
        }
    }
}
