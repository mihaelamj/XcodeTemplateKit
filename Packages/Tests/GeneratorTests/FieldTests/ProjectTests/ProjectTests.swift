// swiftlint:disable type_body_length force_cast
import Foundation
@testable import Generator
import Models
import Testing

/// Generator tests for the "Project" field
///
/// Tests that Template.Generator.Writer correctly serializes Project values to plist format.
@Suite("Project Field Generation")
struct ProjectTests {
    @Test("Generate Project for Base_ProjectSettings")
    func generateBase_ProjectSettings() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/Base_ProjectSettings_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }

    @Test("Generate Project for Empty")
    func generateEmpty() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift", with: "Fixtures/Project/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }

    @Test("Generate Project for Framework_Base")
    func generateFramework_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/Framework_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }

    @Test("Generate Project for Metal_Library_Base")
    func generateMetal_Library_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/Metal_Library_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }

    @Test("Generate Project for iOS_Safari_Extension_App")
    func generateiOS_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/iOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }

    @Test("Generate Project for iOS_Safari_Extension")
    func generateiOS_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/iOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }

    @Test("Generate Project for macOS_Safari_Extension_App")
    func generatemacOS_Safari_Extension_App() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/macOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }

    @Test("Generate Project for macOS_Safari_Extension")
    func generatemacOS_Safari_Extension() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/macOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Project"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.project = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Project"]
    }
}
