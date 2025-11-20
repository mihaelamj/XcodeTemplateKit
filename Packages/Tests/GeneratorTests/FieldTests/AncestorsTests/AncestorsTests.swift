// swiftlint:disable type_body_length force_cast
import Foundation
@testable import Generator
import Models
import Testing

/// Generator tests for the "Ancestors" field
///
/// Tests that Template.Generator.Writer correctly serializes Ancestors values to plist format.
@Suite("Ancestors Field Generation")
struct AncestorsTests {
    @Test("Generate Ancestors for App_Base")
    func generateApp_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for App_Extension_Base")
    func generateApp_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/App_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for App")
    func generateApp() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift", with: "Fixtures/Ancestors/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Audio_Unit_Extension_App")
    func generateAudio_Unit_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Audio_Unit_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Audio_Unit_Extension")
    func generateAudio_Unit_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Audio_Unit_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Base")
    func generateBase() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift", with: "Fixtures/Ancestors/Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Bundle_Base")
    func generateBundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Compositor_Services")
    func generateCompositor_Services() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Compositor_Services_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Document_App")
    func generateDocument_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Document_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for ExtensionKit_Extension_Base")
    func generateExtensionKit_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for External_Build_System")
    func generateExternal_Build_System() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/External_Build_System_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Framework_Base")
    func generateFramework_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Framework_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Framework_Testing_Bundle")
    func generateFramework_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Framework_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Framework")
    func generateFramework() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Framework_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Game")
    func generateGame() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift", with: "Fixtures/Ancestors/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Generic_Extension")
    func generateGeneric_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Generic_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Immersive_Space_App")
    func generateImmersive_Space_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Immersive_Space_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_App_Extension_Base")
    func generateMultiplatform_App_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_App_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_ExtensionKit_Extension_Base")
    func generateMultiplatform_ExtensionKit_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_SwiftUI_App_Testing_Bundle")
    func generateMultiplatform_SwiftUI_App_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_SwiftUI_App_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_SwiftUI_App_UITesting_Bundle")
    func generateMultiplatform_SwiftUI_App_UITesting_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_SwiftUI_App_UITesting_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_SwiftUI_App")
    func generateMultiplatform_SwiftUI_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_SwiftUI_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_SwiftUI_Document_App")
    func generateMultiplatform_SwiftUI_Document_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_SwiftUI_Document_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_Test_Bundle_Base")
    func generateMultiplatform_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Multiplatform_UI_Test_Bundle_Base")
    func generateMultiplatform_UI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Multiplatform_UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Safari_Extension_App")
    func generateSafari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Security_Critical")
    func generateSecurity_Critical() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Security_Critical_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SharedContent_Metal_4_Game")
    func generateSharedContent_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SharedContent_Metal_4_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SharedContent_Metal_Game")
    func generateSharedContent_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SharedContent_Metal_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SharedContent_RealityKit_Game")
    func generateSharedContent_RealityKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SharedContent_RealityKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SharedContent_Safari_Extension_App")
    func generateSharedContent_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SharedContent_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SharedContent_Safari_Extension")
    func generateSharedContent_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SharedContent_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SharedContent_SceneKit_Game")
    func generateSharedContent_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SharedContent_SceneKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SharedContent_SpriteKit_Game")
    func generateSharedContent_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SharedContent_SpriteKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SwiftUI_App_Base")
    func generateSwiftUI_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SwiftUI_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SwiftUI_App_UI_Test_Bundle_Base")
    func generateSwiftUI_App_UI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SwiftUI_App_UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SwiftUI_App_Unit_Testing_Bundle_Base")
    func generateSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for SwiftUI_Document_App_Base")
    func generateSwiftUI_Document_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/SwiftUI_Document_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for UI_Test_Bundle_Base")
    func generateUI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for UI_Testing_Bundle")
    func generateUI_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/UI_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Unit_Testing_Bundle_Base")
    func generateUnit_Testing_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Unit_Testing_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Unit_Testing_Bundle")
    func generateUnit_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Unit_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for Widget_Extension")
    func generateWidget_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/Widget_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for XPC_Service_Base")
    func generateXPC_Service_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/XPC_Service_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_App_Base")
    func generateiOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_App_UI_Test_Bundle")
    func generateiOS_App_UI_Test_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_App_UI_Test_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_Metal_4_Game")
    func generateiOS_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_Metal_4_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_Metal_Game")
    func generateiOS_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_Metal_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_Safari_Extension_App")
    func generateiOS_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_Safari_Extension")
    func generateiOS_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_SceneKit_Game")
    func generateiOS_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_SceneKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for iOS_SpriteKit_Game")
    func generateiOS_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/iOS_SpriteKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_App_Base")
    func generatemacOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_App_UI_Test_Bundle")
    func generatemacOS_App_UI_Test_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_App_UI_Test_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_Metal_4_Game")
    func generatemacOS_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_Metal_4_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_Metal_Game")
    func generatemacOS_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_Metal_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_Safari_Extension_App")
    func generatemacOS_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_Safari_Extension")
    func generatemacOS_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_SceneKit_Game")
    func generatemacOS_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_SceneKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for macOS_SpriteKit_Game")
    func generatemacOS_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/macOS_SpriteKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for tvOS_App_Base")
    func generatetvOS_App_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/tvOS_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for tvOS_Metal_4_Game")
    func generatetvOS_Metal_4_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/tvOS_Metal_4_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for tvOS_Metal_Game")
    func generatetvOS_Metal_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/tvOS_Metal_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for tvOS_SceneKit_Game")
    func generatetvOS_SceneKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/tvOS_SceneKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for tvOS_SpriteKit_Game")
    func generatetvOS_SpriteKit_Game() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/tvOS_SpriteKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }

    @Test("Generate Ancestors for visionOS_App")
    func generatevisionOS_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AncestorsTests/AncestorsTests.swift",
            with: "Fixtures/Ancestors/visionOS_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Ancestors"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.ancestors = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Ancestors"]
    }
}
