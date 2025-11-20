// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

/// Generator tests for OptionUnit encoding
///
/// Tests that Template.Generator.Writer correctly serializes Units (within Options) to plist format.
@Suite("Units Field Generation")
struct UnitsGeneratorTests {
    @Test("Encode OptionUnit with Definitions and Nodes")
    func encodeUnitWithDefinitionsAndNodes() throws {
        // Create an OptionUnit with simple string definition
        let definitions = Template.Model.Definitions(definitions: [
            "GameController.swift": .string("class GameController {}"),
        ])

        let unit = Template.Model.OptionUnit(
            definitions: definitions,
            nodes: ["GameController.swift"],
            project: nil,
            requiredOptions: nil,
            targets: nil,
            components: nil
        )

        // Encode to plist data
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(unit)

        // Decode back to verify round-trip
        let decoder = PropertyListDecoder()
        let decodedUnit = try decoder.decode(Template.Model.OptionUnit.self, from: data)

        #expect(decodedUnit.nodes?.count == 1)
        #expect(decodedUnit.nodes?.first == "GameController.swift")
        #expect(decodedUnit.definitions != nil)
        #expect(decodedUnit.definitions?.definitions.count == 1)
    }

    @Test("Encode OptionUnit with Targets")
    func encodeUnitWithTargets() throws {
        // Create a simple target
        let targetDefinition = Template.Model.TargetDefinition(
            sharedSettings: [:]
        )

        let targets = Template.Model.Targets(targets: [targetDefinition])

        let unit = Template.Model.OptionUnit(
            definitions: nil,
            nodes: ["___PACKAGENAME:identifier___.swift", "AppIntent.swift"],
            project: nil,
            requiredOptions: nil,
            targets: targets,
            components: nil
        )

        // Encode to plist data
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(unit)

        // Decode back to verify round-trip
        let decoder = PropertyListDecoder()
        let decodedUnit = try decoder.decode(Template.Model.OptionUnit.self, from: data)

        #expect(decodedUnit.nodes?.count == 2)
        #expect(decodedUnit.targets != nil)
        #expect(decodedUnit.targets?.targets.count == 1)
    }

    @Test("Encode Option with Units dictionary")
    func encodeOptionWithUnits() throws {
        // Create Swift unit with string definition
        let swiftDefinitions = Template.Model.Definitions(definitions: [
            "GameController.swift": .string("class GameController {}"),
        ])
        let swiftUnit = Template.Model.OptionUnit(
            definitions: swiftDefinitions,
            nodes: ["GameController.swift"],
            project: nil,
            requiredOptions: nil,
            targets: nil,
            components: nil
        )

        // Create Objective-C unit with string definitions
        let objcDefinitions = Template.Model.Definitions(definitions: [
            "GameController.h": .string("@interface GameController @end"),
            "GameController.m": .string("@implementation GameController @end"),
        ])
        let objcUnit = Template.Model.OptionUnit(
            definitions: objcDefinitions,
            nodes: ["GameController.h", "GameController.m"],
            project: nil,
            requiredOptions: nil,
            targets: nil,
            components: nil
        )

        // Create Option with Units
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
            valueTitles: nil,
            requiredOptionsForValues: nil,
            units: [
                "Swift": swiftUnit,
                "Objective-C": objcUnit,
            ]
        )

        // Encode to plist data
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(option)

        // Decode back to verify round-trip
        let decoder = PropertyListDecoder()
        let decodedOption = try decoder.decode(Template.Model.Option.self, from: data)

        #expect(decodedOption.identifier == "languageChoice")
        #expect(decodedOption.units?.count == 2)
        #expect(decodedOption.units?["Swift"] != nil)
        #expect(decodedOption.units?["Objective-C"] != nil)

        // Verify Swift unit
        if let decodedSwift = decodedOption.units?["Swift"] {
            #expect(decodedSwift.nodes?.count == 1)
            #expect(decodedSwift.nodes?.first == "GameController.swift")
        } else {
            Issue.record("Swift unit not found")
        }

