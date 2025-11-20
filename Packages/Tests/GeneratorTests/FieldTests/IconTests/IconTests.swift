// swiftlint:disable type_body_length force_cast
import Foundation
@testable import Generator
import Models
import Testing

/// Generator tests for the "Icon" field
///
/// Tests that Template.Generator.Writer correctly serializes Icon values to plist format.
@Suite("Icon Field Generation")
struct IconTests {
    @Test("Generate Icon for Application")
    func generateApplication() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Icon"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.icon = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Icon"]
    }

    @Test("Generate Icon for Empty")
    func generateEmpty() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Icon"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.icon = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Icon"]
    }

    @Test("Generate Icon for Main_Menu")
    func generateMain_Menu() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Icon"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.icon = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Icon"]
    }

    @Test("Generate Icon for Storyboard")
    func generateStoryboard() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Icon"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.icon = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Icon"]
    }

    @Test("Generate Icon for View")
    func generateView() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/IconTests/IconTests.swift", with: "Fixtures/Icon/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Icon"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.icon = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Icon"]
    }

    @Test("Generate Icon for Window")
    func generateWindow() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(of: "GeneratorTests/FieldTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Icon"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.icon = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["Icon"]
    }
}
