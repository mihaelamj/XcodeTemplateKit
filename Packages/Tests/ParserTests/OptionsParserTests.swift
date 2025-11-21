import Foundation
import Models
@testable import Parser
import Testing

@Suite("Options Parser Tests - Explicit")
struct OptionsParserTests {
    @Test("Parse simple text option")
    func parseSimpleTextOption() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Options/SimpleTextOption_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let optionsArray = plist["Options"] as? [[String: Any]]
        #expect(optionsArray?.count == 1)

        let optionDict = optionsArray?.first
        #expect(optionDict?["Identifier"] as? String == "productName")
        #expect(optionDict?["Name"] as? String == "Product Name:")
        #expect(optionDict?["Type"] as? String == "text")
        #expect(optionDict?["Default"] as? String == "MyApp")
        #expect(optionDict?["Required"] as? Bool == true)

        // Decode as Option
        let optionData = try PropertyListSerialization.data(fromPropertyList: optionDict!, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: optionData)

        #expect(option.identifier == "productName")
        #expect(option.name == "Product Name:")
        #expect(option.type == "text")
        #expect(option.defaultValue == "MyApp")
        #expect(option.required == true)
    }

    @Test("Parse popup option with values")
    func parsePopupOption() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Options/PopupOption_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let optionsArray = plist["Options"] as? [[String: Any]]
        #expect(optionsArray?.count == 1)

        let optionDict = optionsArray?.first!
        let optionData = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: optionData)

        #expect(option.identifier == "languageChoice")
        #expect(option.type == "popup")
        #expect(option.values?.count == 2)
        #expect(option.values?[0] == "Swift")
        #expect(option.values?[1] == "Objective-C")
        #expect(option.valueTitles?.count == 2)
    }

    @Test("Parse multiple options")
    func parseMultipleOptions() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Options/MultipleOptions_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let optionsArray = plist["Options"] as? [[String: Any]]
        #expect(optionsArray?.count == 3)

        // Decode all options
        var options: [Template.Model.Option] = []
        for optionDict in optionsArray! {
            let optionData = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
            let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: optionData)
            options.append(option)
        }

        #expect(options.count == 3)
        #expect(options[0].identifier == "productName")
        #expect(options[1].identifier == "organizationName")
        #expect(options[2].identifier == "languageChoice")

        // Verify different types
        #expect(options[0].type == "text")
        #expect(options[2].type == "popup")
        #expect(options[2].values?.count == 2)
    }

    @Test("Parse option with all fields")
    func parseOptionWithAllFields() throws {
        let optionDict: [String: Any] = [
            "Identifier": "testOption",
            "Name": "Test Option:",
            "Type": "popup",
            "Default": "value1",
            "Description": "This is a test option",
            "Required": true,
            "NotPersisted": false,
            "SortOrder": 10,
            "Values": ["value1", "value2"],
            "ValueTitles": ["Value 1", "Value 2"],
            "EmptyReplacement": "default",
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: data)

        #expect(option.identifier == "testOption")
        #expect(option.name == "Test Option:")
        #expect(option.type == "popup")
        #expect(option.defaultValue == "value1")
        #expect(option.description == "This is a test option")
        #expect(option.required == true)
        #expect(option.notPersisted == false)
        #expect(option.sortOrder == 10)
        #expect(option.values?.count == 2)
        #expect(option.valueTitles?.count == 2)
        #expect(option.emptyReplacement == "default")
    }

    @Test("Parse option with minimal fields")
    func parseMinimalOption() throws {
        let optionDict: [String: Any] = [
            "Identifier": "minimal",
            "Name": "Minimal",
            "Type": "text",
            "Default": "",
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
        let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: data)

        #expect(option.identifier == "minimal")
        #expect(option.name == "Minimal")
        #expect(option.type == "text")
        #expect(option.defaultValue == "")
        #expect(option.description == nil)
        #expect(option.required == nil)
    }

    @Test("Parse empty Options array")
    func parseEmptyOptions() throws {
        let plist: [String: Any] = ["Options": []]
        let optionsArray = plist["Options"] as? [[String: Any]]

        #expect(optionsArray?.isEmpty == true)
    }

    @Test("Round-trip Options from fixture")
    func roundTripFromFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Options/App_Base_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let optionsArray = plist["Options"] as! [[String: Any]]

        var options: [Template.Model.Option] = []
        for optionDict in optionsArray {
            let optionData = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
            let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: optionData)
            options.append(option)
        }

        #expect(!options.isEmpty)

        // Encode back
        var encodedOptionsArray: [[String: Any]] = []
        for option in options {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let encodedData = try encoder.encode(option)
            let encodedDict = try PropertyListSerialization.propertyList(from: encodedData, format: nil) as! [String: Any]
            encodedOptionsArray.append(encodedDict)
        }

        #expect(encodedOptionsArray.count == options.count)
    }
}
