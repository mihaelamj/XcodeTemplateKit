import Foundation
import Models
@testable import Parser
import Testing

@Suite("AssociatedTargetSpecification Parser Tests - Explicit")
struct AssociatedTargetSpecificationParserTests {
    @Test("Parse AssociatedTargetSpecification from Framework fixture")
    func parseFrameworkSpec() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/AssociatedTargetSpecification/Framework_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        // AssociatedTargetSpecification is a dictionary in plists
        let value = plist["AssociatedTargetSpecification"] as? [String: Any]
        #expect(value != nil)
        #expect(value?["AllowableProductTypes"] != nil)
        #expect(value?["PopUpTitle"] as? String == "Embed in Application:")
    }

    @Test("Parse AssociatedTargetSpecification from Multiplatform fixture")
    func parseMultiplatformSpec() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/AssociatedTargetSpecification/Multiplatform_App_Extension_Base_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let value = plist["AssociatedTargetSpecification"] as? [String: Any]
        #expect(value != nil)
    }

    @Test("Round-trip AssociatedTargetSpecification dictionary")
    func roundTripSpec() throws {
        let spec: [String: Any] = [
            "AllowableProductTypes": ["com.apple.product-type.application"],
            "AssociatedTargetIsDependent": true,
            "PopUpTitle": "Target Application:",
        ]

        // Encode
        var plist: [String: Any] = [:]
        plist["AssociatedTargetSpecification"] = spec

        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)

        // Decode
        let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let decodedSpec = decoded["AssociatedTargetSpecification"] as? [String: Any]

        #expect(decodedSpec?["PopUpTitle"] as? String == "Target Application:")
        #expect(decodedSpec?["AssociatedTargetIsDependent"] as? Bool == true)
    }
}
