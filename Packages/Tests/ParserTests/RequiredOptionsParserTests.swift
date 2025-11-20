import Foundation
import Models
@testable import Parser
import Testing

@Suite("RequiredOptions Parser Tests")
struct RequiredOptionsParserTests {
    @Test("Parse RequiredOptions from OptionUnit")
    func parseRequiredOptions() throws {
        // Create OptionUnit with RequiredOptions
        let unitDict: [String: Any] = [
            "Nodes": ["file.swift"],
            "RequiredOptions": [
                "option1": "value1",
                "option2": "value2",
            ],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: unitDict, format: .binary, options: 0)
        let unit = try PropertyListDecoder().decode(Template.Model.OptionUnit.self, from: data)

        #expect(unit.requiredOptions != nil)
        #expect(unit.requiredOptions?.count == 2)
        #expect(unit.requiredOptions?["option1"] == "value1")
        #expect(unit.requiredOptions?["option2"] == "value2")
    }

    @Test("Parse empty RequiredOptions")
    func parseEmptyRequiredOptions() throws {
        let unitDict: [String: Any] = [
            "Nodes": ["file.swift"],
            "RequiredOptions": [:],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: unitDict, format: .binary, options: 0)
        let unit = try PropertyListDecoder().decode(Template.Model.OptionUnit.self, from: data)

        #expect(unit.requiredOptions != nil)
        #expect(unit.requiredOptions?.isEmpty == true)
    }

    @Test("Parse OptionUnit without RequiredOptions")
    func parseWithoutRequiredOptions() throws {
        let unitDict: [String: Any] = [
            "Nodes": ["file.swift"],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: unitDict, format: .binary, options: 0)
        let unit = try PropertyListDecoder().decode(Template.Model.OptionUnit.self, from: data)

        #expect(unit.requiredOptions == nil)
    }

    @Test("Round-trip RequiredOptions")
    func roundTripRequiredOptions() throws {
        let unit = Template.Model.OptionUnit(
            definitions: nil,
            nodes: ["test.swift"],
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

        // Decode
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.OptionUnit.self, from: data)

        #expect(decoded.requiredOptions?.count == 2)
        #expect(decoded.requiredOptions?["languageChoice"] == "Swift")
        #expect(decoded.requiredOptions?["testingSystem"] == "XCTest")
    }

    @Test("Parse RequiredOptionsForValues from Option")
    func parseRequiredOptionsForValues() throws {
        // Create Option with RequiredOptionsForValues
        let optionDict: [String: Any] = [
            "Identifier": "testOption",
            "Name": "Test",
            "Type": "popup",
            "Default": "Swift",
            "Values": ["Swift", "Objective-C"],
            "RequiredOptionsForValues": [
                "Swift": ["testingSystem": "Swift Testing"],
                "Objective-C": ["testingSystem": "XCTest"],
            ],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: data)

        #expect(option.requiredOptionsForValues != nil)
        #expect(option.requiredOptionsForValues?.count == 2)
        #expect(option.requiredOptionsForValues?["Swift"]?["testingSystem"] == "Swift Testing")
        #expect(option.requiredOptionsForValues?["Objective-C"]?["testingSystem"] == "XCTest")
    }
}
