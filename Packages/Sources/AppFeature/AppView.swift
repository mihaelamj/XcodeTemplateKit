import SwiftUI

/// Main application view with template browser.
///
/// Presents a template browser that loads and displays all available Xcode templates.
///
/// ## Example
/// ```swift
/// WindowGroup {
///     AppView()
///         .frame(width: 1200, height: 800)
/// }
/// ```
public struct AppView: View {
    public var body: some View {
        TemplateBrowserView()
    }

    public init() {}
}

// MARK: - Preview

#if DEBUG
#Preview("App View") {
    AppView()
        .frame(width: 1200, height: 800)
}
#endif
