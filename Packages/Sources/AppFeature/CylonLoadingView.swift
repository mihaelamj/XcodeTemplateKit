import SwiftUI

/// Cylon-style (KITT) scanning animation for loading states
struct CylonLoadingView: View {
    let message: String
    @State private var position: CGFloat = 0
    @State private var isMovingRight = true

    init(_ message: String = "Loading...") {
        self.message = message
    }

    var body: some View {
        VStack(spacing: 20) {
            // Cylon scanner
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background track
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.secondary.opacity(0.2))
                        .frame(height: 4)

                    // Scanning light
                    RoundedRectangle(cornerRadius: 2)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.red.opacity(0),
                                    Color.red.opacity(0.5),
                                    Color.red,
                                    Color.red.opacity(0.5),
                                    Color.red.opacity(0),
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * 0.3, height: 4)
                        .offset(x: position)
                        .shadow(color: .red.opacity(0.8), radius: 8, x: 0, y: 0)
                }
            }
            .frame(height: 4)
            .frame(maxWidth: 300)
            .onAppear {
                startAnimation()
            }

            // Loading text
            Text(message)
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func startAnimation() {
        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            if isMovingRight {
                position = 210 // 300 - 90 (90 is 30% of 300)
            } else {
                position = 0
            }
        }
        isMovingRight.toggle()
    }
}

#Preview {
    CylonLoadingView("Scanning Xcode templates...")
}
