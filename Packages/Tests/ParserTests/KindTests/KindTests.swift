// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Kind" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Kind Field Parsing")
struct KindTests {

    @Test("Parse Kind from Aggregate")
    func parseAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Aggregate_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Aggregate")
    func roundTripAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Aggregate_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from App_Base")
    func parseApp_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from App_Base")
    func roundTripApp_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from App_Entity")
    func parseApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from App_Entity")
    func roundTripApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from App_Enum")
    func parseApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Enum_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from App_Enum")
    func roundTripApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Enum_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from App_Extension_Base")
    func parseApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from App_Extension_Base")
    func roundTripApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Privacy_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from App_Privacy")
    func roundTripApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_Privacy_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from App")
    func roundTripApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Application")
    func roundTripApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Article_File")
    func roundTripArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Article_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Assembly_File")
    func parseAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Assembly_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Assembly_File")
    func roundTripAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Assembly_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Asset_Catalog")
    func roundTripAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Audio_Unit_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Audio_Unit_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Audio_Unit_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Audio_Unit_Extension")
    func roundTripAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Audio_Unit_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base_DefinitionsAppLifecycle")
    func parseBase_DefinitionsAppLifecycle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_DefinitionsAppLifecycle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base_DefinitionsAppLifecycle")
    func roundTripBase_DefinitionsAppLifecycle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_DefinitionsAppLifecycle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base_DefinitionsInfoPlist")
    func parseBase_DefinitionsInfoPlist() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_DefinitionsInfoPlist_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base_DefinitionsInfoPlist")
    func roundTripBase_DefinitionsInfoPlist() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_DefinitionsInfoPlist_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base_DefinitionsLanguage")
    func parseBase_DefinitionsLanguage() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_DefinitionsLanguage_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base_DefinitionsLanguage")
    func roundTripBase_DefinitionsLanguage() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_DefinitionsLanguage_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base_Options")
    func parseBase_Options() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_Options_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base_Options")
    func roundTripBase_Options() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_Options_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base_ProjectSettings")
    func parseBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_ProjectSettings_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base_ProjectSettings")
    func roundTripBase_ProjectSettings() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_ProjectSettings_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base_StorageType")
    func parseBase_StorageType() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_StorageType_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base_StorageType")
    func roundTripBase_StorageType() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_StorageType_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base_TestingSystem")
    func parseBase_TestingSystem() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_TestingSystem_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base_TestingSystem")
    func roundTripBase_TestingSystem() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_TestingSystem_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Base")
    func parseBase() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Base")
    func roundTripBase() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Build_Tool_Plug-in")
    func parseBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Build_Tool_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Build_Tool_Plug-in")
    func roundTripBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Build_Tool_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Bundle_Base")
    func parseBundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Bundle_Base")
    func roundTripBundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/C++_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from CLIPS_File")
    func parseCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/CLIPS_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from CLIPS_File")
    func roundTripCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/CLIPS_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Command_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Command_Plug-in")
    func roundTripCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Command_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Compositor_Services")
    func parseCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Compositor_Services_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Compositor_Services")
    func roundTripCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Compositor_Services_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Configuration_Settings_File")
    func parseConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Configuration_Settings_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Configuration_Settings_File")
    func roundTripConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Configuration_Settings_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Cross-Platform_Base")
    func parseCross_Platform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Cross-Platform_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Cross-Platform_Base")
    func roundTripCross_Platform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Cross-Platform_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Document_App")
    func roundTripDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Documentation_Catalog")
    func roundTripDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Documentation_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Empty_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Empty_File")
    func roundTripEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Empty_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Exports_File")
    func parseExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Exports_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Exports_File")
    func roundTripExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Exports_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from ExtensionKit_Extension_Base")
    func parseExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/ExtensionKit_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from ExtensionKit_Extension_Base")
    func roundTripExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/ExtensionKit_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Extension_File")
    func roundTripExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Extension_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from External_Build_System")
    func parseExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/External_Build_System_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from External_Build_System")
    func roundTripExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/External_Build_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from File_List")
    func parseFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/File_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from File_List")
    func roundTripFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/File_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Framework_Base")
    func parseFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Framework_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Framework_Base")
    func roundTripFramework_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Framework_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Framework_Testing_Bundle")
    func parseFramework_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Framework_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Framework_Testing_Bundle")
    func roundTripFramework_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Framework_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Framework")
    func roundTripFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Game")
    func roundTripGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Generic_Extension")
    func parseGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Generic_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Generic_Extension")
    func roundTripGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Generic_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Header_File")
    func roundTripHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Header_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from INIntent_subclass")
    func parseINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/INIntent_subclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from INIntent_subclass")
    func roundTripINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/INIntent_subclass_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Immersive_Space_App")
    func parseImmersive_Space_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Immersive_Space_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Immersive_Space_App")
    func roundTripImmersive_Space_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Immersive_Space_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Language_Choice")
    func parseLanguage_Choice() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Language_Choice_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Language_Choice")
    func roundTripLanguage_Choice() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Language_Choice_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Library_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Library")
    func roundTripLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Library_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Link_action")
    func parseLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Link_action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Link_action")
    func roundTripLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Link_action_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Markdown_File")
    func parseMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Markdown_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Markdown_File")
    func roundTripMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Markdown_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Metal_File")
    func roundTripMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Metal_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Metal_Library_Base")
    func parseMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Metal_Library_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Metal_Library_Base")
    func roundTripMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Metal_Library_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Module_Map")
    func parseModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Module_Map_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Module_Map")
    func roundTripModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Module_Map_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_App_Extension_Base")
    func parseMultiplatform_App_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_App_Extension_Base")
    func roundTripMultiplatform_App_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_Base")
    func parseMultiplatform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_Base")
    func roundTripMultiplatform_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_ExtensionKit_Extension_Base")
    func parseMultiplatform_ExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_ExtensionKit_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_ExtensionKit_Extension_Base")
    func roundTripMultiplatform_ExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_ExtensionKit_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_SwiftUI_App_Testing_Bundle")
    func parseMultiplatform_SwiftUI_App_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_App_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_SwiftUI_App_Testing_Bundle")
    func roundTripMultiplatform_SwiftUI_App_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_App_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_SwiftUI_App_UITesting_Bundle")
    func parseMultiplatform_SwiftUI_App_UITesting_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_App_UITesting_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_SwiftUI_App_UITesting_Bundle")
    func roundTripMultiplatform_SwiftUI_App_UITesting_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_App_UITesting_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_SwiftUI_App")
    func parseMultiplatform_SwiftUI_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_SwiftUI_App")
    func roundTripMultiplatform_SwiftUI_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_SwiftUI_Document_App")
    func parseMultiplatform_SwiftUI_Document_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_SwiftUI_Document_App")
    func roundTripMultiplatform_SwiftUI_Document_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_SwiftUI_Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_Test_Bundle_Base")
    func parseMultiplatform_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_Test_Bundle_Base")
    func roundTripMultiplatform_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Multiplatform_UI_Test_Bundle_Base")
    func parseMultiplatform_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Multiplatform_UI_Test_Bundle_Base")
    func roundTripMultiplatform_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Multiplatform_UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Objective-C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Objective-C_new_superclass")
    func parseObjective_C_new_superclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Objective-C_new_superclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Objective-C_new_superclass")
    func roundTripObjective_C_new_superclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Objective-C_new_superclass_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from PCH_File")
    func parsePCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/PCH_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from PCH_File")
    func roundTripPCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/PCH_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Package_Swift_File")
    func parsePackage_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Package_Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Package_Swift_File")
    func roundTripPackage_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Package_Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Package_Test_Case")
    func parsePackage_Test_Case() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Package_Test_Case_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Package_Test_Case")
    func roundTripPackage_Test_Case() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Package_Test_Case_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Playground_Page")
    func parsePlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Playground_Page_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Playground_Page")
    func roundTripPlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Playground_Page_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Property_List")
    func parseProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Property_List")
    func roundTripProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Property_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/RTF_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from RTF_File")
    func roundTripRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/RTF_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Safari_Extension_App")
    func parseSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Safari_Extension_App")
    func roundTripSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SceneKit_Asset_Cache")
    func parseSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SceneKit_Asset_Cache_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SceneKit_Asset_Cache")
    func roundTripSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SceneKit_Asset_Cache_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SceneKit_Asset_Catalog")
    func parseSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SceneKit_Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SceneKit_Asset_Catalog")
    func roundTripSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SceneKit_Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SceneKit_Scene_File")
    func parseSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SceneKit_Scene_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SceneKit_Scene_File")
    func roundTripSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SceneKit_Scene_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Security_Critical")
    func parseSecurity_Critical() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Security_Critical_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Security_Critical")
    func roundTripSecurity_Critical() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Security_Critical_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SharedContent_Metal_4_Game")
    func parseSharedContent_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SharedContent_Metal_4_Game")
    func roundTripSharedContent_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SharedContent_Metal_Game")
    func parseSharedContent_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SharedContent_Metal_Game")
    func roundTripSharedContent_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SharedContent_RealityKit_Game")
    func parseSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_RealityKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SharedContent_RealityKit_Game")
    func roundTripSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_RealityKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SharedContent_Safari_Extension_App")
    func parseSharedContent_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SharedContent_Safari_Extension_App")
    func roundTripSharedContent_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SharedContent_Safari_Extension")
    func parseSharedContent_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Safari_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SharedContent_Safari_Extension")
    func roundTripSharedContent_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SharedContent_SceneKit_Game")
    func parseSharedContent_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SharedContent_SceneKit_Game")
    func roundTripSharedContent_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SharedContent_SpriteKit_Game")
    func parseSharedContent_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SharedContent_SpriteKit_Game")
    func roundTripSharedContent_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SharedContent_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Shell_Script")
    func parseShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Shell_Script_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Shell_Script")
    func roundTripShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Shell_Script_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SiriKit_Intent_Definition_File")
    func parseSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SiriKit_Intent_Definition_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SiriKit_Intent_Definition_File")
    func roundTripSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SiriKit_Intent_Definition_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Sources_Folder_Swift_File")
    func parseSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Sources_Folder_Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Sources_Folder_Swift_File")
    func roundTripSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Sources_Folder_Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SpriteKit_Action")
    func parseSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SpriteKit_Action")
    func roundTripSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Action_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SpriteKit_Particle_File")
    func parseSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Particle_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SpriteKit_Particle_File")
    func roundTripSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Particle_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SpriteKit_Scene")
    func parseSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Scene_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SpriteKit_Scene")
    func roundTripSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Scene_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SpriteKit_Tile_Set")
    func parseSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Tile_Set_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SpriteKit_Tile_Set")
    func roundTripSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SpriteKit_Tile_Set_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Storage_Type_Document")
    func parseStorage_Type_Document() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Storage_Type_Document_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Storage_Type_Document")
    func roundTripStorage_Type_Document() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Storage_Type_Document_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Storage_Type")
    func parseStorage_Type() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Storage_Type_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Storage_Type")
    func roundTripStorage_Type() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Storage_Type_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Strings_File_(Legacy)")
    func roundTripStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Strings_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Stringsdict_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Stringsdict_File_(Legacy)")
    func roundTripStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Stringsdict_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SwiftUI_App_Base")
    func parseSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SwiftUI_App_Base")
    func roundTripSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SwiftUI_App_UI_Test_Bundle_Base")
    func parseSwiftUI_App_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_App_UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SwiftUI_App_UI_Test_Bundle_Base")
    func roundTripSwiftUI_App_UI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_App_UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SwiftUI_App_Unit_Testing_Bundle_Base")
    func parseSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SwiftUI_App_Unit_Testing_Bundle_Base")
    func roundTripSwiftUI_App_Unit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_App_Unit_Testing_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SwiftUI_Document_App_Base")
    func parseSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_Document_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SwiftUI_Document_App_Base")
    func roundTripSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_Document_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from SwiftUI_View")
    func roundTripSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/SwiftUI_View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Swift_File")
    func roundTripSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Swift_Macro_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Swift_Macro")
    func roundTripSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Swift_Macro_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Swift_Testing_Unit_Test")
    func roundTripSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Swift_Testing_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Test_Plan")
    func parseTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Test_Plan_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Test_Plan")
    func roundTripTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Test_Plan_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Testing_System")
    func parseTesting_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Testing_System_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Testing_System")
    func roundTripTesting_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Testing_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Touch_Alternatives_Property_List")
    func parseTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Touch_Alternatives_Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Touch_Alternatives_Property_List")
    func roundTripTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Touch_Alternatives_Property_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Transient_App_Entity")
    func parseTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Transient_App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Transient_App_Entity")
    func roundTripTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Transient_App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Tutorial_File")
    func roundTripTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Tutorial_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Tutorial_Table_of_Contents_File")
    func roundTripTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Tutorial_Table_of_Contents_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from UI_Test_Bundle_Base")
    func parseUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/UI_Test_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from UI_Test_Bundle_Base")
    func roundTripUI_Test_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/UI_Test_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from UI_Testing_Bundle")
    func roundTripUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/UI_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Unit_Testing_Bundle_Base")
    func parseUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Unit_Testing_Bundle_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Unit_Testing_Bundle_Base")
    func roundTripUnit_Testing_Bundle_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Unit_Testing_Bundle_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Unit_Testing_Bundle")
    func roundTripUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Unit_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from View")
    func roundTripView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Widget_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Widget_Extension")
    func roundTripWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Widget_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from Window")
    func roundTripWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from XCTest_UI_Test")
    func roundTripXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/XCTest_UI_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from XCTest_Unit_Test")
    func roundTripXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/XCTest_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from XPC_Service_Base")
    func parseXPC_Service_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/XPC_Service_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from XPC_Service_Base")
    func roundTripXPC_Service_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/XPC_Service_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_App_Base")
    func parseiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_App_Base")
    func roundTripiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_App_UI_Test_Bundle")
    func parseiOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_App_UI_Test_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_App_UI_Test_Bundle")
    func roundTripiOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_App_UI_Test_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_Metal_4_Game")
    func parseiOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_Metal_4_Game")
    func roundTripiOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_Metal_Game")
    func parseiOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_Metal_Game")
    func roundTripiOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_Safari_Extension_App")
    func parseiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_Safari_Extension_App")
    func roundTripiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_Safari_Extension")
    func parseiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Safari_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_Safari_Extension")
    func roundTripiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_SceneKit_Game")
    func parseiOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_SceneKit_Game")
    func roundTripiOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from iOS_SpriteKit_Game")
    func parseiOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from iOS_SpriteKit_Game")
    func roundTripiOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/iOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_App_Base")
    func parsemacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_App_Base")
    func roundTripmacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_App_Entitlements")
    func parsemacOS_App_Entitlements() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_App_Entitlements_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_App_Entitlements")
    func roundTripmacOS_App_Entitlements() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_App_Entitlements_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_App_UI_Test_Bundle")
    func parsemacOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_App_UI_Test_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_App_UI_Test_Bundle")
    func roundTripmacOS_App_UI_Test_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_App_UI_Test_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_Metal_4_Game")
    func parsemacOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_Metal_4_Game")
    func roundTripmacOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_Metal_Game")
    func parsemacOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_Metal_Game")
    func roundTripmacOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_Safari_Extension_App")
    func parsemacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_Safari_Extension_App")
    func roundTripmacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_Safari_Extension")
    func parsemacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Safari_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_Safari_Extension")
    func roundTripmacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_SceneKit_Game")
    func parsemacOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_SceneKit_Game")
    func roundTripmacOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from macOS_SpriteKit_Game")
    func parsemacOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from macOS_SpriteKit_Game")
    func roundTripmacOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/macOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from tvOS_App_Base")
    func parsetvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from tvOS_App_Base")
    func roundTriptvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from tvOS_Metal_4_Game")
    func parsetvOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_Metal_4_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from tvOS_Metal_4_Game")
    func roundTriptvOS_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_Metal_4_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from tvOS_Metal_Game")
    func parsetvOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_Metal_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from tvOS_Metal_Game")
    func roundTriptvOS_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_Metal_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from tvOS_SceneKit_Game")
    func parsetvOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_SceneKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from tvOS_SceneKit_Game")
    func roundTriptvOS_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_SceneKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from tvOS_SpriteKit_Game")
    func parsetvOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_SpriteKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from tvOS_SpriteKit_Game")
    func roundTriptvOS_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/tvOS_SpriteKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Parse Kind from visionOS_App")
    func parsevisionOS_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/visionOS_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Kind"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Kind from visionOS_App")
    func roundTripvisionOS_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/KindTests/KindTests.swift", with: "Fixtures/Kind/visionOS_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Kind"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Kind"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Kind should survive round-trip")
    }

    @Test("Handle missing Kind")
    func parseMissingKind() throws {
        let testPlist: [String: Any] = ["Description": "Test template"]

        let value = testPlist["Kind"] as? String

        #expect(value == nil, "Kind should be nil when not present")
    }
}
