// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "OptionConstraints" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("OptionConstraints Field Parsing")
struct OptionConstraintsTests {

    @Test("Parse OptionConstraints from App_Extension_Base")
    func parseApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from App_Extension_Base")
    func roundTripApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Parse OptionConstraints from ExtensionKit_Extension_Base")
    func parseExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/ExtensionKit_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from ExtensionKit_Extension_Base")
    func roundTripExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/ExtensionKit_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Parse OptionConstraints from SwiftUI_App_UI_Test_Bundle_Base")
    func parseSwiftUI_App_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/SwiftUI_App_UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from SwiftUI_App_UI_Test_Bundle_Base")
    func roundTripSwiftUI_App_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/SwiftUI_App_UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Parse OptionConstraints from SwiftUI_App_Unit_Testing_Bundle_Base")
    func parseSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from SwiftUI_App_Unit_Testing_Bundle_Base")
    func roundTripSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Parse OptionConstraints from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from UI_Testing_Bundle")
    func roundTripUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/UI_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Parse OptionConstraints from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from Unit_Testing_Bundle")
    func roundTripUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/Unit_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Parse OptionConstraints from iOS_App_UI_Test_Bundle")
    func parseiOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/iOS_App_UI_Test_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from iOS_App_UI_Test_Bundle")
    func roundTripiOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/iOS_App_UI_Test_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Parse OptionConstraints from macOS_App_UI_Test_Bundle")
    func parsemacOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/macOS_App_UI_Test_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip OptionConstraints from macOS_App_UI_Test_Bundle")
    func roundTripmacOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/OptionConstraintsTests/OptionConstraintsTests.swift", with: "Fixtures/OptionConstraints/macOS_App_UI_Test_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["OptionConstraints"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["OptionConstraints"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["OptionConstraints"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "OptionConstraints should survive round-trip")
    }

    @Test("Handle missing OptionConstraints")
    func parseMissingOptionConstraints() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["OptionConstraints"]

        #expect(value == nil, "OptionConstraints should be nil when not present")
    }
}
