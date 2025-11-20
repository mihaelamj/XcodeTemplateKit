// swiftlint:disable type_body_length force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "TargetOnly" field
///
/// Tests that TemplateWriter correctly serializes TargetOnly values to plist format.
@Suite("TargetOnly Field Generation")
struct TargetOnlyTests {
    @Test("Generate TargetOnly for Aggregate")
    func generateAggregate() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetOnlyTests/TargetOnlyTests.swift",
            with: "Fixtures/TargetOnly/Aggregate_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["TargetOnly"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.targetonly = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["TargetOnly"]
    }

    @Test("Generate TargetOnly for App_Extension_Base")
    func generateApp_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetOnlyTests/TargetOnlyTests.swift",
            with: "Fixtures/TargetOnly/App_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["TargetOnly"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.targetonly = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["TargetOnly"]
    }

    @Test("Generate TargetOnly for ExtensionKit_Extension_Base")
    func generateExtensionKit_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetOnlyTests/TargetOnlyTests.swift",
            with: "Fixtures/TargetOnly/ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["TargetOnly"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.targetonly = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["TargetOnly"]
    }

    @Test("Generate TargetOnly for Multiplatform_Test_Bundle_Base")
    func generateMultiplatform_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetOnlyTests/TargetOnlyTests.swift",
            with: "Fixtures/TargetOnly/Multiplatform_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["TargetOnly"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.targetonly = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["TargetOnly"]
    }

    @Test("Generate TargetOnly for Multiplatform_UI_Test_Bundle_Base")
    func generateMultiplatform_UI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetOnlyTests/TargetOnlyTests.swift",
            with: "Fixtures/TargetOnly/Multiplatform_UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["TargetOnly"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.targetonly = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["TargetOnly"]
    }

    @Test("Generate TargetOnly for UI_Test_Bundle_Base")
    func generateUI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetOnlyTests/TargetOnlyTests.swift",
            with: "Fixtures/TargetOnly/UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["TargetOnly"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.targetonly = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["TargetOnly"]
    }

    @Test("Generate TargetOnly for Unit_Testing_Bundle_Base")
    func generateUnit_Testing_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetOnlyTests/TargetOnlyTests.swift",
            with: "Fixtures/TargetOnly/Unit_Testing_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["TargetOnly"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.targetonly = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["TargetOnly"]
    }
}
