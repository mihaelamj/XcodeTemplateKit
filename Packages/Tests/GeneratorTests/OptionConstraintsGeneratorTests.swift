// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

@Suite("OptionConstraints Field Generation")
struct OptionConstraintsGeneratorTests {
    @Test("Encode OptionConstraints")
    func encodeConstraints() throws {
        let constraint = Template.Model.OptionConstraint(
            constraintType: .requirementIfAssociatedTarget,
            identifier: "bundleIdentifierPrefix",
            value: "___ASSOCIATEDTARGET_bundleIdentifier___"
        )

        let constraints = Template.Model.OptionConstraints(constraints: [constraint])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(constraints)

        // Verify encoding as array
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [[String: Any]]
        #expect(plist.count == 1)
        #expect(plist[0]["ConstraintType"] as? String == "RequirementIfAssociatedTarget")
        #expect(plist[0]["Identifier"] as? String == "bundleIdentifierPrefix")
        #expect(plist[0]["Value"] as? String == "___ASSOCIATEDTARGET_bundleIdentifier___")
    }

    @Test("Encode multiple OptionConstraints")
    func encodeMultipleConstraints() throws {
        let constraint1 = Template.Model.OptionConstraint(
            constraintType: .requirementIfAssociatedTarget,
            identifier: "constraint1",
            value: "value1"
        )

        let constraint2 = Template.Model.OptionConstraint(
            constraintType: .requirementIfAssociatedTarget,
            identifier: "constraint2",
            value: "value2"
        )

        let constraints = Template.Model.OptionConstraints(constraints: [constraint1, constraint2])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(constraints)

        // Decode to verify
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.OptionConstraints.self, from: data)

        #expect(decoded.constraints.count == 2)
        #expect(decoded.constraints[0].identifier == "constraint1")
        #expect(decoded.constraints[1].identifier == "constraint2")
    }

    @Test("Round-trip OptionConstraints from fixture")
    func roundTripFromFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/OptionConstraints/App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: fixtureURL)
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        guard let constraintsArray = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            Issue.record("OptionConstraints not found in fixture")
            return
        }

        // Decode
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: constraintsArray, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(Template.Model.OptionConstraints.self, from: constraintsData)

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let encodedData = try encoder.encode(constraints)

        // Decode again
        let decoder = PropertyListDecoder()
        let roundTripped = try decoder.decode(Template.Model.OptionConstraints.self, from: encodedData)

        #expect(roundTripped.constraints.count == constraints.constraints.count)
        #expect(roundTripped.constraints[0].identifier == constraints.constraints[0].identifier)
    }
}
