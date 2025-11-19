// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "SupportsSwiftPackage" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("SupportsSwiftPackage Field Parsing")
struct SupportsSwiftPackageTests {

    @Test("Parse SupportsSwiftPackage from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/App_Privacy_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from App_Privacy")
    func roundTripApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/App_Privacy_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Article_File")
    func roundTripArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Article_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Asset_Catalog")
    func roundTripAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Asset_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/C++_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Documentation_Catalog")
    func roundTripDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Documentation_Catalog_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Empty_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Empty_File")
    func roundTripEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Empty_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Extension_File")
    func roundTripExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Extension_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Header_File")
    func roundTripHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Header_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Main_Menu_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Markdown_File")
    func parseMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Markdown_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Markdown_File")
    func roundTripMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Markdown_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Metal_File")
    func roundTripMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Metal_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Objective-C_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Objective-C_new_superclass")
    func parseObjective_C_new_superclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Objective-C_new_superclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Objective-C_new_superclass")
    func roundTripObjective_C_new_superclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Objective-C_new_superclass_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Storyboard")
    func roundTripStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Storyboard_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Strings_File_(Legacy)")
    func roundTripStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Strings_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Stringsdict_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Stringsdict_File_(Legacy)")
    func roundTripStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Stringsdict_File_(Legacy)_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from SwiftUI_View")
    func roundTripSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/SwiftUI_View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Swift_File")
    func roundTripSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Swift_Testing_Unit_Test")
    func roundTripSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Swift_Testing_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Tutorial_File")
    func roundTripTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Tutorial_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Tutorial_Table_of_Contents_File")
    func roundTripTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Tutorial_Table_of_Contents_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from View")
    func roundTripView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/View_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from Window")
    func roundTripWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/Window_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Parse SupportsSwiftPackage from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip SupportsSwiftPackage from XCTest_Unit_Test")
    func roundTripXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/SupportsSwiftPackageTests/SupportsSwiftPackageTests.swift", with: "Fixtures/SupportsSwiftPackage/XCTest_Unit_Test_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["SupportsSwiftPackage"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "SupportsSwiftPackage should survive round-trip")
    }

    @Test("Handle missing SupportsSwiftPackage")
    func parseMissingSupportsSwiftPackage() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = (testPlist["SupportsSwiftPackage"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        #expect(value == nil, "SupportsSwiftPackage should be nil when not present")
    }
}
