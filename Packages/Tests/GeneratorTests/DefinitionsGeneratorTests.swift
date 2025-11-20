// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

@Suite("Definitions Field Generation")
struct DefinitionsGeneratorTests {
    @Test("Encode Definitions with string values")
    func encodeStringDefinitions() throws {
        let definitions = Template.Model.Definitions(definitions: [
            "snippet1": .string("class MyClass {}"),
            "snippet2": .string("func myFunction() {}"),
        ])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(definitions)

        // Verify encoding as dictionary
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        #expect(plist.count == 2)
        #expect(plist["snippet1"] as? String == "class MyClass {}")
        #expect(plist["snippet2"] as? String == "func myFunction() {}")
    }

    @Test("Encode Definitions with FileDefinition structures")
    func encodeFileDefinitions() throws {
        let fileDef = Template.Model.FileDefinition(
            path: "Example.swift",
            group: nil,
            targetIndices: [0],
            beginning: nil,
            end: nil,
            sortOrder: 10,
            indent: nil,
            assetGeneration: nil
        )

        let definitions = Template.Model.Definitions(definitions: [
            "file": .file(fileDef),
        ])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(definitions)

        // Verify encoding
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        #expect(plist.count == 1)

        let fileDict = plist["file"] as? [String: Any]
        #expect(fileDict?["Path"] as? String == "Example.swift")
        #expect(fileDict?["SortOrder"] as? Int == 10)
    }

    @Test("Encode mixed Definitions (strings and files)")
    func encodeMixedDefinitions() throws {
        let fileDef = Template.Model.FileDefinition(
            path: nil,
            group: nil,
            targetIndices: nil,
            beginning: "int main() {",
            end: "}",
            sortOrder: nil,
            indent: 1,
            assetGeneration: nil
        )

        let definitions = Template.Model.Definitions(definitions: [
            "snippet": .string("code here"),
            "file": .file(fileDef),
        ])

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(definitions)

        // Decode to verify round-trip
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode(Template.Model.Definitions.self, from: data)

        #expect(decoded.definitions.count == 2)

        if case .string(let value) = decoded.definitions["snippet"] {
            #expect(value == "code here")
        } else {
            Issue.record("String definition lost")
        }

        if case .file(let decodedFile) = decoded.definitions["file"] {
            #expect(decodedFile.beginning == "int main() {")
            #expect(decodedFile.end == "}")
            #expect(decodedFile.indent == 1)
        } else {
            Issue.record("File definition lost")
        }
    }

    @Test("Round-trip Definitions from fixture")
    func roundTripFromFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Definitions/App_Base_value.plist")
        let originalData = try Data(contentsOf: fixtureURL)
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        guard let definitionsDict = originalPlist["Definitions"] as? [String: Any] else {
            Issue.record("Definitions not found in fixture")
            return
        }

        // Decode
        let definitionsData = try PropertyListSerialization.data(fromPropertyList: definitionsDict, format: .binary, options: 0)
        let definitions = try PropertyListDecoder().decode(Template.Model.Definitions.self, from: definitionsData)

        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let encodedData = try encoder.encode(definitions)

        // Decode again
        let decoder = PropertyListDecoder()
        let roundTripped = try decoder.decode(Template.Model.Definitions.self, from: encodedData)

        #expect(roundTripped.definitions.count == definitions.definitions.count)
    }
}
