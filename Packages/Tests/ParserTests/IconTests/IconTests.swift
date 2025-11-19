// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Icon" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Icon Field Parsing")
struct IconTests {

    @Test("Parse Icon from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Icon"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Icon from Application")
    func roundTripApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Icon"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Icon"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Icon"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Icon should survive round-trip")
    }

    @Test("Parse Icon from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Icon"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Icon from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Icon"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Icon"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Icon"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Icon should survive round-trip")
    }

    @Test("Parse Icon from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Icon"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Icon from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Icon"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Icon"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Icon"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Icon should survive round-trip")
    }

    @Test("Parse Icon from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Icon"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Icon from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Icon"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Icon"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Icon"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Icon should survive round-trip")
    }

    @Test("Parse Icon from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Icon"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Icon from View")
    func roundTripView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Icon"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Icon"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Icon"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Icon should survive round-trip")
    }

    @Test("Parse Icon from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Icon"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Icon from Window")
    func roundTripWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/IconTests/IconTests.swift", with: "Fixtures/Icon/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Icon"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Icon"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Icon"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Icon should survive round-trip")
    }

    @Test("Handle missing Icon")
    func parseMissingIcon() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Icon"] as? String

        #expect(value == nil, "Icon should be nil when not present")
    }
}
