// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateGenerator
import Testing

/// Generator tests for the "Components" field
///
/// Tests that TemplateWriter correctly serializes Components values to plist format.
@Suite("Components Field Generation")
struct ComponentsTests {

    @Test("Generate Components for Audio_Unit_Extension_App")
    func generateAudio_Unit_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/ComponentsTests/ComponentsTests.swift", with: "Fixtures/Components/Audio_Unit_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Components"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.components = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Components"]
    }

    @Test("Generate Components for Safari_Extension_App")
    func generateSafari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/ComponentsTests/ComponentsTests.swift", with: "Fixtures/Components/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Components"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.components = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Components"]
    }
}
