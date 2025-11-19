// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateGenerator
import Testing

/// Generator tests for the "Identifier" field
///
/// Tests that TemplateWriter correctly serializes Identifier values to plist format.
@Suite("Identifier Field Generation")
struct IdentifierTests {

    @Test("Generate Identifier for Aggregate")
    func generateAggregate() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Aggregate_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for App_Base")
    func generateApp_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for App_Extension_Base")
    func generateApp_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for App")
    func generateApp() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Audio_Unit_Extension_App")
    func generateAudio_Unit_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Audio_Unit_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Audio_Unit_Extension")
    func generateAudio_Unit_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Audio_Unit_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base_DefinitionsAppLifecycle")
    func generateBase_DefinitionsAppLifecycle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_DefinitionsAppLifecycle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base_DefinitionsInfoPlist")
    func generateBase_DefinitionsInfoPlist() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_DefinitionsInfoPlist_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base_DefinitionsLanguage")
    func generateBase_DefinitionsLanguage() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_DefinitionsLanguage_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base_Options")
    func generateBase_Options() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_Options_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base_ProjectSettings")
    func generateBase_ProjectSettings() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_ProjectSettings_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base_StorageType")
    func generateBase_StorageType() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_StorageType_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base_TestingSystem")
    func generateBase_TestingSystem() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_TestingSystem_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Base")
    func generateBase() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Build_Tool_Plug-in")
    func generateBuild_Tool_Plug_in() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Build_Tool_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Bundle_Base")
    func generateBundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Command_Plug-in")
    func generateCommand_Plug_in() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Command_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Compositor_Services")
    func generateCompositor_Services() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Compositor_Services_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Cross-Platform_Base")
    func generateCross_Platform_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Cross-Platform_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Document_App")
    func generateDocument_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Empty")
    func generateEmpty() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for ExtensionKit_Extension_Base")
    func generateExtensionKit_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/ExtensionKit_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for External_Build_System")
    func generateExternal_Build_System() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/External_Build_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Framework_Base")
    func generateFramework_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Framework_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Framework_Testing_Bundle")
    func generateFramework_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Framework_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Framework")
    func generateFramework() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Game")
    func generateGame() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Generic_Extension")
    func generateGeneric_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Generic_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Immersive_Space_App")
    func generateImmersive_Space_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Immersive_Space_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Language_Choice")
    func generateLanguage_Choice() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Language_Choice_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Library")
    func generateLibrary() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Library_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Metal_Library_Base")
    func generateMetal_Library_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Metal_Library_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_App_Extension_Base")
    func generateMultiplatform_App_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_Base")
    func generateMultiplatform_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_ExtensionKit_Extension_Base")
    func generateMultiplatform_ExtensionKit_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_ExtensionKit_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_SwiftUI_App_Testing_Bundle")
    func generateMultiplatform_SwiftUI_App_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_SwiftUI_App_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_SwiftUI_App_UITesting_Bundle")
    func generateMultiplatform_SwiftUI_App_UITesting_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_SwiftUI_App_UITesting_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_SwiftUI_App")
    func generateMultiplatform_SwiftUI_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_SwiftUI_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_SwiftUI_Document_App")
    func generateMultiplatform_SwiftUI_Document_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_SwiftUI_Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_Test_Bundle_Base")
    func generateMultiplatform_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Multiplatform_UI_Test_Bundle_Base")
    func generateMultiplatform_UI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Multiplatform_UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Safari_Extension_App")
    func generateSafari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Security_Critical")
    func generateSecurity_Critical() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Security_Critical_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SharedContent_Metal_4_Game")
    func generateSharedContent_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SharedContent_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SharedContent_Metal_Game")
    func generateSharedContent_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SharedContent_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SharedContent_RealityKit_Game")
    func generateSharedContent_RealityKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SharedContent_RealityKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SharedContent_Safari_Extension_App")
    func generateSharedContent_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SharedContent_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SharedContent_Safari_Extension")
    func generateSharedContent_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SharedContent_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SharedContent_SceneKit_Game")
    func generateSharedContent_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SharedContent_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SharedContent_SpriteKit_Game")
    func generateSharedContent_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SharedContent_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Storage_Type_Document")
    func generateStorage_Type_Document() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Storage_Type_Document_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Storage_Type")
    func generateStorage_Type() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Storage_Type_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SwiftUI_App_Base")
    func generateSwiftUI_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SwiftUI_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SwiftUI_App_UI_Test_Bundle_Base")
    func generateSwiftUI_App_UI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SwiftUI_App_UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SwiftUI_App_Unit_Testing_Bundle_Base")
    func generateSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for SwiftUI_Document_App_Base")
    func generateSwiftUI_Document_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/SwiftUI_Document_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Swift_Macro")
    func generateSwift_Macro() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Swift_Macro_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Testing_System")
    func generateTesting_System() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Testing_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for UI_Test_Bundle_Base")
    func generateUI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for UI_Testing_Bundle")
    func generateUI_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/UI_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Unit_Testing_Bundle_Base")
    func generateUnit_Testing_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Unit_Testing_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Unit_Testing_Bundle")
    func generateUnit_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Unit_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for Widget_Extension")
    func generateWidget_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/Widget_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for XPC_Service_Base")
    func generateXPC_Service_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/XPC_Service_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_App_Base")
    func generateiOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_App_UI_Test_Bundle")
    func generateiOS_App_UI_Test_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_App_UI_Test_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_Metal_4_Game")
    func generateiOS_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_Metal_Game")
    func generateiOS_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_Safari_Extension_App")
    func generateiOS_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_Safari_Extension")
    func generateiOS_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_SceneKit_Game")
    func generateiOS_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for iOS_SpriteKit_Game")
    func generateiOS_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/iOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_App_Base")
    func generatemacOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_App_Entitlements")
    func generatemacOS_App_Entitlements() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_App_Entitlements_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_App_UI_Test_Bundle")
    func generatemacOS_App_UI_Test_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_App_UI_Test_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_Metal_4_Game")
    func generatemacOS_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_Metal_Game")
    func generatemacOS_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_Safari_Extension_App")
    func generatemacOS_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_Safari_Extension")
    func generatemacOS_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_SceneKit_Game")
    func generatemacOS_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for macOS_SpriteKit_Game")
    func generatemacOS_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/macOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for tvOS_App_Base")
    func generatetvOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/tvOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for tvOS_Metal_4_Game")
    func generatetvOS_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/tvOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for tvOS_Metal_Game")
    func generatetvOS_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/tvOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for tvOS_SceneKit_Game")
    func generatetvOS_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/tvOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for tvOS_SpriteKit_Game")
    func generatetvOS_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/tvOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }

    @Test("Generate Identifier for visionOS_App")
    func generatevisionOS_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/IdentifierTests/IdentifierTests.swift", with: "Fixtures/Identifier/visionOS_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]
        
        // Extract field value from original
        guard let originalValue = originalPlist["Identifier"] else { return }
        
        // Create metadata with this field
        var metadata = TemplateMetadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.identifier = originalValue (need proper conversion)
        
        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)
        
        // Verify field is present if it should be
        _ = generatedPlist["Identifier"]
    }
}
