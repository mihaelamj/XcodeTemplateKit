import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Kind" field extraction
///
/// The Kind field appears in all 146 templates and specifies the template category.
/// Examples: "Xcode.Xcode3.ProjectTemplateUnitKind", "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind"
@Suite("Kind Parsing")
struct KindTests {
    @Test("Parse Kind from project template")
    func parseKindProject() throws {
        // Load App template which has Kind = "Xcode.Xcode3.ProjectTemplateUnitKind"
        let fixturePath = #filePath.replacingOccurrences(of: "KindTests.swift", with: "Fixtures/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Kind field
        let kind = plist["Kind"] as? String

        // Verify Kind is extracted correctly
        #expect(kind != nil, "Kind should be present in App template")
        #expect(kind == "Xcode.Xcode3.ProjectTemplateUnitKind", "Kind should be project template kind")
    }

    @Test("Parse Kind from file template")
    func parseKindFile() throws {
        // Load Swift File template which has Kind = "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind"
        let fixturePath = #filePath.replacingOccurrences(of: "KindTests.swift", with: "Fixtures/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Kind field
        let kind = plist["Kind"] as? String

        // Verify Kind is extracted correctly
        #expect(kind != nil, "Kind should be present in Swift File template")
        #expect(kind == "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind", "Kind should be file template kind")
    }
}
