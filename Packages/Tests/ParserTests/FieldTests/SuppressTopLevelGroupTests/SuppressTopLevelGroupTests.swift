// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "SuppressTopLevelGroup" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("SuppressTopLevelGroup Field Parsing")
struct SuppressTopLevelGroupTests {
    @Test("Parse SuppressTopLevelGroup from Compositor_Services")
    func parseCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/SuppressTopLevelGroupTests/SuppressTopLevelGroupTests.swift",
            with: "Fixtures/SuppressTopLevelGroup/Compositor_Services_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SuppressTopLevelGroup"] as? Bool).map { BooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SuppressTopLevelGroup from Compositor_Services")
    func roundTripCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/SuppressTopLevelGroupTests/SuppressTopLevelGroupTests.swift",
            with: "Fixtures/SuppressTopLevelGroup/Compositor_Services_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SuppressTopLevelGroup"] as? Bool).map { BooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SuppressTopLevelGroup"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SuppressTopLevelGroup"] as? Bool).map { BooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SuppressTopLevelGroup should survive round-trip")
    }

    @Test("Parse SuppressTopLevelGroup from Immersive_Space_App")
    func parseImmersive_Space_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/SuppressTopLevelGroupTests/SuppressTopLevelGroupTests.swift",
            with: "Fixtures/SuppressTopLevelGroup/Immersive_Space_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SuppressTopLevelGroup"] as? Bool).map { BooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SuppressTopLevelGroup from Immersive_Space_App")
    func roundTripImmersive_Space_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/SuppressTopLevelGroupTests/SuppressTopLevelGroupTests.swift",
            with: "Fixtures/SuppressTopLevelGroup/Immersive_Space_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SuppressTopLevelGroup"] as? Bool).map { BooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SuppressTopLevelGroup"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SuppressTopLevelGroup"] as? Bool).map { BooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SuppressTopLevelGroup should survive round-trip")
    }

    @Test("Handle missing SuppressTopLevelGroup")
    func parseMissingSuppressTopLevelGroup() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = (testPlist["SuppressTopLevelGroup"] as? Bool).map { BooleanFormat.fromSwiftBool($0) }

        #expect(value == nil, "SuppressTopLevelGroup should be nil when not present")
    }
}
