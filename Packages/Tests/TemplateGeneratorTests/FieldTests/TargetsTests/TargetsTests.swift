// swiftlint:disable force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "Targets" field
///
/// Tests that TemplateWriter correctly serializes Targets values to plist format.
@Suite("Targets Field Generation")
struct TargetsTests {
    @Test("Generate Targets for App_Base")
    func generateApp_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Targets"] as? [[String: Any]] else {
            throw TestError.missingField("Targets")
        }

        // Parse to typed model
        let targetsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let targets = try PropertyListDecoder().decode(TemplateTargets.self, from: targetsData)

        // Verify parsed structure
        #expect(targets.targets.count == 1)
        #expect(targets.targets[0].productType == "com.apple.product-type.application")
        #expect(targets.targets[0].buildPhases?.count == 3)

        // Create metadata with this field
        let metadata = TemplateMetadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            targets: targets
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["Targets"] as? [[String: Any]] else {
            throw TestError.missingField("Targets in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
        #expect(generatedValue[0]["ProductType"] as? String == "com.apple.product-type.application")

        let buildPhases = generatedValue[0]["BuildPhases"] as? [[String: Any]]
        #expect(buildPhases?.count == 3)
    }

    @Test("Generate Targets for Aggregate")
    func generateAggregate() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Aggregate_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["Targets"] as? [[String: Any]] else {
            throw TestError.missingField("Targets")
        }

        // Parse to typed model
        let targetsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let targets = try PropertyListDecoder().decode(TemplateTargets.self, from: targetsData)

        // Verify parsed structure
        #expect(!targets.targets.isEmpty)

        // Create metadata with this field
        let metadata = TemplateMetadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            targets: targets
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["Targets"] as? [[String: Any]] else {
            throw TestError.missingField("Targets in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }
}

enum TestError: Error {
    case missingField(String)
}
