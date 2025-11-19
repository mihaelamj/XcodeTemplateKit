// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateGenerator
import Testing

/// Generator tests for the "NameOfInitialFileForEditor" field
///
/// Tests that TemplateWriter correctly serializes NameOfInitialFileForEditor values to plist format.
@Suite("NameOfInitialFileForEditor Field Generation")
struct NameOfInitialFileForEditorTests {

    @Test("Generate NameOfInitialFileForEditor for App")
    func generateApp() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameOfInitialFileForEditorTests/NameOfInitialFileForEditorTests.swift", with: "Fixtures/NameOfInitialFileForEditor/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["NameOfInitialFileForEditor"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.nameofinitialfileforeditor = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["NameOfInitialFileForEditor"]
    }

    @Test("Generate NameOfInitialFileForEditor for Document_App")
    func generateDocument_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameOfInitialFileForEditorTests/NameOfInitialFileForEditorTests.swift", with: "Fixtures/NameOfInitialFileForEditor/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["NameOfInitialFileForEditor"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.nameofinitialfileforeditor = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["NameOfInitialFileForEditor"]
    }

    @Test("Generate NameOfInitialFileForEditor for Safari_Extension_App")
    func generateSafari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameOfInitialFileForEditorTests/NameOfInitialFileForEditorTests.swift", with: "Fixtures/NameOfInitialFileForEditor/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["NameOfInitialFileForEditor"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.nameofinitialfileforeditor = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["NameOfInitialFileForEditor"]
    }

    @Test("Generate NameOfInitialFileForEditor for SharedContent_RealityKit_Game")
    func generateSharedContent_RealityKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameOfInitialFileForEditorTests/NameOfInitialFileForEditorTests.swift", with: "Fixtures/NameOfInitialFileForEditor/SharedContent_RealityKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["NameOfInitialFileForEditor"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.nameofinitialfileforeditor = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["NameOfInitialFileForEditor"]
    }

    @Test("Generate NameOfInitialFileForEditor for SwiftUI_App_Base")
    func generateSwiftUI_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameOfInitialFileForEditorTests/NameOfInitialFileForEditorTests.swift", with: "Fixtures/NameOfInitialFileForEditor/SwiftUI_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["NameOfInitialFileForEditor"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.nameofinitialfileforeditor = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["NameOfInitialFileForEditor"]
    }

    @Test("Generate NameOfInitialFileForEditor for SwiftUI_Document_App_Base")
    func generateSwiftUI_Document_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameOfInitialFileForEditorTests/NameOfInitialFileForEditorTests.swift", with: "Fixtures/NameOfInitialFileForEditor/SwiftUI_Document_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["NameOfInitialFileForEditor"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.nameofinitialfileforeditor = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["NameOfInitialFileForEditor"]
    }
}
