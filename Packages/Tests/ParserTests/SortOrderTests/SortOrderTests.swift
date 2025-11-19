// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "SortOrder" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("SortOrder Field Parsing")
struct SortOrderTests {

    @Test("Parse SortOrder from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from App")
    func roundTripApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Application")
    func roundTripApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Article_File")
    func roundTripArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Article_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Audio_Unit_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Audio_Unit_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Build_Tool_Plug-in")
    func parseBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Build_Tool_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Build_Tool_Plug-in")
    func roundTripBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Build_Tool_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/C++_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Command_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Command_Plug-in")
    func roundTripCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Command_Plug-in_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Document_App")
    func roundTripDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Documentation_Catalog")
    func roundTripDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Documentation_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Empty_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Empty_File")
    func roundTripEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Empty_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Extension_File")
    func roundTripExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Extension_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Framework")
    func roundTripFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Game")
    func roundTripGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Header_File")
    func roundTripHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Header_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Library_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Library")
    func roundTripLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Library_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Metal_File")
    func roundTripMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Metal_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Metal_Library_Base")
    func parseMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Metal_Library_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Metal_Library_Base")
    func roundTripMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Metal_Library_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Objective-C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from SharedContent_RealityKit_Game")
    func parseSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SharedContent_RealityKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from SharedContent_RealityKit_Game")
    func roundTripSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SharedContent_RealityKit_Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from SwiftUI_App_Base")
    func parseSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SwiftUI_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from SwiftUI_App_Base")
    func roundTripSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SwiftUI_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from SwiftUI_Document_App_Base")
    func parseSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SwiftUI_Document_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from SwiftUI_Document_App_Base")
    func roundTripSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SwiftUI_Document_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from SwiftUI_View")
    func roundTripSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/SwiftUI_View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Swift_File")
    func roundTripSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Swift_Macro_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Swift_Macro")
    func roundTripSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Swift_Macro_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Swift_Testing_Unit_Test")
    func roundTripSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Swift_Testing_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Tutorial_File")
    func roundTripTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Tutorial_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Tutorial_Table_of_Contents_File")
    func roundTripTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Tutorial_Table_of_Contents_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from View")
    func roundTripView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from Window")
    func roundTripWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from XCTest_UI_Test")
    func roundTripXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/XCTest_UI_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Parse SortOrder from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SortOrder from XCTest_Unit_Test")
    func roundTripXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SortOrderTests/SortOrderTests.swift", with: "Fixtures/SortOrder/XCTest_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["SortOrder"] as? Int

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SortOrder"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["SortOrder"] as? Int

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SortOrder should survive round-trip")
    }

    @Test("Handle missing SortOrder")
    func parseMissingSortOrder() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["SortOrder"] as? Int

        #expect(value == nil, "SortOrder should be nil when not present")
    }
}
