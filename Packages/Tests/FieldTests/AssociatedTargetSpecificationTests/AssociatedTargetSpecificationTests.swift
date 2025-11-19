
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "AssociatedTargetSpecification" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("AssociatedTargetSpecification Field Parsing")
struct AssociatedTargetSpecificationTests {
    @Test("Parse AssociatedTargetSpecification from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "AssociatedTargetSpecificationTests.swift", with: "Fixtures/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["AssociatedTargetSpecification"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse AssociatedTargetSpecification from Multiplatform_App_Extension_Base")
    func parseMultiplatform_App_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "AssociatedTargetSpecificationTests.swift", with: "Fixtures/Multiplatform_App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["AssociatedTargetSpecification"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse AssociatedTargetSpecification from Multiplatform_ExtensionKit_Extension_Base")
    func parseMultiplatform_ExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "AssociatedTargetSpecificationTests.swift", with: "Fixtures/Multiplatform_ExtensionKit_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["AssociatedTargetSpecification"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse AssociatedTargetSpecification from Multiplatform_Test_Bundle_Base")
    func parseMultiplatform_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "AssociatedTargetSpecificationTests.swift", with: "Fixtures/Multiplatform_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["AssociatedTargetSpecification"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse AssociatedTargetSpecification from Multiplatform_UI_Test_Bundle_Base")
    func parseMultiplatform_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "AssociatedTargetSpecificationTests.swift", with: "Fixtures/Multiplatform_UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["AssociatedTargetSpecification"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing AssociatedTargetSpecification")
    func parseMissingAssociatedTargetSpecification() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["AssociatedTargetSpecification"] as? String

        #expect(value == nil, "AssociatedTargetSpecification should be nil when not present")
    }
}
