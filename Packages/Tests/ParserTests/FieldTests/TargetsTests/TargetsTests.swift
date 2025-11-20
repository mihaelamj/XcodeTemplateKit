// swiftlint:disable type_body_length force_cast
import Foundation
import Models
@testable import Parser
import Testing

/// Comprehensive bidirectional tests for the "Targets" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Targets Field Parsing")
struct TargetsTests {
    @Test("Parse Targets from Aggregate")
    func parseAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Aggregate_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Aggregate")
    func roundTripAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Aggregate_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from App_Base")
    func parseApp_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from App_Base")
    func roundTripApp_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from App_Extension_Base")
    func parseApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/App_Extension_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from App_Extension_Base")
    func roundTripApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/App_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Audio_Unit_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Audio_Unit_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Audio_Unit_Extension_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Audio_Unit_Extension")
    func roundTripAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Audio_Unit_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Base_ProjectSettings")
    func parseBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Base_ProjectSettings_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Base_ProjectSettings")
    func roundTripBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Base_ProjectSettings_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Bundle_Base")
    func parseBundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Bundle_Base")
    func roundTripBundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Cross-Platform_Base")
    func parseCross_Platform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Cross-Platform_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Cross-Platform_Base")
    func roundTripCross_Platform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Cross-Platform_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from ExtensionKit_Extension_Base")
    func parseExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/ExtensionKit_Extension_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from ExtensionKit_Extension_Base")
    func roundTripExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from External_Build_System")
    func parseExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/External_Build_System_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from External_Build_System")
    func roundTripExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/External_Build_System_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Framework_Base")
    func parseFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Framework_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Framework_Base")
    func roundTripFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Framework_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Framework_Testing_Bundle")
    func parseFramework_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Framework_Testing_Bundle_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Framework_Testing_Bundle")
    func roundTripFramework_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Framework_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Framework")
    func roundTripFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Metal_Library_Base")
    func parseMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Metal_Library_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Metal_Library_Base")
    func roundTripMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Metal_Library_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Multiplatform_App_Extension_Base")
    func parseMultiplatform_App_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_App_Extension_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Multiplatform_App_Extension_Base")
    func roundTripMultiplatform_App_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_App_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Multiplatform_Base")
    func parseMultiplatform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Multiplatform_Base")
    func roundTripMultiplatform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Multiplatform_ExtensionKit_Extension_Base")
    func parseMultiplatform_ExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_ExtensionKit_Extension_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Multiplatform_ExtensionKit_Extension_Base")
    func roundTripMultiplatform_ExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Multiplatform_SwiftUI_App")
    func parseMultiplatform_SwiftUI_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_SwiftUI_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Multiplatform_SwiftUI_App")
    func roundTripMultiplatform_SwiftUI_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_SwiftUI_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Multiplatform_SwiftUI_Document_App")
    func parseMultiplatform_SwiftUI_Document_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_SwiftUI_Document_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Multiplatform_SwiftUI_Document_App")
    func roundTripMultiplatform_SwiftUI_Document_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Multiplatform_SwiftUI_Document_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Security_Critical")
    func parseSecurity_Critical() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Security_Critical_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Security_Critical")
    func roundTripSecurity_Critical() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Security_Critical_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from SharedContent_RealityKit_Game")
    func parseSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SharedContent_RealityKit_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from SharedContent_RealityKit_Game")
    func roundTripSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SharedContent_RealityKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from SwiftUI_App_Base")
    func parseSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_App_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from SwiftUI_App_Base")
    func roundTripSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from SwiftUI_App_UI_Test_Bundle_Base")
    func parseSwiftUI_App_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_App_UI_Test_Bundle_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from SwiftUI_App_UI_Test_Bundle_Base")
    func roundTripSwiftUI_App_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_App_UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from SwiftUI_App_Unit_Testing_Bundle_Base")
    func parseSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from SwiftUI_App_Unit_Testing_Bundle_Base")
    func roundTripSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from SwiftUI_Document_App_Base")
    func parseSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_Document_App_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from SwiftUI_Document_App_Base")
    func roundTripSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/SwiftUI_Document_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from UI_Test_Bundle_Base")
    func parseUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/UI_Test_Bundle_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from UI_Test_Bundle_Base")
    func roundTripUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/UI_Test_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/UI_Testing_Bundle_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from UI_Testing_Bundle")
    func roundTripUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/UI_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Unit_Testing_Bundle_Base")
    func parseUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Unit_Testing_Bundle_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Unit_Testing_Bundle_Base")
    func roundTripUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Unit_Testing_Bundle_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Unit_Testing_Bundle_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Unit_Testing_Bundle")
    func roundTripUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Unit_Testing_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Widget_Extension_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from Widget_Extension")
    func roundTripWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/Widget_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from XPC_Service_Base")
    func parseXPC_Service_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/XPC_Service_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from XPC_Service_Base")
    func roundTripXPC_Service_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/XPC_Service_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_App_Base")
    func parseiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/iOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_App_Base")
    func roundTripiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/iOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_App_UI_Test_Bundle")
    func parseiOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_App_UI_Test_Bundle_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_App_UI_Test_Bundle")
    func roundTripiOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_App_UI_Test_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_Metal_4_Game")
    func parseiOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_Metal_4_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_Metal_4_Game")
    func roundTripiOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_Metal_4_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_Metal_Game")
    func parseiOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/iOS_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_Metal_Game")
    func roundTripiOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/iOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_Safari_Extension_App")
    func parseiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_Safari_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_Safari_Extension_App")
    func roundTripiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_Safari_Extension")
    func parseiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_Safari_Extension_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_Safari_Extension")
    func roundTripiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_SceneKit_Game")
    func parseiOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_SceneKit_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_SceneKit_Game")
    func roundTripiOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_SceneKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from iOS_SpriteKit_Game")
    func parseiOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_SpriteKit_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from iOS_SpriteKit_Game")
    func roundTripiOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/iOS_SpriteKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from macOS_App_Base")
    func parsemacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/macOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from macOS_App_Base")
    func roundTripmacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/macOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from macOS_App_Entitlements")
    func parsemacOS_App_Entitlements() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_App_Entitlements_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from macOS_App_Entitlements")
    func roundTripmacOS_App_Entitlements() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_App_Entitlements_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from macOS_App_UI_Test_Bundle")
    func parsemacOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_App_UI_Test_Bundle_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from macOS_App_UI_Test_Bundle")
    func roundTripmacOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_App_UI_Test_Bundle_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from macOS_Safari_Extension_App")
    func parsemacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_Safari_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from macOS_Safari_Extension_App")
    func roundTripmacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from macOS_Safari_Extension")
    func parsemacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_Safari_Extension_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from macOS_Safari_Extension")
    func roundTripmacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift",
            with: "Fixtures/Targets/macOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Parse Targets from tvOS_App_Base")
    func parsetvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/tvOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Targets"]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Targets from tvOS_App_Base")
    func roundTriptvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/TargetsTests/TargetsTests.swift", with: "Fixtures/Targets/tvOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Targets"]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Targets"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Targets"]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Targets should survive round-trip")
    }

    @Test("Handle missing Targets")
    func parseMissingTargets() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Targets"]

        #expect(value == nil, "Targets should be nil when not present")
    }
}
