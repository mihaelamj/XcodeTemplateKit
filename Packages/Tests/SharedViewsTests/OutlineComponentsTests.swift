@testable import SharedViews
import SwiftUI
import Testing

@MainActor
struct OutlineComponentsTests {
    @Test("row configuration hashes by ID")
    func rowConfigurationHashable() {
        let config = OutlineRowConfiguration(
            id: "node-1",
            level: 0,
            hasChildren: true,
            iconName: "doc.text",
            iconColor: .blue,
            label: "Node",
            subtitle: "Subtitle",
            fontSize: 13
        )

        let duplicate = OutlineRowConfiguration(
            id: "node-1",
            level: 0,
            hasChildren: true,
            iconName: "doc.text",
            iconColor: .blue,
            label: "Node",
            subtitle: "Subtitle",
            fontSize: 13
        )

        let set = Set([config])
        #expect(set.contains(duplicate))
    }
}
