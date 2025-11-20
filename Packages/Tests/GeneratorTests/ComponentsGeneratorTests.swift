// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

@Suite("Components Field Generation")
struct ComponentsGeneratorTests {
    @Test("Encode Components with ProductBuildPhaseInjections")
    func encodeComponentsWithInjections() throws {
        let injection = Template.Model.ProductBuildPhaseInjection(
            targetIdentifier: "com.apple.dt.iosApplicationTarget"
        )

        let component = Template.Model.Component(
            identifier: "com.example.extension",
            name: "My Extension",
            productBuildPhaseInjections: [injection]
        )

        let components = Template.Model.Components(components: [component])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(components)

        // Verify encoding as array
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [[String: Any]]
        #expect(plist.count == 1)
        #expect(plist[0]["Identifier"] as? String == "com.example.extension")
        #expect(plist[0]["Name"] as? String == "My Extension")

        let injections = plist[0]["ProductBuildPhaseInjections"] as? [[String: Any]]
        #expect(injections?.count == 1)
        #expect(injections?[0]["TargetIdentifier"] as? String == "com.apple.dt.iosApplicationTarget")
    }

    @Test("Encode multiple Components")
    func encodeMultipleComponents() throws {
        let component1 = Template.Model.Component(
            identifier: "com.example.comp1",
            name: "Component 1",
            productBuildPhaseInjections: nil
        )

        let component2 = Template.Model.Component(
            identifier: "com.example.comp2",
            name: "Component 2",
            productBuildPhaseInjections: nil
        )

        let components = Template.Model.Components(components: [component1, component2])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(components)

        // Decode to verify
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.Components.self, from: data)

        #expect(decoded.components.count == 2)
        #expect(decoded.components[0].identifier == "com.example.comp1")
        #expect(decoded.components[1].identifier == "com.example.comp2")
    }

    @Test("Round-trip Components from fixture")
    func roundTripFromFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Components/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: fixtureURL)
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        guard let componentsArray = originalPlist["Components"] as? [[String: Any]] else {
            Issue.record("Components not found in fixture")
            return
        }

        // Decode
        let componentsData = try PropertyListSerialization.data(fromPropertyList: componentsArray, format: .binary, options: 0)
        let components = try PropertyListDecoder().decode(Template.Model.Components.self, from: componentsData)

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let encodedData = try encoder.encode(components)

        // Decode again
        let decoder = PropertyListDecoder()
        let roundTripped = try decoder.decode(Template.Model.Components.self, from: encodedData)

        #expect(roundTripped.components.count == components.components.count)
    }
}
