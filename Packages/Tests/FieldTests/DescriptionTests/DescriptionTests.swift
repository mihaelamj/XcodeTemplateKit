import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Description" field extraction
///
/// The Description field appears in 69 templates and provides detailed template description.
/// Example: "This template creates an empty project with no files or targets."
@Suite("Description Parsing")
struct DescriptionFieldTests {
    @Test("Parse description from template")
    func parseDescription() throws {
        // Load fixture plist
        let fixturePath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/Packages/Tests/TemplateParserTests/Fixtures/Description_App.plist"
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Description field
        let description = plist["Description"] as? String

        // Verify Description is extracted correctly
        #expect(description != nil, "Description should be present in App template")
        #expect(description == "This template creates a multi-platform SwiftUI application.", "Description should match expected value")
    }

    @Test("Handle missing description")
    func parseMissingDescription() throws {
        // Load fixture plist without Description field
        let fixturePath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/Packages/Tests/TemplateParserTests/Fixtures/Description_Missing.plist"
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Description field
        let description = plist["Description"] as? String

        // Verify Description is nil when not present
        #expect(description == nil, "Description should be nil when not present in template")
    }
}
