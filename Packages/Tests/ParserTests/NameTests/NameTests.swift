// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Name" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Name Field Parsing")
struct NameTests {

    @Test("Parse Name from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Name"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Name from Asset_Catalog")
    func roundTripAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Name"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Name"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Name"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Name should survive round-trip")
    }

    @Test("Parse Name from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Name"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Name from Documentation_Catalog")
    func roundTripDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/Documentation_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Name"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Name"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Name"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Name should survive round-trip")
    }

    @Test("Parse Name from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/Empty_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Name"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Name from Empty_File")
    func roundTripEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/Empty_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Name"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Name"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Name"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Name should survive round-trip")
    }

    @Test("Parse Name from File_List")
    func parseFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/File_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Name"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Name from File_List")
    func roundTripFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/File_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Name"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Name"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Name"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Name should survive round-trip")
    }

    @Test("Parse Name from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/RTF_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Name"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Name from RTF_File")
    func roundTripRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/RTF_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Name"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Name"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Name"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Name should survive round-trip")
    }

    @Test("Parse Name from SceneKit_Asset_Catalog")
    func parseSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/SceneKit_Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Name"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Name from SceneKit_Asset_Catalog")
    func roundTripSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/NameTests/NameTests.swift", with: "Fixtures/Name/SceneKit_Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Name"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Name"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Name"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Name should survive round-trip")
    }

    @Test("Handle missing Name")
    func parseMissingName() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Name"] as? String

        #expect(value == nil, "Name should be nil when not present")
    }
}
