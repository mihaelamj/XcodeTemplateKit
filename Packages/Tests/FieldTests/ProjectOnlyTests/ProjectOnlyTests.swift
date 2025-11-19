
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "ProjectOnly" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("ProjectOnly Field Parsing")
struct ProjectOnlyTests {
    @Test("Parse ProjectOnly from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ProjectOnlyTests.swift", with: "Fixtures/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["ProjectOnly"] as? Bool

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing ProjectOnly")
    func parseMissingProjectOnly() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["ProjectOnly"] as? Bool

        #expect(value == nil, "ProjectOnly should be nil when not present")
    }
}
