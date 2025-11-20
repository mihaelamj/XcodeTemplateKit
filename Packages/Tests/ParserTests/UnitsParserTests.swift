@testable import Parser
import Models
import Testing
import Foundation

@Suite("Units Parser Tests")
struct UnitsParserTests {
    let parser = Template.Parser.Content.UnitsParser()

    @Test("Parse Swift unit with Definitions and Nodes")
    func swiftUnitWithDefinitionsAndNodes() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Units/Swift_Definitions_Nodes_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil)

        let result = parser.parse(["Swift": plist])

        #expect(result != nil)
        #expect(result?.count == 1)

        let swiftUnit = result?["Swift"]
        #expect(swiftUnit != nil)
        #expect(swiftUnit?.nodes != nil)
        #expect(swiftUnit?.nodes?.count == 1)
        #expect(swiftUnit?.nodes?.first == "GameController.swift")

        #expect(swiftUnit?.definitions != nil)
        let definitions = swiftUnit?.definitions?.definitions
        #expect(definitions?.count == 1)
        #expect(definitions?["GameController.swift"] != nil)

        // Verify definition exists
        #expect(definitions?["GameController.swift"] != nil)
    }

    @Test("Parse Objective-C unit with multiple nodes")
    func objectiveCUnitWithMultipleNodes() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Units/ObjectiveC_Definitions_Nodes_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil)

        let result = parser.parse(["Objective-C": plist])

        #expect(result != nil)
        #expect(result?.count == 1)

        let objcUnit = result?["Objective-C"]
        #expect(objcUnit != nil)
        #expect(objcUnit?.nodes != nil)
        #expect(objcUnit?.nodes?.count == 2)
        #expect(objcUnit?.nodes?.contains("GameController.h") == true)
        #expect(objcUnit?.nodes?.contains("GameController.m") == true)

        #expect(objcUnit?.definitions != nil)
        let definitions = objcUnit?.definitions?.definitions
        #expect(definitions?.count == 2)
        #expect(definitions?["GameController.h"] != nil)
        #expect(definitions?["GameController.m"] != nil)
    }

    @Test("Parse unit with Targets")
    func unitWithTargets() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Units/WithTargets_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil)

        let result = parser.parse(["true": plist])

        #expect(result != nil)
        #expect(result?.count == 1)

        let unit = result?["true"]
        #expect(unit != nil)
        #expect(unit?.nodes != nil)
        #expect(unit?.nodes?.count == 2)
        #expect(unit?.definitions != nil)
        #expect(unit?.targets != nil)
        #expect(unit?.targets?.targets.count == 1)
    }

    @Test("Parse multiple units (Swift and Objective-C)")
    func multipleUnits() throws {
        let swiftURL = URL(fileURLWithPath: "Tests/Fixtures/Units/Swift_Definitions_Nodes_value.plist")
        let swiftData = try Data(contentsOf: swiftURL)
        let swiftPlist = try PropertyListSerialization.propertyList(from: swiftData, format: nil)

        let objcURL = URL(fileURLWithPath: "Tests/Fixtures/Units/ObjectiveC_Definitions_Nodes_value.plist")
        let objcData = try Data(contentsOf: objcURL)
        let objcPlist = try PropertyListSerialization.propertyList(from: objcData, format: nil)

        let result = parser.parse([
            "Swift": swiftPlist,
            "Objective-C": objcPlist
        ])

        #expect(result != nil)
        #expect(result?.count == 2)
        #expect(result?["Swift"] != nil)
        #expect(result?["Objective-C"] != nil)

        // Verify heterogeneous structure: Swift has 1 node, Objective-C has 2
        #expect(result?["Swift"]?.nodes?.count == 1)
        #expect(result?["Objective-C"]?.nodes?.count == 2)
    }

    @Test("Parse nil units")
    func nilUnits() {
        let result = parser.parse(nil)
        #expect(result == nil)
    }

    @Test("Parse empty units dictionary")
    func emptyUnits() {
        let result = parser.parse([:])
        #expect(result == nil)
    }

    @Test("Parse unit with only some fields")
    func unitWithPartialFields() throws {
        // Create a minimal unit with only Nodes
        let minimalUnit: [String: Any] = [
            "Nodes": ["File1.swift", "File2.swift"]
        ]

        let result = parser.parse(["Minimal": minimalUnit])

        #expect(result != nil)
        #expect(result?.count == 1)

        let unit = result?["Minimal"]
        #expect(unit?.nodes?.count == 2)
        #expect(unit?.definitions == nil)
        #expect(unit?.targets == nil)
        #expect(unit?.project == nil)
        #expect(unit?.requiredOptions == nil)
        #expect(unit?.components == nil)
    }

    @Test("Parse complete Option with Units from fixture")
    func completeOptionWithUnits() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Units/LanguageChoice_complete.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any]

        #expect(plist != nil)

        let optionsArray = plist?["Options"] as? [[String: Any]]
        #expect(optionsArray != nil)
        #expect(optionsArray?.count == 1)

        let firstOption = optionsArray?.first
        #expect(firstOption?["Identifier"] as? String == "languageChoice")

        let unitsDict = firstOption?["Units"]
        let result = parser.parse(unitsDict)

        #expect(result != nil)
        #expect(result?.count == 2)
        #expect(result?["Swift"] != nil)
        #expect(result?["Objective-C"] != nil)

        // Verify Swift unit
        let swiftUnit = result?["Swift"]
        #expect(swiftUnit?.nodes?.count == 1)
        #expect(swiftUnit?.nodes?.first == "GameController.swift")

        // Verify Objective-C unit
        let objcUnit = result?["Objective-C"]
        #expect(objcUnit?.nodes?.count == 2)
        #expect(objcUnit?.nodes?.contains("GameController.h") == true)
        #expect(objcUnit?.nodes?.contains("GameController.m") == true)
    }
}
