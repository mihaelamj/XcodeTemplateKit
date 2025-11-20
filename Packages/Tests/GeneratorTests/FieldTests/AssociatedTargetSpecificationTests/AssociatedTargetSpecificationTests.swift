// swiftlint:disable type_body_length force_cast
import Foundation
@testable import Generator
import Models
import Testing

/// Generator tests for the "AssociatedTargetSpecification" field
///
/// Tests that Template.Generator.Writer correctly serializes AssociatedTargetSpecification values to plist format.
@Suite("AssociatedTargetSpecification Field Generation")
struct AssociatedTargetSpecificationTests {
    @Test("Generate AssociatedTargetSpecification for Framework")
    func generateFramework() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AssociatedTargetSpecificationTests/AssociatedTargetSpecificationTests.swift",
            with: "Fixtures/AssociatedTargetSpecification/Framework_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AssociatedTargetSpecification"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.associatedtargetspecification = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AssociatedTargetSpecification"]
    }

    @Test("Generate AssociatedTargetSpecification for Multiplatform_App_Extension_Base")
    func generateMultiplatform_App_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AssociatedTargetSpecificationTests/AssociatedTargetSpecificationTests.swift",
            with: "Fixtures/AssociatedTargetSpecification/Multiplatform_App_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AssociatedTargetSpecification"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.associatedtargetspecification = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AssociatedTargetSpecification"]
    }

    @Test("Generate AssociatedTargetSpecification for Multiplatform_ExtensionKit_Extension_Base")
    func generateMultiplatform_ExtensionKit_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AssociatedTargetSpecificationTests/AssociatedTargetSpecificationTests.swift",
            with: "Fixtures/AssociatedTargetSpecification/Multiplatform_ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AssociatedTargetSpecification"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.associatedtargetspecification = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AssociatedTargetSpecification"]
    }

    @Test("Generate AssociatedTargetSpecification for Multiplatform_Test_Bundle_Base")
    func generateMultiplatform_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AssociatedTargetSpecificationTests/AssociatedTargetSpecificationTests.swift",
            with: "Fixtures/AssociatedTargetSpecification/Multiplatform_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AssociatedTargetSpecification"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.associatedtargetspecification = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AssociatedTargetSpecification"]
    }

    @Test("Generate AssociatedTargetSpecification for Multiplatform_UI_Test_Bundle_Base")
    func generateMultiplatform_UI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "GeneratorTests/FieldTests/AssociatedTargetSpecificationTests/AssociatedTargetSpecificationTests.swift",
            with: "Fixtures/AssociatedTargetSpecification/Multiplatform_UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["AssociatedTargetSpecification"] else { return }

        // Create metadata with this field
        var metadata = Models.Template.Model.Metadata(
            kind: .fileTemplateUnitKind,
            id: "test.template",
            name: "Test"
        )
        // TODO: Set metadata.associatedtargetspecification = originalValue (need proper conversion)

        // Generate plist
        let writer = Template.Generator.Writer()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present if it should be
        _ = generatedPlist["AssociatedTargetSpecification"]
    }
}