        // Verify Objective-C unit
        if let decodedObjC = decodedOption.units?["Objective-C"] {
            #expect(decodedObjC.nodes?.count == 2)
            #expect(decodedObjC.nodes?.contains("GameController.h") == true)
            #expect(decodedObjC.nodes?.contains("GameController.m") == true)
        } else {
            Issue.record("Objective-C unit not found")
        }
    }

    @Test("Encode partial OptionUnit (only some fields)")
    func encodePartialUnit() throws {
        // Create unit with only Nodes
        let unit = Template.Model.OptionUnit(
            definitions: nil,
            nodes: ["File1.swift", "File2.swift"],
            project: nil,
            requiredOptions: nil,
            targets: nil,
            components: nil
        )

        // Encode to plist data
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(unit)

        // Verify the plist contains only Nodes key
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        #expect(plist["Nodes"] != nil)
        #expect(plist["Definitions"] == nil)
        #expect(plist["Targets"] == nil)
        #expect(plist["Project"] == nil)
        #expect(plist["RequiredOptions"] == nil)
        #expect(plist["Components"] == nil)

        // Decode back to verify round-trip
        let decoder = PropertyListDecoder()
        let decodedUnit = try decoder.decode(Template.Model.OptionUnit.self, from: data)

        #expect(decodedUnit.nodes?.count == 2)
        #expect(decodedUnit.definitions == nil)
        #expect(decodedUnit.targets == nil)
    }

    @Test("Round-trip from fixture")
    func roundTripFromFixture() throws {
        // Load fixture
        let fixturePath = "Tests/Fixtures/Units/LanguageChoice_complete.plist"
        let fixtureURL = URL(fileURLWithPath: fixturePath)
        let originalData = try Data(contentsOf: fixtureURL)
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract options array
        let optionsArray = originalPlist["Options"] as! [[String: Any]]
        let firstOptionDict = optionsArray[0]

        // Encode option dict to data for decoding with PropertyListDecoder
        let optionData = try PropertyListSerialization.data(fromPropertyList: firstOptionDict, format: .binary, options: 0)

        // Decode to Option
        let decoder = PropertyListDecoder()
        let option = try decoder.decode(Template.Model.Option.self, from: optionData)

        // Verify units were parsed
        #expect(option.units?.count == 2)
        #expect(option.units?["Swift"] != nil)
        #expect(option.units?["Objective-C"] != nil)

        // Now encode back
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let encodedData = try encoder.encode(option)

        // Decode again to verify round-trip
        let decodedOption = try decoder.decode(Template.Model.Option.self, from: encodedData)

        #expect(decodedOption.identifier == option.identifier)
        #expect(decodedOption.units?.count == option.units?.count)
        #expect(decodedOption.units?["Swift"]?.nodes?.count == option.units?["Swift"]?.nodes?.count)
        #expect(decodedOption.units?["Objective-C"]?.nodes?.count == option.units?["Objective-C"]?.nodes?.count)
    }

    @Test("Encode heterogeneous units (different properties)")
    func encodeHeterogeneousUnits() throws {
        // Unit A: Only Definitions and Nodes
        let defA = Template.Model.Definitions(definitions: [
            "test": .string("code snippet"),
        ])
        let unitA = Template.Model.OptionUnit(
            definitions: defA,
            nodes: ["file.swift"],
            project: nil,
            requiredOptions: nil,
            targets: nil,
            components: nil
        )

        // Unit B: Only Targets
        let targetDef = Template.Model.TargetDefinition(sharedSettings: [:])
        let targetsB = Template.Model.Targets(targets: [targetDef])
        let unitB = Template.Model.OptionUnit(
            definitions: nil,
            nodes: nil,
            project: nil,
            requiredOptions: nil,
            targets: targetsB,
            components: nil
        )

        // Unit C: Only Nodes
        let unitC = Template.Model.OptionUnit(
            definitions: nil,
            nodes: ["minimal.swift"],
            project: nil,
            requiredOptions: nil,
            targets: nil,
            components: nil
        )

        let units = [
            "A": unitA,
            "B": unitB,
            "C": unitC,
        ]

        // Encode the units dictionary
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(units)

        // Decode back
        let decoder = PropertyListDecoder()
        let decodedUnits = try decoder.decode([String: Template.Model.OptionUnit].self, from: data)

        #expect(decodedUnits.count == 3)

        // Verify each unit has its properties
        #expect(decodedUnits["A"]?.definitions != nil)
        #expect(decodedUnits["A"]?.nodes != nil)
        #expect(decodedUnits["A"]?.targets == nil)

        #expect(decodedUnits["B"]?.targets != nil)
        #expect(decodedUnits["B"]?.definitions == nil)
        #expect(decodedUnits["B"]?.nodes == nil)

        #expect(decodedUnits["C"]?.nodes != nil)
        #expect(decodedUnits["C"]?.definitions == nil)
        #expect(decodedUnits["C"]?.targets == nil)
    }
}
