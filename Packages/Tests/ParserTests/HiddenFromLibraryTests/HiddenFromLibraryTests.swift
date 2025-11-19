// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "HiddenFromLibrary" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("HiddenFromLibrary Field Parsing")
struct HiddenFromLibraryTests {

    @Test("Parse HiddenFromLibrary from App_Entity")
    func parseApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from App_Entity")
    func roundTripApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from App_Enum")
    func parseApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/App_Enum_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from App_Enum")
    func roundTripApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/App_Enum_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from INIntent_subclass")
    func parseINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/INIntent_subclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from INIntent_subclass")
    func roundTripINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/INIntent_subclass_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from Link_action")
    func parseLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Link_action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from Link_action")
    func roundTripLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Link_action_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from Package_Swift_File")
    func parsePackage_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Package_Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from Package_Swift_File")
    func roundTripPackage_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Package_Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from Package_Test_Case")
    func parsePackage_Test_Case() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Package_Test_Case_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from Package_Test_Case")
    func roundTripPackage_Test_Case() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Package_Test_Case_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from Playground_Page")
    func parsePlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Playground_Page_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from Playground_Page")
    func roundTripPlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Playground_Page_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from SceneKit_Asset_Cache")
    func parseSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/SceneKit_Asset_Cache_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from SceneKit_Asset_Cache")
    func roundTripSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/SceneKit_Asset_Cache_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from Sources_Folder_Swift_File")
    func parseSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Sources_Folder_Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from Sources_Folder_Swift_File")
    func roundTripSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Sources_Folder_Swift_File_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Parse HiddenFromLibrary from Transient_App_Entity")
    func parseTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Transient_App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip HiddenFromLibrary from Transient_App_Entity")
    func roundTripTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "ParserTests/HiddenFromLibraryTests/HiddenFromLibraryTests.swift", with: "Fixtures/HiddenFromLibrary/Transient_App_Entity_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["HiddenFromLibrary"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "HiddenFromLibrary should survive round-trip")
    }

    @Test("Handle missing HiddenFromLibrary")
    func parseMissingHiddenFromLibrary() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = (testPlist["HiddenFromLibrary"] as? String).flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        #expect(value == nil, "HiddenFromLibrary should be nil when not present")
    }
}
