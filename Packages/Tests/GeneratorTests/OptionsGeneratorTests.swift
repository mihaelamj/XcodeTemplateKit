// swiftlint:disable:next blanket_disable_command
// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

@Suite("Options Field Generation")
struct OptionsGeneratorTests {
    @Test("Encode simple text option")
    func encodeSimpleTextOption() throws {
        let option = Template.Model.Option(
            identifier: "productName",
            name: "Product Name:",
            type: "text",
            defaultValue: "MyApp",
            description: nil,
            override: nil,
            notPersisted: nil,
            required: true,
            emptyReplacement: nil,
            sortOrder: nil,
            values: nil,
            valueTitles: nil,
            requiredOptionsForValues: nil,
            units: nil
        )

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(option)

        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        #expect(plist["Identifier"] as? String == "productName")
        #expect(plist["Name"] as? String == "Product Name:")
        #expect(plist["Type"] as? String == "text")
        #expect(plist["Default"] as? String == "MyApp")
        #expect(plist["Required"] as? Bool == true)
    }

    @Test("Encode popup option with values")
    func encodePopupOption() throws {
        let option = Template.Model.Option(
            identifier: "languageChoice",
            name: "Language:",
            type: "popup",
            defaultValue: "Swift",
            description: nil,
            override: nil,
            notPersisted: nil,
            required: nil,
            emptyReplacement: nil,
            sortOrder: nil,
            values: ["Swift", "Objective-C"],
            valueTitles: ["Swift", "Objective-C"],
            requiredOptionsForValues: nil,
            units: nil
        )

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(option)

        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        #expect(plist["Identifier"] as? String == "languageChoice")
        #expect(plist["Type"] as? String == "popup")
        let values = plist["Values"] as? [String]
        #expect(values?.count == 2)
        #expect(values?[0] == "Swift")
    }

    @Test("Encode multiple options as array")
    func encodeMultipleOptions() throws {
        let option1 = Template.Model.Option(
            identifier: "productName",
            name: "Product Name:",
            type: "text",
            defaultValue: "MyApp"
        )

        let option2 = Template.Model.Option(
            identifier: "languageChoice",
            name: "Language:",
            type: "popup",
            defaultValue: "Swift",
            values: ["Swift", "Objective-C"]
        )

        let options = [option1, option2]

        // Encode each option
        var optionsArray: [[String: Any]] = []
        for option in options {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let data = try encoder.encode(option)
            let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
            optionsArray.append(plist)
        }

        #expect(optionsArray.count == 2)
        #expect(optionsArray[0]["Identifier"] as? String == "productName")
        #expect(optionsArray[1]["Identifier"] as? String == "languageChoice")
    }

    @Test("Encode option with all fields")
    func encodeOptionWithAllFields() throws {
        let option = Template.Model.Option(
            identifier: "complexOption",
            name: "Complex Option:",
            type: "popup",
            defaultValue: "value1",
            description: "A complex test option",
            override: nil,
            notPersisted: false,
            required: true,
            emptyReplacement: "default",
            sortOrder: 5,
            values: ["value1", "value2", "value3"],
            valueTitles: ["Value 1", "Value 2", "Value 3"],
            requiredOptionsForValues: nil,
            units: nil
        )

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(option)

        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.Option.self, from: data)

        #expect(decoded.identifier == "complexOption")
        #expect(decoded.description == "A complex test option")
        #expect(decoded.sortOrder == 5)
        #expect(decoded.values?.count == 3)
        #expect(decoded.valueTitles?.count == 3)
    }

    @Test("Encode option with minimal fields")
    func encodeMinimalOption() throws {
        let option = Template.Model.Option(
            identifier: "minimal",
            name: "Minimal",
            type: "text",
            defaultValue: ""
        )

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(option)

        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        #expect(plist["Identifier"] as? String == "minimal")
        #expect(plist["Description"] == nil)
        #expect(plist["Required"] == nil)
    }

    @Test("Round-trip from simple fixture")
    func roundTripSimpleFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Options/SimpleTextOption_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let optionsArray = plist["Options"] as! [[String: Any]]
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

        #expect(roundTripped.identifier == option.identifier)
        #expect(roundTripped.name == option.name)
        #expect(roundTripped.type == option.type)
        #expect(roundTripped.required == option.required)
    }

    @Test("Round-trip from multiple options fixture")
    func roundTripMultipleOptions() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Options/MultipleOptions_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let optionsArray = plist["Options"] as! [[String: Any]]

        // Decode all
        var options: [Template.Model.Option] = []
        for optionDict in optionsArray {
            let optionData = try PropertyListSerialization.data(fromPropertyList: optionDict, format: .binary, options: 0)
            let option = try PropertyListDecoder().decode(Template.Model.Option.self, from: optionData)
            options.append(option)
        }

        #expect(options.count == 3)

        // Encode all
        for option in options {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let encodedData = try encoder.encode(option)

            let decoder = PropertyListDecoder()
            let roundTripped = try decoder.decode(Template.Model.Option.self, from: encodedData)

            #expect(roundTripped.identifier == option.identifier)
        }
    }
}
