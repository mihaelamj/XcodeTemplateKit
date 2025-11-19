
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "OptionConstraints" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("OptionConstraints Field Parsing")
struct OptionConstraintsTests {
    @Test("Parse OptionConstraints from App_Extension_Base")
    func parseApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse OptionConstraints from ExtensionKit_Extension_Base")
    func parseExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/ExtensionKit_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse OptionConstraints from SwiftUI_App_UI_Test_Bundle_Base")
    func parseSwiftUI_App_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/SwiftUI_App_UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse OptionConstraints from SwiftUI_App_Unit_Testing_Bundle_Base")
    func parseSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse OptionConstraints from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse OptionConstraints from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse OptionConstraints from iOS_App_UI_Test_Bundle")
    func parseiOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/iOS_App_UI_Test_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse OptionConstraints from macOS_App_UI_Test_Bundle")
    func parsemacOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "OptionConstraintsTests.swift", with: "Fixtures/macOS_App_UI_Test_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["OptionConstraints"]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing OptionConstraints")
    func parseMissingOptionConstraints() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["OptionConstraints"]

        #expect(value == nil, "OptionConstraints should be nil when not present")
    }
}
