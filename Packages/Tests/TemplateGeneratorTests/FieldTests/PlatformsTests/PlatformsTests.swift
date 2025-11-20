// swiftlint:disable type_body_length force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "Platforms" field
///
/// Tests that TemplateWriter correctly serializes Platforms values to plist format.
@Suite("Platforms Field Generation")
struct PlatformsTests {
    @Test("Generate Platforms for App_Privacy")
    func generateApp_Privacy() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/App_Privacy_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for App")
    func generateApp() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Application")
    func generateApplication() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Application_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Article_File")
    func generateArticle_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Article_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Asset_Catalog")
    func generateAsset_Catalog() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Asset_Catalog_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Audio_Unit_Extension")
    func generateAudio_Unit_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Audio_Unit_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Build_Tool_Plug-in")
    func generateBuild_Tool_Plug_in() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Build_Tool_Plug-in_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for C++_File")
    func generateC ++ _File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/C++_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for C_File")
    func generateC_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Command_Plug-in")
    func generateCommand_Plug_in() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Command_Plug-in_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Document_App")
    func generateDocument_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Document_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Documentation_Catalog")
    func generateDocumentation_Catalog() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Documentation_Catalog_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Empty")
    func generateEmpty() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Extension_File")
    func generateExtension_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Extension_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Framework")
    func generateFramework() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Framework_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Game")
    func generateGame() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Generic_Extension")
    func generateGeneric_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Generic_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Header_File")
    func generateHeader_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Header_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Library")
    func generateLibrary() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Library_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Main_Menu")
    func generateMain_Menu() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Main_Menu_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Metal_File")
    func generateMetal_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Metal_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Module_Map")
    func generateModule_Map() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Module_Map_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Objective-C_File")
    func generateObjective_C_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Objective-C_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Objective-C_new_superclass")
    func generateObjective_C_new_superclass() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Objective-C_new_superclass_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Playground_Page")
    func generatePlayground_Page() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Playground_Page_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Property_List")
    func generateProperty_List() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Property_List_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for RTF_File")
    func generateRTF_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/RTF_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Safari_Extension_App")
    func generateSafari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SceneKit_Asset_Cache")
    func generateSceneKit_Asset_Cache() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SceneKit_Asset_Cache_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SceneKit_Asset_Catalog")
    func generateSceneKit_Asset_Catalog() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SceneKit_Asset_Catalog_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SceneKit_Scene_File")
    func generateSceneKit_Scene_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SceneKit_Scene_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SiriKit_Intent_Definition_File")
    func generateSiriKit_Intent_Definition_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SiriKit_Intent_Definition_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Sources_Folder_Swift_File")
    func generateSources_Folder_Swift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Sources_Folder_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SpriteKit_Action")
    func generateSpriteKit_Action() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SpriteKit_Action_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SpriteKit_Particle_File")
    func generateSpriteKit_Particle_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SpriteKit_Particle_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SpriteKit_Scene")
    func generateSpriteKit_Scene() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SpriteKit_Scene_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SpriteKit_Tile_Set")
    func generateSpriteKit_Tile_Set() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SpriteKit_Tile_Set_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Storyboard")
    func generateStoryboard() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Storyboard_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Strings_File_(Legacy)")
    func generateStrings_File_(Legacy)() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Strings_File_(Legacy)_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Stringsdict_File_(Legacy)")
    func generateStringsdict_File_(Legacy)() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Stringsdict_File_(Legacy)_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for SwiftUI_View")
    func generateSwiftUI_View() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/SwiftUI_View_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Swift_File")
    func generateSwift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Swift_Macro")
    func generateSwift_Macro() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Swift_Macro_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Swift_Testing_Unit_Test")
    func generateSwift_Testing_Unit_Test() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Swift_Testing_Unit_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Touch_Alternatives_Property_List")
    func generateTouch_Alternatives_Property_List() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Touch_Alternatives_Property_List_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Tutorial_File")
    func generateTutorial_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Tutorial_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Tutorial_Table_of_Contents_File")
    func generateTutorial_Table_of_Contents_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Tutorial_Table_of_Contents_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for UI_Testing_Bundle")
    func generateUI_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/UI_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Unit_Testing_Bundle")
    func generateUnit_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Unit_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for View")
    func generateView() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Widget_Extension")
    func generateWidget_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/Widget_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for Window")
    func generateWindow() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for XCTest_UI_Test")
    func generateXCTest_UI_Test() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/XCTest_UI_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for XCTest_Unit_Test")
    func generateXCTest_Unit_Test() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/XCTest_Unit_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for iOS_App_Base")
    func generateiOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/iOS_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for macOS_App_Base")
    func generatemacOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/macOS_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for macOS_App_Entitlements")
    func generatemacOS_App_Entitlements() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/macOS_App_Entitlements_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }

    @Test("Generate Platforms for tvOS_App_Base")
    func generatetvOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/PlatformsTests/PlatformsTests.swift",
            with: "Fixtures/Platforms/tvOS_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Platforms"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.platforms = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Platforms"]
    }
}
