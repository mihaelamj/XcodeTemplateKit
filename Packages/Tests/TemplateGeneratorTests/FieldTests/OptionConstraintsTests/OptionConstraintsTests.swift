// swiftlint:disable force_cast
import Foundation
@testable import TemplateGenerator
import TemplateModels
import Testing

/// Generator tests for the "OptionConstraints" field
///
/// Tests that TemplateWriter correctly serializes OptionConstraints values to plist format.
@Suite("OptionConstraints Field Generation")
struct OptionConstraintsTests {
    @Test("Generate OptionConstraints for App_Extension_Base")
    func generateApp_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/App_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Verify parsed structure
        #expect(constraints.constraints.count == 1)
        #expect(constraints.constraints[0].constraintType == .requirementIfAssociatedTarget)
        #expect(constraints.constraints[0].identifier == "bundleIdentifierPrefix")
        #expect(constraints.constraints[0].value == "___ASSOCIATEDTARGET_bundleIdentifier___")

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
        #expect(generatedValue[0]["ConstraintType"] as? String == "RequirementIfAssociatedTarget")
        #expect(generatedValue[0]["Identifier"] as? String == "bundleIdentifierPrefix")
        #expect(generatedValue[0]["Value"] as? String == "___ASSOCIATEDTARGET_bundleIdentifier___")
    }

    @Test("Generate OptionConstraints for ExtensionKit_Extension_Base")
    func generateExtensionKit_Extension_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Verify parsed structure
        #expect(constraints.constraints.count == 1)
        #expect(constraints.constraints[0].constraintType == .requirementIfAssociatedTarget)

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }

    @Test("Generate OptionConstraints for SwiftUI_App_UI_Test_Bundle_Base")
    func generateSwiftUI_App_UI_Test_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/SwiftUI_App_UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }

    @Test("Generate OptionConstraints for SwiftUI_App_Unit_Testing_Bundle_Base")
    func generateSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }

    @Test("Generate OptionConstraints for UI_Testing_Bundle")
    func generateUI_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/UI_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }

    @Test("Generate OptionConstraints for Unit_Testing_Bundle")
    func generateUnit_Testing_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/Unit_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }

    @Test("Generate OptionConstraints for iOS_App_UI_Test_Bundle")
    func generateiOS_App_UI_Test_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/iOS_App_UI_Test_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }

    @Test("Generate OptionConstraints for macOS_App_UI_Test_Bundle")
    func generatemacOS_App_UI_Test_Bundle() throws {
        // Load original fixture
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateGeneratorTests/FieldTests/OptionConstraintsTests/OptionConstraintsTests.swift",
            with: "Fixtures/OptionConstraints/macOS_App_UI_Test_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Extract field value from original
        guard let originalValue = originalPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints")
        }

        // Parse to typed model
        let constraintsData = try PropertyListSerialization.data(fromPropertyList: originalValue, format: .binary, options: 0)
        let constraints = try PropertyListDecoder().decode(OptionConstraints.self, from: constraintsData)

        // Create metadata with this field
        let metadata = Metadata(
            name: "Test",
            path: "/test/path",
            kind: .unknown("com.test.template"),
            optionConstraints: constraints
        )

        // Generate plist
        let writer = TemplateWriter()
        let generatedPlist = try writer.createPlist(from: metadata)

        // Verify field is present and matches original structure
        guard let generatedValue = generatedPlist["OptionConstraints"] as? [[String: Any]] else {
            throw TestError.missingField("OptionConstraints in generated plist")
        }

        #expect(generatedValue.count == originalValue.count)
    }
}

enum TestError: Error {
    case missingField(String)
}
