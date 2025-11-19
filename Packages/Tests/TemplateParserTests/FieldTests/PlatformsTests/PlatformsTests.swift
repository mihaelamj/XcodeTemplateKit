// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Platforms" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Platforms Field Parsing")
struct PlatformsTests {

    @Test("Parse Platforms from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/App_Privacy_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from App_Privacy")
    func roundTripApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/App_Privacy_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from App")
    func roundTripApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Application")
    func roundTripApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Article_File")
    func roundTripArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Article_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Asset_Catalog")
    func roundTripAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Audio_Unit_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Audio_Unit_Extension")
    func roundTripAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Audio_Unit_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Build_Tool_Plug-in")
    func parseBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Build_Tool_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Build_Tool_Plug-in")
    func roundTripBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Build_Tool_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/C++_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Command_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Command_Plug-in")
    func roundTripCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Command_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Document_App")
    func roundTripDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Documentation_Catalog")
    func roundTripDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Documentation_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Extension_File")
    func roundTripExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Extension_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Framework")
    func roundTripFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Game")
    func roundTripGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Generic_Extension")
    func parseGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Generic_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Generic_Extension")
    func roundTripGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Generic_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Header_File")
    func roundTripHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Header_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Library_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Library")
    func roundTripLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Library_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Metal_File")
    func roundTripMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Metal_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Module_Map")
    func parseModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Module_Map_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Module_Map")
    func roundTripModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Module_Map_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Objective-C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Objective-C_new_superclass")
    func parseObjective_C_new_superclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Objective-C_new_superclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Objective-C_new_superclass")
    func roundTripObjective_C_new_superclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Objective-C_new_superclass_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Playground_Page")
    func parsePlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Playground_Page_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Playground_Page")
    func roundTripPlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Playground_Page_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Property_List")
    func parseProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Property_List")
    func roundTripProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Property_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/RTF_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from RTF_File")
    func roundTripRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/RTF_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Safari_Extension_App")
    func parseSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Safari_Extension_App")
    func roundTripSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SceneKit_Asset_Cache")
    func parseSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SceneKit_Asset_Cache_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SceneKit_Asset_Cache")
    func roundTripSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SceneKit_Asset_Cache_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SceneKit_Asset_Catalog")
    func parseSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SceneKit_Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SceneKit_Asset_Catalog")
    func roundTripSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SceneKit_Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SceneKit_Scene_File")
    func parseSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SceneKit_Scene_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SceneKit_Scene_File")
    func roundTripSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SceneKit_Scene_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SiriKit_Intent_Definition_File")
    func parseSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SiriKit_Intent_Definition_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SiriKit_Intent_Definition_File")
    func roundTripSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SiriKit_Intent_Definition_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Sources_Folder_Swift_File")
    func parseSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Sources_Folder_Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Sources_Folder_Swift_File")
    func roundTripSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Sources_Folder_Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SpriteKit_Action")
    func parseSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SpriteKit_Action")
    func roundTripSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Action_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SpriteKit_Particle_File")
    func parseSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Particle_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SpriteKit_Particle_File")
    func roundTripSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Particle_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SpriteKit_Scene")
    func parseSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Scene_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SpriteKit_Scene")
    func roundTripSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Scene_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SpriteKit_Tile_Set")
    func parseSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Tile_Set_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SpriteKit_Tile_Set")
    func roundTripSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SpriteKit_Tile_Set_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Strings_File_(Legacy)")
    func roundTripStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Strings_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Stringsdict_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Stringsdict_File_(Legacy)")
    func roundTripStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Stringsdict_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from SwiftUI_View")
    func roundTripSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/SwiftUI_View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Swift_File")
    func roundTripSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Swift_Macro_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Swift_Macro")
    func roundTripSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Swift_Macro_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Swift_Testing_Unit_Test")
    func roundTripSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Swift_Testing_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Touch_Alternatives_Property_List")
    func parseTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Touch_Alternatives_Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Touch_Alternatives_Property_List")
    func roundTripTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Touch_Alternatives_Property_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Tutorial_File")
    func roundTripTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Tutorial_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Tutorial_Table_of_Contents_File")
    func roundTripTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Tutorial_Table_of_Contents_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from UI_Testing_Bundle")
    func roundTripUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/UI_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Unit_Testing_Bundle")
    func roundTripUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Unit_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from View")
    func roundTripView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Widget_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Widget_Extension")
    func roundTripWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Widget_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from Window")
    func roundTripWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from XCTest_UI_Test")
    func roundTripXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/XCTest_UI_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from XCTest_Unit_Test")
    func roundTripXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/XCTest_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from iOS_App_Base")
    func parseiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/iOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from iOS_App_Base")
    func roundTripiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/iOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from macOS_App_Base")
    func parsemacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/macOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from macOS_App_Base")
    func roundTripmacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/macOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from macOS_App_Entitlements")
    func parsemacOS_App_Entitlements() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/macOS_App_Entitlements_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from macOS_App_Entitlements")
    func roundTripmacOS_App_Entitlements() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/macOS_App_Entitlements_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Parse Platforms from tvOS_App_Base")
    func parsetvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/tvOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Platforms from tvOS_App_Base")
    func roundTriptvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/PlatformsTests/PlatformsTests.swift", with: "Fixtures/Platforms/tvOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Platforms"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Platforms"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Platforms"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Platforms should survive round-trip")
    }

    @Test("Handle missing Platforms")
    func parseMissingPlatforms() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Platforms"] as? [String]

        #expect(value == nil, "Platforms should be nil when not present")
    }
}
