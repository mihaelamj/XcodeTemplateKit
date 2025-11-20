// swiftlint:disable force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "Components" field
///
/// Tests that TemplateWriter correctly serializes Components values to plist format.
@Suite("Components Field Generation")
struct ComponentsTests {
    @Test("Generate Components for Audio_Unit_Extension_App")
    func generateAudio_Unit_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/ComponentsTests/ComponentsTests.swift",
            with: "Fixtures/Components/Audio_Unit_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Components"] as? [[String: Any]] else {
            throw TestError.missingField("Components")
        }

        // Parse to typed model
        let componentsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let components = try PropertyListDecoder().decode(TemplateComponents.self, from: componentsData)

        // Verify parsed structure
        #expect(components.components.count == 1)
        #expect(components.components[0].identifier == "com.apple.dt.unit.audiounitextension.multiplatform")
        #expect(components.components[0].name == "___PACKAGENAME___Extension")
        #expect(components.components[0].productBuildPhaseInjections?.count == 1)
        #expect(components.components[0].productBuildPhaseInjections?[0].targetIdentifier == "com.apple.dt.applicationTarget")

        // Create metadata with this field
        let metadata = TemplateMetadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            components: components
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["Components"] as? [[String: Any]] else {
            throw TestError.missingField("Components in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
        #expect(generatedValue[0]["Identifier"] as? String == "com.apple.dt.unit.audiounitextension.multiplatform")
        #expect(generatedValue[0]["Name"] as? String == "___PACKAGENAME___Extension")

        let injections = generatedValue[0]["ProductBuildPhaseInjections"] as? [[String: Any]]
        #expect(injections?.count == 1)
        #expect(injections?[0]["TargetIdentifier"] as? String == "com.apple.dt.applicationTarget")
    }

    @Test("Generate Components for Safari_Extension_App")
    func generateSafari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/ComponentsTests/ComponentsTests.swift",
            with: "Fixtures/Components/Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Components"] as? [[String: Any]] else {
            throw TestError.missingField("Components")
        }

        // Parse to typed model
        let componentsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let components = try PropertyListDecoder().decode(TemplateComponents.self, from: componentsData)

        // Verify parsed structure
        #expect(!components.components.isEmpty)

        // Create metadata with this field
        let metadata = TemplateMetadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            components: components
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["Components"] as? [[String: Any]] else {
            throw TestError.missingField("Components in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }
}

enum TestError: Error {
    case missingField(String)
}
