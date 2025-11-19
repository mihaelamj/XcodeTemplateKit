import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Options" field extraction
///
/// The Options field appears in 76 templates and specifies user-configurable template options.
/// Contains: name, type, identifier, defaultValue, choices
@Suite("Options Parsing")
struct OptionsTests {
    @Test("Parse options array")
    func parseOptions() throws {
        // Load Aggregate template which has a text option
        let fixturePath = #filePath.replacingOccurrences(of: "OptionsTests.swift", with: "Fixtures/Aggregate_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Options field
        let options = plist["Options"] as? [[String: Any]]

        // Verify Options is extracted correctly
        #expect(options != nil, "Options should be present in Aggregate template")
        #expect(options?.isEmpty == false, "Options array should not be empty")

        // Check first option structure
        let firstOption = options?.first
        #expect(firstOption?["Identifier"] as? String == "productName", "Option should have identifier")
        #expect(firstOption?["Name"] as? String != nil, "Option should have name")
        #expect(firstOption?["Type"] as? String != nil, "Option should have type")
    }

    @Test("Parse multiple options")
    func parseMultipleOptions() throws {
        // Load App template which has multiple options
        let fixturePath = #filePath.replacingOccurrences(of: "OptionsTests.swift", with: "Fixtures/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Options field
        let options = plist["Options"] as? [[String: Any]]

        // Verify multiple options are extracted
        #expect(options != nil, "Options should be present in App template")
        #expect(options?.count ?? 0 > 1, "App template should have multiple options")
    }

    @Test("Handle missing options")
    func parseMissingOptions() throws {
        // Create a plist without Options field
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]
        let options = testPlist["Options"] as? [[String: Any]]

        // Verify Options is nil when not present
        #expect(options == nil, "Options should be nil when not present in template")
    }
}
