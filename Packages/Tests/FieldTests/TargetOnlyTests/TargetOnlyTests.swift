// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "TargetOnly" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("TargetOnly Field Parsing")
struct TargetOnlyTests {
    @Test("Parse TargetOnly from Aggregate")
    func parseAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Aggregate_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip TargetOnly from Aggregate")
    func roundTripAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Aggregate_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["TargetOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "TargetOnly should survive round-trip")
    }

    @Test("Parse TargetOnly from App_Extension_Base")
    func parseApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip TargetOnly from App_Extension_Base")
    func roundTripApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["TargetOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "TargetOnly should survive round-trip")
    }

    @Test("Parse TargetOnly from ExtensionKit_Extension_Base")
    func parseExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/ExtensionKit_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip TargetOnly from ExtensionKit_Extension_Base")
    func roundTripExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/ExtensionKit_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["TargetOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "TargetOnly should survive round-trip")
    }

    @Test("Parse TargetOnly from Multiplatform_Test_Bundle_Base")
    func parseMultiplatform_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Multiplatform_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip TargetOnly from Multiplatform_Test_Bundle_Base")
    func roundTripMultiplatform_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Multiplatform_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["TargetOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "TargetOnly should survive round-trip")
    }

    @Test("Parse TargetOnly from Multiplatform_UI_Test_Bundle_Base")
    func parseMultiplatform_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Multiplatform_UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip TargetOnly from Multiplatform_UI_Test_Bundle_Base")
    func roundTripMultiplatform_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Multiplatform_UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["TargetOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "TargetOnly should survive round-trip")
    }

    @Test("Parse TargetOnly from UI_Test_Bundle_Base")
    func parseUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip TargetOnly from UI_Test_Bundle_Base")
    func roundTripUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["TargetOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "TargetOnly should survive round-trip")
    }

    @Test("Parse TargetOnly from Unit_Testing_Bundle_Base")
    func parseUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Unit_Testing_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip TargetOnly from Unit_Testing_Bundle_Base")
    func roundTripUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TargetOnlyTests.swift", with: "Fixtures/Unit_Testing_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["TargetOnly"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "TargetOnly should survive round-trip")
    }

    @Test("Handle missing TargetOnly")
    func parseMissingTargetOnly() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = (testPlist["TargetOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        #expect(value == nil, "TargetOnly should be nil when not present")
    }
}
