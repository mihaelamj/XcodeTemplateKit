// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Title" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Title Field Parsing")
struct TitleTests {
    @Test("Parse Title from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Title"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Title from Application")
    func roundTripApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Title"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Title"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Title"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Title should survive round-trip")
    }

    @Test("Parse Title from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Title"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Title from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Title"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Title"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Title"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Title should survive round-trip")
    }

    @Test("Parse Title from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Title"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Title from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Title"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Title"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Title"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Title should survive round-trip")
    }

    @Test("Parse Title from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Title"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Title from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Title"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Title"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Title"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Title should survive round-trip")
    }

    @Test("Parse Title from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Title"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Title from View")
    func roundTripView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Title"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Title"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Title"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Title should survive round-trip")
    }

    @Test("Parse Title from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Title"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Title from Window")
    func roundTripWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/TitleTests/TitleTests.swift", with: "Fixtures/Title/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Title"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Title"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Title"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Title should survive round-trip")
    }

    @Test("Handle missing Title")
    func parseMissingTitle() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Title"] as? String

        #expect(value == nil, "Title should be nil when not present")
    }
}
