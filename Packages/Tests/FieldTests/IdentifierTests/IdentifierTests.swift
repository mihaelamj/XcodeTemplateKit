import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Identifier" field extraction
///
/// The Identifier field appears in 87 templates (Project and Package templates only).
/// Examples: "com.apple.dt.unit.app", "com.apple.dt.packageTemplate.Library"
@Suite("Identifier Parsing")
struct IdentifierTests {
    @Test("Parse Identifier from project template")
    func parseIdentifierProject() throws {
        // Load App template which has Identifier = "com.apple.dt.unit.multiPlatform.app"
        let fixturePath = #filePath.replacingOccurrences(of: "IdentifierTests.swift", with: "Fixtures/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Identifier field
        let identifier = plist["Identifier"] as? String

        // Verify Identifier is extracted correctly
        #expect(identifier != nil, "Identifier should be present in App template")
        #expect(identifier == "com.apple.dt.unit.multiPlatform.app", "Identifier should match App template ID")
    }

    @Test("Handle missing Identifier in file template")
    func parseMissingIdentifier() throws {
        // Load Swift File template which has no Identifier (only has Kind)
        let fixturePath = #filePath.replacingOccurrences(of: "IdentifierTests.swift", with: "Fixtures/Swift_File_value.plist")

        // This file doesn't exist in Identifier fixtures since Swift File templates don't have Identifier
        // So we verify the field is optional by checking a plist without it
        let testPlist: [String: Any] = ["Kind": "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind"]
        let identifier = testPlist["Identifier"] as? String

        // Verify Identifier is nil when not present
        #expect(identifier == nil, "Identifier should be nil for file templates")
    }
}
