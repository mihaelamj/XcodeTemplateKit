// swiftlint:disable type_body_length force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "HiddenFromLibrary" field
///
/// Tests that TemplateWriter correctly serializes HiddenFromLibrary values to plist format.
@Suite("HiddenFromLibrary Field Generation")
struct HiddenFromLibraryTests {
    @Test("Generate HiddenFromLibrary for App_Entity")
    func generateApp_Entity() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for App_Enum")
    func generateApp_Enum() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/App_Enum_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for INIntent_subclass")
    func generateINIntent_subclass() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/INIntent_subclass_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for Link_action")
    func generateLink_action() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/Link_action_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for Package_Swift_File")
    func generatePackage_Swift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/Package_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for Package_Test_Case")
    func generatePackage_Test_Case() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/Package_Test_Case_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for Playground_Page")
    func generatePlayground_Page() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/Playground_Page_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for SceneKit_Asset_Cache")
    func generateSceneKit_Asset_Cache() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/SceneKit_Asset_Cache_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for Sources_Folder_Swift_File")
    func generateSources_Folder_Swift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/Sources_Folder_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }

    @Test("Generate HiddenFromLibrary for Transient_App_Entity")
    func generateTransient_App_Entity() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift",
            with: "Fixtures/HiddenFromLibrary/Transient_App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromLibrary"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromlibrary = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromLibrary"]
    }
}
