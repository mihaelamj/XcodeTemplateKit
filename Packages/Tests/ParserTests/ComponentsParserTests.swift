import Foundation
import Models
@testable import Parser
import Testing

@Suite("Components Parser Tests")
struct ComponentsParserTests {
    @Test("Parse Components from Safari Extension App")
    func parseSafariExtensionComponents() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Components/Safari_Extension_App_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        // Extract Components array
        guard let componentsArray = plist["Components"] as? [[String: Any]], !componentsArray.isEmpty else {
            Issue.record("Components not found in plist")
            return
        }

        // Convert to proper format for Components decoding
        let componentsData = try PropertyListSerialization.data(fromPropertyList: componentsArray, format: .binary, options: 0)
        let components = try PropertyListDecoder().decode(Template.Model.Components.self, from: componentsData)

        #expect(components.components.count == 6)

        // Verify first component
        let firstComponent = components.components[0]
        #expect(firstComponent.identifier == "com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared")
        #expect(firstComponent.name == "Shared (App)")
        #expect(firstComponent.productBuildPhaseInjections == nil)

        // Verify component with ProductBuildPhaseInjections
        let iOSExtension = components.components.first { $0.name == "iOS (Extension)" }
        #expect(iOSExtension != nil)
        #expect(iOSExtension?.productBuildPhaseInjections?.count == 1)
        #expect(iOSExtension?.productBuildPhaseInjections?.first?.targetIdentifier == "com.apple.dt.iosApplicationTarget")
    }

    @Test("Parse Components with multiple injections")
    func parseAudioUnitExtensionComponents() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Components/Audio_Unit_Extension_App_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        guard let componentsArray = plist["Components"] as? [[String: Any]], !componentsArray.isEmpty else {
            Issue.record("Components not found in plist")
            return
        }

        let componentsData = try PropertyListSerialization.data(fromPropertyList: componentsArray, format: .binary, options: 0)
        let components = try PropertyListDecoder().decode(Template.Model.Components.self, from: componentsData)

        #expect(!components.components.isEmpty)

        // Verify all components have required fields
        for component in components.components {
            #expect(!component.identifier.isEmpty)
            #expect(!component.name.isEmpty)
        }
    }

    @Test("Parse empty Components")
    func parseEmptyComponents() throws {
        let emptyArray: [[String: Any]] = []
        let data = try PropertyListSerialization.data(fromPropertyList: emptyArray, format: .binary, options: 0)
        let components = try PropertyListDecoder().decode(Template.Model.Components.self, from: data)

        #expect(components.components.isEmpty)
    }

    @Test("Round-trip Components encoding and decoding")
    func roundTripComponents() throws {
        // Create Components
        let component1 = Template.Model.Component(
            identifier: "com.example.component1",
            name: "Component 1",
            productBuildPhaseInjections: nil
        )

        let injection = Template.Model.ProductBuildPhaseInjection(
            targetIdentifier: "com.apple.dt.iosApplicationTarget"
        )
        let component2 = Template.Model.Component(
            identifier: "com.example.component2",
            name: "Component 2",
            productBuildPhaseInjections: [injection]
        )

        let components = Template.Model.Components(components: [component1, component2])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(components)

        // Decode
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.Components.self, from: data)

        #expect(decoded.components.count == 2)
        #expect(decoded.components[0].identifier == "com.example.component1")
        #expect(decoded.components[0].productBuildPhaseInjections == nil)
        #expect(decoded.components[1].identifier == "com.example.component2")
        #expect(decoded.components[1].productBuildPhaseInjections?.count == 1)
    }
}
