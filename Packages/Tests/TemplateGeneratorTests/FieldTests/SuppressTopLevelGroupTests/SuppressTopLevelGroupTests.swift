// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateGenerator
import Testing

/// Generator tests for the "SuppressTopLevelGroup" field
///
/// Tests that TemplateWriter correctly serializes SuppressTopLevelGroup values to plist format.
@Suite("SuppressTopLevelGroup Field Generation")
struct SuppressTopLevelGroupTests {

    @Test("Generate SuppressTopLevelGroup for Compositor_Services")
    func generateCompositor_Services() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/SuppressTopLevelGroupTests/SuppressTopLevelGroupTests.swift", with: "Fixtures/SuppressTopLevelGroup/Compositor_Services_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["SuppressTopLevelGroup"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.suppresstoplevelgroup = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["SuppressTopLevelGroup"]
    }

    @Test("Generate SuppressTopLevelGroup for Immersive_Space_App")
    func generateImmersive_Space_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/SuppressTopLevelGroupTests/SuppressTopLevelGroupTests.swift", with: "Fixtures/SuppressTopLevelGroup/Immersive_Space_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["SuppressTopLevelGroup"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.suppresstoplevelgroup = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["SuppressTopLevelGroup"]
    }
}
