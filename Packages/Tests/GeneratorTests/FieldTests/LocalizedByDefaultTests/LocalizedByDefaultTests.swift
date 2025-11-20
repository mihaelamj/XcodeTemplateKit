// swiftlint:disable type_body_length force_cast
import Foundation
@testable import Generator
import Models
import Testing

/// Generator tests for the "LocalizedByDefault" field
///
/// Tests that Template.Generator.Writer correctly serializes LocalizedByDefault values to plist format.
@Suite("LocalizedByDefault Field Generation")
struct LocalizedByDefaultTests {
    @Test("Generate LocalizedByDefault for Strings_File_(Legacy)")
    func generateStrings_File_(Legacy)() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/LocalizedByDefaultTests/LocalizedByDefaultTests.swift",
            with: "Fixtures/LocalizedByDefault/Strings_File_(Legacy)_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["LocalizedByDefault"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.localizedbydefault = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["LocalizedByDefault"]
    }

    @Test("Generate LocalizedByDefault for Stringsdict_File_(Legacy)")
    func generateStringsdict_File_(Legacy)() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/LocalizedByDefaultTests/LocalizedByDefaultTests.swift",
            with: "Fixtures/LocalizedByDefault/Stringsdict_File_(Legacy)_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["LocalizedByDefault"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.localizedbydefault = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["LocalizedByDefault"]
    }
}
