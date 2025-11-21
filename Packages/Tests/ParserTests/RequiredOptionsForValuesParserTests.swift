import Foundation
import Models
@testable import Parser
import Testing

@Suite("RequiredOptionsForValues Parser Tests")
struct RequiredOptionsForValuesParserTests {
    @Test("Parse RequiredOptionsForValues from Option")
    func parseFromOption() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/RequiredOptionsForValues/TestingSystem_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let requiredOptionsForValues = plist["RequiredOptionsForValues"] as? [String: [String: String]]

        #expect(requiredOptionsForValues != nil)
        #expect(requiredOptionsForValues?.count == 2)
        #expect(requiredOptionsForValues?["None"]?["languageChoice"] == "Suppress")
        #expect(requiredOptionsForValues?["Swift Testing"]?["languageChoice"] == "Swift")
    }

    @Test("Parse complete Option with RequiredOptionsForValues")
    func parseCompleteOption() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/RequiredOptionsForValues/TestingSystem_complete.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let optionsArray = plist["Options"] as? [[String: Any]]
        #expect(optionsArray?.count == 1)

        let firstOption = optionsArray?.first
        #expect(firstOption?["Identifier"] as? String == "testingSystem")

        // Decode as Option
        let optionData = try PropertyListSerialization.data(fromPropertyList: firstOption!, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: optionData)

        #expect(option.requiredOptionsForValues != nil)
        #expect(option.requiredOptionsForValues?.count == 2)
        #expect(option.requiredOptionsForValues?["None"]?["languageChoice"] == "Suppress")
        #expect(option.requiredOptionsForValues?["Swift Testing"]?["languageChoice"] == "Swift")
    }

    @Test("Parse multiple constraints per value")
    func parseMultipleConstraints() throws {
        // Create option with multiple constraints per value
        let optionDict: [String: Any] = [
            "Identifier": "complexOption",
            "Name": "Complex",
            "Type": "popup",
            "Default": "Value1",
            "Values": ["Value1", "Value2"],
            "RequiredOptionsForValues": [
                "Value1": [
                    "option1": "required1",
                    "option2": "required2",
                ],
                "Value2": [
                    "option1": "required3",
                    "option3": "required4",
                ],
            ],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: data)

        #expect(option.requiredOptionsForValues?.count == 2)

        let value1Constraints = option.requiredOptionsForValues?["Value1"]
        #expect(value1Constraints?.count == 2)
        #expect(value1Constraints?["option1"] == "required1")
        #expect(value1Constraints?["option2"] == "required2")

        let value2Constraints = option.requiredOptionsForValues?["Value2"]
        #expect(value2Constraints?.count == 2)
        #expect(value2Constraints?["option1"] == "required3")
        #expect(value2Constraints?["option3"] == "required4")
    }

    @Test("Parse Option without RequiredOptionsForValues")
    func parseWithoutConstraints() throws {
        let optionDict: [String: Any] = [
            "Identifier": "simpleOption",
            "Name": "Simple",
            "Type": "text",
            "Default": "value",
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: data)

        #expect(option.requiredOptionsForValues == nil)
    }

    @Test("Round-trip RequiredOptionsForValues")
    func roundTrip() throws {
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

        // Decode
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.Option.self, from: data)

        #expect(decoded.requiredOptionsForValues?.count == 2)
        #expect(decoded.requiredOptionsForValues?["Swift"]?["testingSystem"] == "Swift Testing")
        #expect(decoded.requiredOptionsForValues?["Objective-C"]?["testingSystem"] == "XCTest")
    }
}
