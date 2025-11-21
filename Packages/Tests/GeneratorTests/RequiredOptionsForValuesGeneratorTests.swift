// swiftlint:disable:next blanket_disable_command
// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

@Suite("RequiredOptionsForValues Field Generation")
struct RequiredOptionsForValuesGeneratorTests {
    @Test("Encode RequiredOptionsForValues in Option")
    func encodeInOption() throws {
        let option = Template.Model.Option(
            identifier: "testOption",
            name: "Test",
            type: "popup",
            defaultValue: "Swift",
            description: nil,
            override: nil,
            notPersisted: nil,
            required: nil,
            emptyReplacement: nil,
            sortOrder: nil,
            values: ["Swift", "Objective-C"],
            valueTitles: nil,
            requiredOptionsForValues: [
                "Swift": ["testingSystem": "Swift Testing"],
                "Objective-C": ["testingSystem": "XCTest"],
            ],
            units: nil
        )

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(option)

        // Verify structure
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let constraints = plist["RequiredOptionsForValues"] as? [String: [String: String]]

        #expect(constraints != nil)
        #expect(constraints?["Swift"]?["testingSystem"] == "Swift Testing")
        #expect(constraints?["Objective-C"]?["testingSystem"] == "XCTest")
    }

    @Test("Encode multiple constraints per value")
    func encodeMultipleConstraints() throws {
        let option = Template.Model.Option(
            identifier: "complexOption",
            name: "Complex",
            type: "popup",
            defaultValue: "Value1",
            description: nil,
            override: nil,
            notPersisted: nil,
            required: nil,
            emptyReplacement: nil,
            sortOrder: nil,
            values: ["Value1", "Value2"],
            valueTitles: nil,
            requiredOptionsForValues: [
                "Value1": [
                    "option1": "required1",
                    "option2": "required2",
                ],
                "Value2": [
                    "option1": "required3",
                    "option3": "required4",
                ],
            ],
            units: nil
        )

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(option)

        // Decode to verify
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.Option.self, from: data)

        #expect(decoded.requiredOptionsForValues?.count == 2)
        #expect(decoded.requiredOptionsForValues?["Value1"]?.count == 2)
        #expect(decoded.requiredOptionsForValues?["Value2"]?.count == 2)
    }

    @Test("Round-trip from fixture")
    func roundTripFromFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/RequiredOptionsForValues/TestingSystem_complete.plist")
        let originalData = try Data(contentsOf: fixtureURL)
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        let optionsArray = originalPlist["Options"] as! [[String: Any]]
        let optionDict = optionsArray[0]

        // Decode
        let optionData = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: optionData)

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let encodedData = try encoder.encode(option)

        // Decode again
        let decoder = PropertyListDecoder()
        let roundTripped = try decoder.decode(Template.Model.Option.self, from: encodedData)

        #expect(roundTripped.requiredOptionsForValues?.count == option.requiredOptionsForValues?.count)
    }
}
