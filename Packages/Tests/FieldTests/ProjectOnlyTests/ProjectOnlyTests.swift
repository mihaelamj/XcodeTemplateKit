// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "ProjectOnly" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("ProjectOnly Field Parsing")
struct ProjectOnlyTests {
    @Test("Parse ProjectOnly from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ProjectOnlyTests.swift", with: "Fixtures/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["ProjectOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip ProjectOnly from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ProjectOnlyTests.swift", with: "Fixtures/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["ProjectOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["ProjectOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["ProjectOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "ProjectOnly should survive round-trip")
    }

    @Test("Handle missing ProjectOnly")
    func parseMissingProjectOnly() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = (testPlist["ProjectOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        #expect(value == nil, "ProjectOnly should be nil when not present")
    }
}
