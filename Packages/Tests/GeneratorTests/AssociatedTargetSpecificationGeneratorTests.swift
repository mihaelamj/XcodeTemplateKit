// swiftlint:disable:next blanket_disable_command
// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

@Suite("AssociatedTargetSpecification Field Generation")
struct AssociatedTargetSpecificationGeneratorTests {
    @Test("Encode AssociatedTargetSpecification dictionary")
    func encodeSpecDictionary() throws {
        let spec: [String: Any] = [
            "AllowableProductTypes": ["com.apple.product-type.application"],
            "AssociatedTargetIsDependent": true,
            "PopUpTitle": "Target Application:",
        ]

        // Encode
        var plist: [String: Any] = [:]
        plist["AssociatedTargetSpecification"] = spec

        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)

        // Decode to verify
        let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let decodedSpec = decoded["AssociatedTargetSpecification"] as? [String: Any]

        #expect(decodedSpec?["PopUpTitle"] as? String == "Target Application:")
        #expect(decodedSpec?["AssociatedTargetIsDependent"] as? Bool == true)
    }

    @Test("Encode complete AssociatedTargetSpecification")
    func encodeCompleteSpec() throws {
        let spec: [String: Any] = [
            "AllowableProductTypes": [
                "com.apple.product-type.application.on-demand-install-capable",
                "com.apple.product-type.application",
            ],
            "AssociatedTargetIsDependent": true,
            "AssociatedTargetNeedsProductBuildPhaseInjection": true,
            "PopUpDescription": "The application target that will host this new framework.",
            "PopUpTitle": "Embed in Application:",
        ]

        var plist: [String: Any] = [:]
        plist["AssociatedTargetSpecification"] = spec

        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
        let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let decodedSpec = decoded["AssociatedTargetSpecification"] as? [String: Any]

        #expect(decodedSpec?["PopUpTitle"] as? String == "Embed in Application:")
        #expect(decodedSpec?["PopUpDescription"] != nil)
        let productTypes = decodedSpec?["AllowableProductTypes"] as? [String]
        #expect(productTypes?.count == 2)
    }

    @Test("Round-trip from fixture")
    func roundTripFromFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/AssociatedTargetSpecification/Framework_value.plist")
        let originalData = try Data(contentsOf: fixtureURL)
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        let spec = originalPlist["AssociatedTargetSpecification"] as! [String: Any]

        // Encode
        var newPlist: [String: Any] = [:]
        newPlist["AssociatedTargetSpecification"] = spec
        let data = try PropertyListSerialization.data(fromPropertyList: newPlist, format: .xml, options: 0)

        // Decode
        let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let decodedSpec = decoded["AssociatedTargetSpecification"] as? [String: Any]

        #expect(decodedSpec != nil)
        #expect(decodedSpec?["PopUpTitle"] as? String == spec["PopUpTitle"] as? String)
    }
}
