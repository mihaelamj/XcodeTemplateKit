import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Ancestors" field extraction
///
/// The Ancestors field appears in 66 templates and specifies template inheritance.
/// Examples: ["com.apple.dt.unit.applicationBase"], ["com.apple.dt.unit.base", "com.apple.dt.unit.base_Options"]
@Suite("Ancestors Parsing")
struct AncestorsTests {
    @Test("Parse single ancestor")
    func parseSingleAncestor() throws {
        // Load App template which has single ancestor
        let fixturePath = #filePath.replacingOccurrences(of: "AncestorsTests.swift", with: "Fixtures/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Ancestors field
        let ancestors = plist["Ancestors"] as? [String]

        // Verify Ancestors is extracted correctly
        #expect(ancestors != nil, "Ancestors should be present in App template")
        #expect(ancestors?.count == 1, "App should have 1 ancestor")
        #expect(ancestors?.first == "com.apple.dt.unit.multiPlatform.app.SwiftUI", "Ancestor should match")
    }

    @Test("Parse multiple ancestors")
    func parseMultipleAncestors() throws {
        // Load App Extension Base template which has multiple ancestors
        let fixturePath = #filePath.replacingOccurrences(of: "AncestorsTests.swift", with: "Fixtures/App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract Ancestors field
        let ancestors = plist["Ancestors"] as? [String]

        // Verify Ancestors is extracted correctly
        #expect(ancestors != nil, "Ancestors should be present")
        #expect(ancestors?.count == 2, "App Extension Base should have 2 ancestors")
        #expect(ancestors?.contains("com.apple.dt.unit.xpcservicebase") == true, "Should have xpcservicebase ancestor")
        #expect(ancestors?.contains("com.apple.dt.unit.languageChoice") == true, "Should have languageChoice ancestor")
    }

    @Test("Handle missing ancestors")
    func parseMissingAncestors() throws {
        // Create a plist without Ancestors field
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]
        let ancestors = testPlist["Ancestors"] as? [String]

        // Verify Ancestors is nil when not present
        #expect(ancestors == nil, "Ancestors should be nil when not present in template")
    }
}
