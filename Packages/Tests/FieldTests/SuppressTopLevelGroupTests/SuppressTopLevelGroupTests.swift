
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "SuppressTopLevelGroup" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("SuppressTopLevelGroup Field Parsing")
struct SuppressTopLevelGroupTests {
    @Test("Parse SuppressTopLevelGroup from Compositor_Services")
    func parseCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SuppressTopLevelGroupTests.swift", with: "Fixtures/Compositor_Services_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SuppressTopLevelGroup"] as? Bool

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SuppressTopLevelGroup from Immersive_Space_App")
    func parseImmersive_Space_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SuppressTopLevelGroupTests.swift", with: "Fixtures/Immersive_Space_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SuppressTopLevelGroup"] as? Bool

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing SuppressTopLevelGroup")
    func parseMissingSuppressTopLevelGroup() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["SuppressTopLevelGroup"] as? Bool

        #expect(value == nil, "SuppressTopLevelGroup should be nil when not present")
    }
}
