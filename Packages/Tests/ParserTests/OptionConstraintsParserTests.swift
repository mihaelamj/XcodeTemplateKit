import Foundation
import Models
@testable import Parser
import Testing

@Suite("OptionConstraints Parser Tests")
struct OptionConstraintsParserTests {
    @Test("Parse OptionConstraints from App Extension Base")
    func parseAppExtensionConstraints() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/OptionConstraints/App_Extension_Base_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        guard let constraintsArray = plist["OptionConstraints"] as? [[String: Any]], !constraintsArray.isEmpty else {
            Issue.record("OptionConstraints not found in plist")
            return
        }

        // Convert to proper format for OptionConstraints decoding
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: constraintsArray, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(Template.Model.OptionConstraints.self, from: constraintsData)

        #expect(constraints.constraints.count == 1)

        let firstConstraint = constraints.constraints[0]
        #expect(firstConstraint.constraintType == .requirementIfAssociatedTarget)
        #expect(firstConstraint.identifier == "bundleIdentifierPrefix")
        #expect(firstConstraint.value == "___ASSOCIATEDTARGET_bundleIdentifier___")
    }

    @Test("Parse multiple OptionConstraints")
    func parseMultipleConstraints() throws {
        // Create multiple constraints
        let constraintsArray: [[String: Any]] = [
            [
                "ConstraintType": "RequirementIfAssociatedTarget",
                "Identifier": "constraint1",
                "Value": "value1",
            ],
            [
                "ConstraintType": "RequirementIfAssociatedTarget",
                "Identifier": "constraint2",
                "Value": "value2",
            ],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: constraintsArray, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(Template.Model.OptionConstraints.self, from: data)

        #expect(constraints.constraints.count == 2)
        #expect(constraints.constraints[0].identifier == "constraint1")
        #expect(constraints.constraints[1].identifier == "constraint2")
    }

    @Test("Round-trip OptionConstraints encoding and decoding")
    func roundTripConstraints() throws {
        // Create OptionConstraints
        let constraint1 = Template.Model.OptionConstraint(
            constraintType: .requirementIfAssociatedTarget,
            identifier: "testConstraint",
            value: "testValue"
        )

        let constraints = Template.Model.OptionConstraints(constraints: [constraint1])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(constraints)

        // Decode
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.OptionConstraints.self, from: data)

        #expect(decoded.constraints.count == 1)
        #expect(decoded.constraints[0].constraintType == .requirementIfAssociatedTarget)
        #expect(decoded.constraints[0].identifier == "testConstraint")
        #expect(decoded.constraints[0].value == "testValue")
    }

    @Test("Parse empty OptionConstraints")
    func parseEmptyConstraints() throws {
        let emptyArray: [[String: Any]] = []
        let data = try PropertyListSerialization.data(fromPropertyList: emptyArray, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(Template.Model.OptionConstraints.self, from: data)

        #expect(constraints.constraints.isEmpty)
    }
}
