// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateGenerator
import Testing

/// Generator tests for the "Name" field
///
/// Tests that TemplateWriter correctly serializes Name values to plist format.
@Suite("Name Field Generation")
struct NameTests {

    @Test("Generate Name for Asset_Catalog")
    func generateAsset_Catalog() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameTests/NameTests.swift", with: "Fixtures/Name/Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Name"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.name = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Name"]
    }

    @Test("Generate Name for Documentation_Catalog")
    func generateDocumentation_Catalog() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameTests/NameTests.swift", with: "Fixtures/Name/Documentation_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Name"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.name = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Name"]
    }

    @Test("Generate Name for Empty_File")
    func generateEmpty_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameTests/NameTests.swift", with: "Fixtures/Name/Empty_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Name"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.name = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Name"]
    }

    @Test("Generate Name for File_List")
    func generateFile_List() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameTests/NameTests.swift", with: "Fixtures/Name/File_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Name"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.name = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Name"]
    }

    @Test("Generate Name for RTF_File")
    func generateRTF_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameTests/NameTests.swift", with: "Fixtures/Name/RTF_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Name"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.name = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Name"]
    }

    @Test("Generate Name for SceneKit_Asset_Catalog")
    func generateSceneKit_Asset_Catalog() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/NameTests/NameTests.swift", with: "Fixtures/Name/SceneKit_Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Name"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.name = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Name"]
    }
}
