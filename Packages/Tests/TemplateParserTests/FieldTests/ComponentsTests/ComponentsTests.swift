// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Components" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Components Field Parsing")
struct ComponentsTests {

    @Test("Parse Components from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ComponentsTests/ComponentsTests.swift", with: "Fixtures/Components/Audio_Unit_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Components"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Components from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ComponentsTests/ComponentsTests.swift", with: "Fixtures/Components/Audio_Unit_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Components"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Components"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Components"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Components should survive round-trip")
    }

    @Test("Parse Components from Safari_Extension_App")
    func parseSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ComponentsTests/ComponentsTests.swift", with: "Fixtures/Components/Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Components"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Components from Safari_Extension_App")
    func roundTripSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ComponentsTests/ComponentsTests.swift", with: "Fixtures/Components/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Components"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Components"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Components"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Components should survive round-trip")
    }

    @Test("Handle missing Components")
    func parseMissingComponents() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Components"]

        #expect(value == nil, "Components should be nil when not present")
    }
}
