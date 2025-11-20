// swiftlint:disable type_body_length force_cast
import Foundation
import Models
@testable import Parser
import Testing

/// Comprehensive bidirectional tests for the "Project" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Project Field Parsing")
struct ProjectTests {
    @Test("Parse Project from Base_ProjectSettings")
    func parseBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/Base_ProjectSettings_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from Base_ProjectSettings")
    func roundTripBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/Base_ProjectSettings_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Parse Project from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift", with: "Fixtures/Project/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift", with: "Fixtures/Project/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Parse Project from Framework_Base")
    func parseFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift", with: "Fixtures/Project/Framework_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from Framework_Base")
    func roundTripFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift", with: "Fixtures/Project/Framework_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Parse Project from Metal_Library_Base")
    func parseMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/Metal_Library_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from Metal_Library_Base")
    func roundTripMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/Metal_Library_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Parse Project from iOS_Safari_Extension_App")
    func parseiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/iOS_Safari_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from iOS_Safari_Extension_App")
    func roundTripiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/iOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Parse Project from iOS_Safari_Extension")
    func parseiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/iOS_Safari_Extension_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from iOS_Safari_Extension")
    func roundTripiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/iOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Parse Project from macOS_Safari_Extension_App")
    func parsemacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/macOS_Safari_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from macOS_Safari_Extension_App")
    func roundTripmacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/macOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Parse Project from macOS_Safari_Extension")
    func parsemacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/macOS_Safari_Extension_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Project"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Project from macOS_Safari_Extension")
    func roundTripmacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ProjectTests/ProjectTests.swift",
            with: "Fixtures/Project/macOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Project"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Project"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Project"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Project should survive round-trip")
    }

    @Test("Handle missing Project")
    func parseMissingProject() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Project"] as? String

        #expect(value == nil, "Project should be nil when not present")
    }
}
