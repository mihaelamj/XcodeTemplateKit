import SwiftUI

public struct AppView: View {
    public var body: some View {
        Text("App View")
            .font(.title)
            .padding()
    }
    public init() {}
}

#if DEBUG
#Preview("App View") {
    AppView()
}
#endif
