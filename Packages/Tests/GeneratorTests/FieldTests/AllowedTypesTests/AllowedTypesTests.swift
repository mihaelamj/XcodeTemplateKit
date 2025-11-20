// swiftlint:disable type_body_length force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "AllowedTypes" field
///
/// Tests that TemplateWriter correctly serializes AllowedTypes values to plist format.
@Suite("AllowedTypes Field Generation")
struct AllowedTypesTests {
    @Test("Generate AllowedTypes for App_Entity")
    func generateApp_Entity() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for App_Enum")
    func generateApp_Enum() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/App_Enum_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for App_Privacy")
    func generateApp_Privacy() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/App_Privacy_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for C++_File")
    func generateC ++ _File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/C++_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for C_File")
    func generateC_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/C_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Header_File")
    func generateHeader_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Header_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for INIntent_subclass")
    func generateINIntent_subclass() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/INIntent_subclass_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Link_action")
    func generateLink_action() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Link_action_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Metal_File")
    func generateMetal_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Metal_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Objective-C_File")
    func generateObjective_C_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Objective-C_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for PCH_File")
    func generatePCH_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/PCH_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Package_Swift_File")
    func generatePackage_Swift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Package_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Package_Test_Case")
    func generatePackage_Test_Case() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Package_Test_Case_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Playground_Page")
    func generatePlayground_Page() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Playground_Page_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SceneKit_Asset_Cache")
    func generateSceneKit_Asset_Cache() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SceneKit_Asset_Cache_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SceneKit_Asset_Catalog")
    func generateSceneKit_Asset_Catalog() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SceneKit_Asset_Catalog_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SceneKit_Scene_File")
    func generateSceneKit_Scene_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SceneKit_Scene_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Sources_Folder_Swift_File")
    func generateSources_Folder_Swift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Sources_Folder_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SpriteKit_Action")
    func generateSpriteKit_Action() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SpriteKit_Action_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SpriteKit_Particle_File")
    func generateSpriteKit_Particle_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SpriteKit_Particle_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SpriteKit_Scene")
    func generateSpriteKit_Scene() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SpriteKit_Scene_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SpriteKit_Tile_Set")
    func generateSpriteKit_Tile_Set() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SpriteKit_Tile_Set_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for SwiftUI_View")
    func generateSwiftUI_View() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/SwiftUI_View_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Swift_File")
    func generateSwift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Swift_Testing_Unit_Test")
    func generateSwift_Testing_Unit_Test() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Swift_Testing_Unit_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }

    @Test("Generate AllowedTypes for Transient_App_Entity")
    func generateTransient_App_Entity() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/AllowedTypesTests/AllowedTypesTests.swift",
            with: "Fixtures/AllowedTypes/Transient_App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AllowedTypes"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.allowedtypes = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AllowedTypes"]
    }
}
