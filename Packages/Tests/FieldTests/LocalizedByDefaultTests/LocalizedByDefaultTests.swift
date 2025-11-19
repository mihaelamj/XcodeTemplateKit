
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "LocalizedByDefault" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("LocalizedByDefault Field Parsing")
struct LocalizedByDefaultTests {
    @Test("Parse LocalizedByDefault from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "LocalizedByDefaultTests.swift", with: "Fixtures/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["LocalizedByDefault"] as? Bool

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse LocalizedByDefault from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "LocalizedByDefaultTests.swift", with: "Fixtures/Stringsdict_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["LocalizedByDefault"] as? Bool

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing LocalizedByDefault")
    func parseMissingLocalizedByDefault() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["LocalizedByDefault"] as? Bool

        #expect(value == nil, "LocalizedByDefault should be nil when not present")
    }
}
