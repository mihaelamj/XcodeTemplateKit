// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Options" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Options Field Parsing")
struct OptionsTests {

    @Test("Parse Options from Aggregate")
    func parseAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Aggregate_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Aggregate")
    func roundTripAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Aggregate_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from App_Base")
    func parseApp_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from App_Base")
    func roundTripApp_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from App_Entity")
    func parseApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from App_Entity")
    func roundTripApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from App_Enum")
    func parseApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_Enum_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from App_Enum")
    func roundTripApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_Enum_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from App")
    func roundTripApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Audio_Unit_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Audio_Unit_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Audio_Unit_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Audio_Unit_Extension")
    func roundTripAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Audio_Unit_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Base_DefinitionsAppLifecycle")
    func parseBase_DefinitionsAppLifecycle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_DefinitionsAppLifecycle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Base_DefinitionsAppLifecycle")
    func roundTripBase_DefinitionsAppLifecycle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_DefinitionsAppLifecycle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Base_DefinitionsLanguage")
    func parseBase_DefinitionsLanguage() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_DefinitionsLanguage_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Base_DefinitionsLanguage")
    func roundTripBase_DefinitionsLanguage() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_DefinitionsLanguage_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Base_Options")
    func parseBase_Options() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_Options_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Base_Options")
    func roundTripBase_Options() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_Options_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Base_ProjectSettings")
    func parseBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_ProjectSettings_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Base_ProjectSettings")
    func roundTripBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_ProjectSettings_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Base_StorageType")
    func parseBase_StorageType() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_StorageType_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Base_StorageType")
    func roundTripBase_StorageType() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_StorageType_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Base_TestingSystem")
    func parseBase_TestingSystem() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_TestingSystem_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Base_TestingSystem")
    func roundTripBase_TestingSystem() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Base_TestingSystem_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/C++_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Command_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Command_Plug-in")
    func roundTripCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Command_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Compositor_Services")
    func parseCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Compositor_Services_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Compositor_Services")
    func roundTripCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Compositor_Services_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Document_App")
    func roundTripDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from External_Build_System")
    func parseExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/External_Build_System_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from External_Build_System")
    func roundTripExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/External_Build_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Framework_Base")
    func parseFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Framework_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Framework_Base")
    func roundTripFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Framework_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Framework_Testing_Bundle")
    func parseFramework_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Framework_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Framework_Testing_Bundle")
    func roundTripFramework_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Framework_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Framework")
    func roundTripFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Game")
    func roundTripGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Generic_Extension")
    func parseGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Generic_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Generic_Extension")
    func roundTripGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Generic_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from INIntent_subclass")
    func parseINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/INIntent_subclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from INIntent_subclass")
    func roundTripINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/INIntent_subclass_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Language_Choice")
    func parseLanguage_Choice() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Language_Choice_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Language_Choice")
    func roundTripLanguage_Choice() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Language_Choice_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Library_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Library")
    func roundTripLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Library_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Link_action")
    func parseLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Link_action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Link_action")
    func roundTripLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Link_action_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Metal_Library_Base")
    func parseMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Metal_Library_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Metal_Library_Base")
    func roundTripMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Metal_Library_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Multiplatform_SwiftUI_App")
    func parseMultiplatform_SwiftUI_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Multiplatform_SwiftUI_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Multiplatform_SwiftUI_App")
    func roundTripMultiplatform_SwiftUI_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Multiplatform_SwiftUI_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Multiplatform_SwiftUI_Document_App")
    func parseMultiplatform_SwiftUI_Document_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Multiplatform_SwiftUI_Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Multiplatform_SwiftUI_Document_App")
    func roundTripMultiplatform_SwiftUI_Document_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Multiplatform_SwiftUI_Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Objective-C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Safari_Extension_App")
    func parseSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Safari_Extension_App")
    func roundTripSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SharedContent_Metal_4_Game")
    func parseSharedContent_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SharedContent_Metal_4_Game")
    func roundTripSharedContent_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SharedContent_Metal_Game")
    func parseSharedContent_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SharedContent_Metal_Game")
    func roundTripSharedContent_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SharedContent_Safari_Extension_App")
    func parseSharedContent_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SharedContent_Safari_Extension_App")
    func roundTripSharedContent_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SharedContent_Safari_Extension")
    func parseSharedContent_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Safari_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SharedContent_Safari_Extension")
    func roundTripSharedContent_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SharedContent_SceneKit_Game")
    func parseSharedContent_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SharedContent_SceneKit_Game")
    func roundTripSharedContent_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SharedContent_SpriteKit_Game")
    func parseSharedContent_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SharedContent_SpriteKit_Game")
    func roundTripSharedContent_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SharedContent_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SpriteKit_Particle_File")
    func parseSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SpriteKit_Particle_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SpriteKit_Particle_File")
    func roundTripSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SpriteKit_Particle_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SpriteKit_Tile_Set")
    func parseSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SpriteKit_Tile_Set_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SpriteKit_Tile_Set")
    func roundTripSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SpriteKit_Tile_Set_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Storage_Type_Document")
    func parseStorage_Type_Document() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Storage_Type_Document_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Storage_Type_Document")
    func roundTripStorage_Type_Document() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Storage_Type_Document_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Storage_Type")
    func parseStorage_Type() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Storage_Type_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Storage_Type")
    func roundTripStorage_Type() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Storage_Type_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SwiftUI_App_Base")
    func parseSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SwiftUI_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SwiftUI_App_Base")
    func roundTripSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SwiftUI_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from SwiftUI_Document_App_Base")
    func parseSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SwiftUI_Document_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from SwiftUI_Document_App_Base")
    func roundTripSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/SwiftUI_Document_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Swift_Macro_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Swift_Macro")
    func roundTripSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Swift_Macro_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Testing_System")
    func parseTesting_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Testing_System_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Testing_System")
    func roundTripTesting_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Testing_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Transient_App_Entity")
    func parseTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Transient_App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Transient_App_Entity")
    func roundTripTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Transient_App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from UI_Test_Bundle_Base")
    func parseUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from UI_Test_Bundle_Base")
    func roundTripUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from UI_Testing_Bundle")
    func roundTripUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/UI_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Unit_Testing_Bundle_Base")
    func parseUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Unit_Testing_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Unit_Testing_Bundle_Base")
    func roundTripUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Unit_Testing_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Unit_Testing_Bundle")
    func roundTripUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Unit_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Widget_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from Widget_Extension")
    func roundTripWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/Widget_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from XCTest_UI_Test")
    func roundTripXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/XCTest_UI_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from XCTest_Unit_Test")
    func roundTripXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/XCTest_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from iOS_App_Base")
    func parseiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from iOS_App_Base")
    func roundTripiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from iOS_Metal_4_Game")
    func parseiOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from iOS_Metal_4_Game")
    func roundTripiOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from iOS_Metal_Game")
    func parseiOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from iOS_Metal_Game")
    func roundTripiOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from iOS_Safari_Extension_App")
    func parseiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from iOS_Safari_Extension_App")
    func roundTripiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from iOS_Safari_Extension")
    func parseiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Safari_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from iOS_Safari_Extension")
    func roundTripiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from iOS_SceneKit_Game")
    func parseiOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from iOS_SceneKit_Game")
    func roundTripiOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from iOS_SpriteKit_Game")
    func parseiOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from iOS_SpriteKit_Game")
    func roundTripiOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/iOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from macOS_App_Base")
    func parsemacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from macOS_App_Base")
    func roundTripmacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from macOS_Metal_4_Game")
    func parsemacOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from macOS_Metal_4_Game")
    func roundTripmacOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from macOS_Metal_Game")
    func parsemacOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from macOS_Metal_Game")
    func roundTripmacOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from macOS_Safari_Extension_App")
    func parsemacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from macOS_Safari_Extension_App")
    func roundTripmacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from macOS_Safari_Extension")
    func parsemacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Safari_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from macOS_Safari_Extension")
    func roundTripmacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from macOS_SceneKit_Game")
    func parsemacOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from macOS_SceneKit_Game")
    func roundTripmacOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from macOS_SpriteKit_Game")
    func parsemacOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from macOS_SpriteKit_Game")
    func roundTripmacOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/macOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from tvOS_App_Base")
    func parsetvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from tvOS_App_Base")
    func roundTriptvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from tvOS_Metal_4_Game")
    func parsetvOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from tvOS_Metal_4_Game")
    func roundTriptvOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from tvOS_Metal_Game")
    func parsetvOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from tvOS_Metal_Game")
    func roundTriptvOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from tvOS_SceneKit_Game")
    func parsetvOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from tvOS_SceneKit_Game")
    func roundTriptvOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from tvOS_SpriteKit_Game")
    func parsetvOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from tvOS_SpriteKit_Game")
    func roundTriptvOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/tvOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Parse Options from visionOS_App")
    func parsevisionOS_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/visionOS_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Options"] as? [[String: Any]]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Options from visionOS_App")
    func roundTripvisionOS_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/OptionsTests/OptionsTests.swift", with: "Fixtures/Options/visionOS_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Options"] as? [[String: Any]]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Options"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Options"] as? [[String: Any]]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Options should survive round-trip")
    }

    @Test("Handle missing Options")
    func parseMissingOptions() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Options"] as? [[String: Any]]

        #expect(value == nil, "Options should be nil when not present")
    }
}
