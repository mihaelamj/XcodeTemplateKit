import Foundation
@testable import Generator
import Models
import Testing

@Suite("RequiredOptions Field Generation")
struct RequiredOptionsGeneratorTests {
    @Test("Encode RequiredOptions in OptionUnit")
    func encodeInOptionUnit() throws {
        let unit = Template.Model.OptionUnit(
            definitions: nil,
            nodes: ["TestFile.swift"],
            project: nil,
            requiredOptions: [
                "languageChoice": "Swift",
                "testingSystem": "XCTest",
            ],
            targets: nil,
            components: nil
        )

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(unit)

        // Verify structure
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let requiredOptions = plist["RequiredOptions"] as? [String: String]

        #expect(requiredOptions != nil)
        #expect(requiredOptions?["languageChoice"] == "Swift")
        #expect(requiredOptions?["testingSystem"] == "XCTest")
    }

    @Test("Encode multiple RequiredOptions")
    func encodeMultipleOptions() throws {
        let unit = Template.Model.OptionUnit(
            definitions: nil,
            nodes: ["file.swift"],
            project: nil,
            requiredOptions: [
                "option1": "value1",
                "option2": "value2",
                "option3": "value3",
            ],
            targets: nil,
            components: nil
        )

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(unit)

        // Decode to verify
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.OptionUnit.self, from: data)

        #expect(decoded.requiredOptions?.count == 3)
        #expect(decoded.requiredOptions?["option1"] == "value1")
    }

    @Test("Encode OptionUnit without RequiredOptions")
    func encodeWithoutRequiredOptions() throws {
        let unit = Template.Model.OptionUnit(
            definitions: nil,
            nodes: ["file.swift"],
            project: nil,
            requiredOptions: nil,
            targets: nil,
            components: nil
        )

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(unit)

        // Verify RequiredOptions is not present
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        #expect(plist["RequiredOptions"] == nil)
    }

    @Test("Round-trip from fixture")
    func roundTripFromFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/RequiredOptions/OptionUnit_with_RequiredOptions_value.plist")
        let originalData = try Data(contentsOf: fixtureURL)

        // Decode
        let unit = try PropertyListDecoder().decode(Template.Model.OptionUnit.self, from: originalData)

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let encodedData = try encoder.encode(unit)

        // Decode again
        let decoder = PropertyListDecoder()
        let roundTripped = try decoder.decode(Template.Model.OptionUnit.self, from: encodedData)

        #expect(roundTripped.requiredOptions?.count == unit.requiredOptions?.count)
        #expect(roundTripped.requiredOptions?["languageChoice"] == unit.requiredOptions?["languageChoice"])
    }
}
