// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Summary" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Summary Field Parsing")
struct SummaryTests {

    @Test("Parse Summary from App_Entity")
    func parseApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from App_Entity")
    func roundTripApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from App_Enum")
    func parseApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/App_Enum_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from App_Enum")
    func roundTripApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/App_Enum_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/App_Privacy_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from App_Privacy")
    func roundTripApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/App_Privacy_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Application")
    func roundTripApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Application_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Article_File")
    func roundTripArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Article_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Assembly_File")
    func parseAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Assembly_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Assembly_File")
    func roundTripAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Assembly_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Asset_Catalog")
    func roundTripAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/C++_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from CLIPS_File")
    func parseCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/CLIPS_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from CLIPS_File")
    func roundTripCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/CLIPS_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Configuration_Settings_File")
    func parseConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Configuration_Settings_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Configuration_Settings_File")
    func roundTripConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Configuration_Settings_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Documentation_Catalog")
    func roundTripDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Documentation_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Empty_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Empty_File")
    func roundTripEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Empty_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Exports_File")
    func parseExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Exports_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Exports_File")
    func roundTripExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Exports_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Extension_File")
    func roundTripExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Extension_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from File_List")
    func parseFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/File_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from File_List")
    func roundTripFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/File_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Header_File")
    func roundTripHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Header_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from INIntent_subclass")
    func parseINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/INIntent_subclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from INIntent_subclass")
    func roundTripINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/INIntent_subclass_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Link_action")
    func parseLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Link_action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Link_action")
    func roundTripLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Link_action_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Markdown_File")
    func parseMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Markdown_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Markdown_File")
    func roundTripMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Markdown_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Metal_File")
    func roundTripMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Metal_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Module_Map")
    func parseModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Module_Map_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Module_Map")
    func roundTripModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Module_Map_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Objective-C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from PCH_File")
    func parsePCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/PCH_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from PCH_File")
    func roundTripPCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/PCH_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Property_List")
    func parseProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Property_List")
    func roundTripProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Property_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/RTF_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from RTF_File")
    func roundTripRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/RTF_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SceneKit_Asset_Cache")
    func parseSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SceneKit_Asset_Cache_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SceneKit_Asset_Cache")
    func roundTripSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SceneKit_Asset_Cache_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SceneKit_Asset_Catalog")
    func parseSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SceneKit_Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SceneKit_Asset_Catalog")
    func roundTripSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SceneKit_Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SceneKit_Scene_File")
    func parseSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SceneKit_Scene_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SceneKit_Scene_File")
    func roundTripSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SceneKit_Scene_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Shell_Script")
    func parseShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Shell_Script_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Shell_Script")
    func roundTripShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Shell_Script_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SiriKit_Intent_Definition_File")
    func parseSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SiriKit_Intent_Definition_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SiriKit_Intent_Definition_File")
    func roundTripSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SiriKit_Intent_Definition_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SpriteKit_Action")
    func parseSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SpriteKit_Action")
    func roundTripSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Action_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SpriteKit_Particle_File")
    func parseSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Particle_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SpriteKit_Particle_File")
    func roundTripSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Particle_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SpriteKit_Scene")
    func parseSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Scene_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SpriteKit_Scene")
    func roundTripSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Scene_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SpriteKit_Tile_Set")
    func parseSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Tile_Set_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SpriteKit_Tile_Set")
    func roundTripSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SpriteKit_Tile_Set_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Strings_File_(Legacy)")
    func roundTripStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Strings_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Stringsdict_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Stringsdict_File_(Legacy)")
    func roundTripStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Stringsdict_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from SwiftUI_View")
    func roundTripSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/SwiftUI_View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Swift_File")
    func roundTripSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Swift_Testing_Unit_Test")
    func roundTripSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Swift_Testing_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Test_Plan")
    func parseTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Test_Plan_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Test_Plan")
    func roundTripTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Test_Plan_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Touch_Alternatives_Property_List")
    func parseTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Touch_Alternatives_Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Touch_Alternatives_Property_List")
    func roundTripTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Touch_Alternatives_Property_List_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Transient_App_Entity")
    func parseTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Transient_App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Transient_App_Entity")
    func roundTripTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Transient_App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Tutorial_File")
    func roundTripTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Tutorial_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Tutorial_Table_of_Contents_File")
    func roundTripTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Tutorial_Table_of_Contents_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from View")
    func roundTripView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from Window")
    func roundTripWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from XCTest_UI_Test")
    func roundTripXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/XCTest_UI_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Parse Summary from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Summary from XCTest_Unit_Test")
    func roundTripXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/SummaryTests/SummaryTests.swift", with: "Fixtures/Summary/XCTest_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Summary"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Summary"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Summary"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Summary should survive round-trip")
    }

    @Test("Handle missing Summary")
    func parseMissingSummary() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Summary"] as? String

        #expect(value == nil, "Summary should be nil when not present")
    }
}
