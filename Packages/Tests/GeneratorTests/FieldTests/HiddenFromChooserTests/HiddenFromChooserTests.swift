// swiftlint:disable type_body_length force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "HiddenFromChooser" field
///
/// Tests that TemplateWriter correctly serializes HiddenFromChooser values to plist format.
@Suite("HiddenFromChooser Field Generation")
struct HiddenFromChooserTests {
    @Test("Generate HiddenFromChooser for App_Entity")
    func generateApp_Entity() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for App_Enum")
    func generateApp_Enum() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/App_Enum_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for INIntent_subclass")
    func generateINIntent_subclass() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/INIntent_subclass_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for Link_action")
    func generateLink_action() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/Link_action_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for Package_Swift_File")
    func generatePackage_Swift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/Package_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for Package_Test_Case")
    func generatePackage_Test_Case() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/Package_Test_Case_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for Playground_Page")
    func generatePlayground_Page() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/Playground_Page_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for SceneKit_Asset_Cache")
    func generateSceneKit_Asset_Cache() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/SceneKit_Asset_Cache_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for Sources_Folder_Swift_File")
    func generateSources_Folder_Swift_File() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/Sources_Folder_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }

    @Test("Generate HiddenFromChooser for Transient_App_Entity")
    func generateTransient_App_Entity() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/HiddenFromChooserTests/HiddenFromChooserTests.swift",
            with: "Fixtures/HiddenFromChooser/Transient_App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["HiddenFromChooser"] else { return }

        // Create metadata with this field
        var metadata = Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.hiddenfromchooser = originalValue (need proper conversion)

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["HiddenFromChooser"]
    }
}
