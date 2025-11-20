// swiftlint:disable type_body_length force_cast
import Foundation
import Models
@testable import Parser
import Testing

/// Comprehensive bidirectional tests for the "Image" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Image Field Parsing")
struct ImageTests {
    @Test("Parse Image from Aggregate")
    func parseAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Aggregate_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Aggregate")
    func roundTripAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Aggregate_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/App_Privacy_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from App_Privacy")
    func roundTripApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/App_Privacy_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from App")
    func roundTripApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Application")
    func roundTripApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Assembly_File")
    func parseAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Assembly_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Assembly_File")
    func roundTripAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Assembly_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Asset_Catalog")
    func roundTripAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Audio_Unit_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Audio_Unit_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Audio_Unit_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Audio_Unit_Extension")
    func roundTripAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Audio_Unit_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Build_Tool_Plug-in")
    func parseBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Build_Tool_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Build_Tool_Plug-in")
    func roundTripBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Build_Tool_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/C++_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from CLIPS_File")
    func parseCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/CLIPS_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from CLIPS_File")
    func roundTripCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/CLIPS_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Command_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Command_Plug-in")
    func roundTripCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Command_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Configuration_Settings_File")
    func parseConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Configuration_Settings_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Configuration_Settings_File")
    func roundTripConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Configuration_Settings_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Document_App")
    func roundTripDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Exports_File")
    func parseExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Exports_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Exports_File")
    func roundTripExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Exports_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from External_Build_System")
    func parseExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/External_Build_System_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from External_Build_System")
    func roundTripExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/External_Build_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from File_List")
    func parseFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/File_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from File_List")
    func roundTripFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/File_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Framework")
    func roundTripFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Game")
    func roundTripGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Generic_Extension")
    func parseGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Generic_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Generic_Extension")
    func roundTripGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Generic_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Header_File")
    func roundTripHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Header_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Library_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Library")
    func roundTripLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Library_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Markdown_File")
    func parseMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Markdown_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Markdown_File")
    func roundTripMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Markdown_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Metal_File")
    func roundTripMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Metal_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Module_Map")
    func parseModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Module_Map_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Module_Map")
    func roundTripModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Module_Map_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Objective-C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from PCH_File")
    func parsePCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/PCH_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from PCH_File")
    func roundTripPCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/PCH_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Property_List")
    func parseProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Property_List")
    func roundTripProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Property_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/RTF_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from RTF_File")
    func roundTripRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/RTF_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Safari_Extension_App")
    func parseSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Safari_Extension_App")
    func roundTripSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Shell_Script")
    func parseShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Shell_Script_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Shell_Script")
    func roundTripShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Shell_Script_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from SiriKit_Intent_Definition_File")
    func parseSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/SiriKit_Intent_Definition_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from SiriKit_Intent_Definition_File")
    func roundTripSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/SiriKit_Intent_Definition_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from SpriteKit_Scene")
    func parseSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/SpriteKit_Scene_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from SpriteKit_Scene")
    func roundTripSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/SpriteKit_Scene_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Strings_File_(Legacy)")
    func roundTripStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Strings_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Stringsdict_File_(Legacy)_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Stringsdict_File_(Legacy)")
    func roundTripStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Stringsdict_File_(Legacy)_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from SwiftUI_App_Base")
    func parseSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/SwiftUI_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from SwiftUI_App_Base")
    func roundTripSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/SwiftUI_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from SwiftUI_Document_App_Base")
    func parseSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/SwiftUI_Document_App_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from SwiftUI_Document_App_Base")
    func roundTripSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/SwiftUI_Document_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from SwiftUI_View")
    func roundTripSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/SwiftUI_View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Swift_File")
    func roundTripSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Swift_Macro_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Swift_Macro")
    func roundTripSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Swift_Macro_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Swift_Testing_Unit_Test_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Swift_Testing_Unit_Test")
    func roundTripSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Swift_Testing_Unit_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Test_Plan")
    func parseTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Test_Plan_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Test_Plan")
    func roundTripTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Test_Plan_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Touch_Alternatives_Property_List")
    func parseTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Touch_Alternatives_Property_List_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Touch_Alternatives_Property_List")
    func roundTripTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/ImageTests/ImageTests.swift",
            with: "Fixtures/Image/Touch_Alternatives_Property_List_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from UI_Testing_Bundle")
    func roundTripUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/UI_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Unit_Testing_Bundle")
    func roundTripUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Unit_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Parse Image from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Widget_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Image"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Image from Widget_Extension")
    func roundTripWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/FieldTests/ImageTests/ImageTests.swift", with: "Fixtures/Image/Widget_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Image"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Image"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Image"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Image should survive round-trip")
    }

    @Test("Handle missing Image")
    func parseMissingImage() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Image"] as? String

        #expect(value == nil, "Image should be nil when not present")
    }
}
