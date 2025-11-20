@testable import Parser
import Models
import Testing
import Foundation

@Suite("Definitions Parser Tests")
struct DefinitionsParserTests {
    @Test("Parse Definitions with FileDefinition structures")
    func parseFileDefinitions() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Definitions/App_Base_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        guard let definitionsDict = plist["Definitions"] as? [String: Any], !definitionsDict.isEmpty else {
            Issue.record("Definitions not found in plist")
            return
        }

        // Convert to proper format for Definitions decoding
        let definitionsData = try PropertyListSerialization.data(fromPropertyList: definitionsDict, format: .binary, options: 0)
        let definitions = try PropertyListDecoder().decode(Template.Model.Definitions.self, from: definitionsData)

        #expect(definitions.definitions.count == 2)
        #expect(definitions.definitions["main.m"] != nil)
        #expect(definitions.definitions["main.m:main"] != nil)

        // Verify file definition structure
        if case .file(let fileDef) = definitions.definitions["main.m"] {
            #expect(fileDef.sortOrder == 999)
        } else {
            Issue.record("Expected file definition for main.m")
        }

        // Verify definition with Beginning/End/Indent
        if case .file(let fileDef) = definitions.definitions["main.m:main"] {
            #expect(fileDef.beginning == "int main(int argc, const char * argv[]) {")
            #expect(fileDef.end == "}")
            #expect(fileDef.indent == 1)
        } else {
            Issue.record("Expected file definition for main.m:main")
        }
    }

    @Test("Parse Definitions with string values")
    func parseStringDefinitions() throws {
        // Create a simple definitions dictionary with string values
        let definitionsDict: [String: Any] = [
            "snippet1": "class MyClass {}",
            "snippet2": "func myFunction() {}"
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: definitionsDict, format: .binary, options: 0)
        let definitions = try PropertyListDecoder().decode(Template.Model.Definitions.self, from: data)

        #expect(definitions.definitions.count == 2)

        if case .string(let value) = definitions.definitions["snippet1"] {
            #expect(value == "class MyClass {}")
        } else {
            Issue.record("Expected string definition for snippet1")
        }

        if case .string(let value) = definitions.definitions["snippet2"] {
            #expect(value == "func myFunction() {}")
        } else {
            Issue.record("Expected string definition for snippet2")
        }
    }

    @Test("Parse mixed Definitions (strings and FileDefinitions)")
    func parseMixedDefinitions() throws {
        // Create mixed definitions
        let definitionsDict: [String: Any] = [
            "snippet": "code here",
            "file": [
                "Path": "MyFile.swift",
                "SortOrder": 10
            ]
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: definitionsDict, format: .binary, options: 0)
        let definitions = try PropertyListDecoder().decode(Template.Model.Definitions.self, from: data)

        #expect(definitions.definitions.count == 2)

        // Verify string definition
        if case .string = definitions.definitions["snippet"] {
            // Success
        } else {
            Issue.record("Expected string definition for snippet")
        }

        // Verify file definition
        if case .file(let fileDef) = definitions.definitions["file"] {
            #expect(fileDef.path == "MyFile.swift")
            #expect(fileDef.sortOrder == 10)
        } else {
            Issue.record("Expected file definition for file")
        }
    }

    @Test("Round-trip Definitions encoding and decoding")
    func roundTripDefinitions() throws {
        // Create Definitions with both string and file values
        let stringDef = Template.Model.DefinitionValue.string("class Example {}")
        let fileDef = Template.Model.DefinitionValue.file(
            Template.Model.FileDefinition(
                path: "Example.swift",
                group: nil,
                targetIndices: [0],
                beginning: nil,
                end: nil,
                sortOrder: 5,
                indent: nil,
                assetGeneration: nil
            )
        )

        let definitions = Template.Model.Definitions(definitions: [
            "snippet": stringDef,
            "file": fileDef
        ])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(definitions)

        // Decode
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.Definitions.self, from: data)

        #expect(decoded.definitions.count == 2)

        // Verify string definition survived round-trip
        if case .string(let value) = decoded.definitions["snippet"] {
            #expect(value == "class Example {}")
        } else {
            Issue.record("String definition lost in round-trip")
        }

        // Verify file definition survived round-trip
        if case .file(let decodedFile) = decoded.definitions["file"] {
            #expect(decodedFile.path == "Example.swift")
            #expect(decodedFile.sortOrder == 5)
            #expect(decodedFile.targetIndices == [0])
        } else {
            Issue.record("File definition lost in round-trip")
        }
    }

    @Test("Parse empty Definitions")
    func parseEmptyDefinitions() throws {
        let emptyDict: [String: Any] = [:]
        let data = try PropertyListSerialization.data(fromPropertyList: emptyDict, format: .binary, options: 0)
        let definitions = try PropertyListDecoder().decode(Template.Model.Definitions.self, from: data)

        #expect(definitions.definitions.isEmpty)
    }
}
