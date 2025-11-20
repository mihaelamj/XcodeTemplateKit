// swiftlint:disable force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "Definitions" field
///
/// Tests that TemplateWriter correctly serializes Definitions values to plist format.
@Suite("Definitions Field Generation")
struct DefinitionsTests {
    @Test("Generate Definitions for App_Base")
    func generateApp_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/DefinitionsTests/DefinitionsTests.swift",
            with: "Fixtures/Definitions/App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Definitions"] as? [String: Any] else {
            throw TestError.missingField("Definitions")
        }

        // Parse to typed model
        let decoder = PropertyListDecoder()

        var definitions: [String: DefinitionValue] = [:]
        for (key, value) in originalValue {
            if let stringValue = value as? String {
                definitions[key] = .string(stringValue)
            } else if let dictValue = value as? [String: Any] {
                let data = try PropertyListSerialization.data(fromPropertyList: dictValue, format: .binary, options: 0)
                let fileDefinition = try decoder.decode(FileDefinition.self, from: data)
                definitions[key] = .file(fileDefinition)
            }
        }

        let templateDefinitions = TemplateDefinitions(definitions: definitions)

        // Verify parsed structure
        #expect(templateDefinitions.definitions.count == 2)
        #expect(templateDefinitions.definitions["main.m"] != nil)
        #expect(templateDefinitions.definitions["main.m:main"] != nil)

        // Create metadata with this field
        let metadata = TemplateMetadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            definitions: templateDefinitions
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["Definitions"] as? [String: Any] else {
            throw TestError.missingField("Definitions in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
        #expect(generatedValue["main.m"] != nil)
        #expect(generatedValue["main.m:main"] != nil)
    }

    @Test("Generate Definitions for Base_DefinitionsLanguage")
    func generateBase_DefinitionsLanguage() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/DefinitionsTests/DefinitionsTests.swift",
            with: "Fixtures/Definitions/Base_DefinitionsLanguage_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Definitions"] as? [String: Any] else {
            throw TestError.missingField("Definitions")
        }

        // Parse to typed model
        let decoder = PropertyListDecoder()

        var definitions: [String: DefinitionValue] = [:]
        for (key, value) in originalValue {
            if let stringValue = value as? String {
                definitions[key] = .string(stringValue)
            } else if let dictValue = value as? [String: Any] {
                let data = try PropertyListSerialization.data(fromPropertyList: dictValue, format: .binary, options: 0)
                let fileDefinition = try decoder.decode(FileDefinition.self, from: data)
                definitions[key] = .file(fileDefinition)
            }
        }

        let templateDefinitions = TemplateDefinitions(definitions: definitions)

        // Verify parsed structure - has both strings and FileDefinitions
        #expect(!templateDefinitions.definitions.isEmpty)

        // Create metadata with this field
        let metadata = TemplateMetadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            definitions: templateDefinitions
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["Definitions"] as? [String: Any] else {
            throw TestError.missingField("Definitions in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }
}

enum TestError: Error {
    case missingField(String)
}
