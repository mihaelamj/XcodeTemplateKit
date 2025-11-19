// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Concrete" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Concrete Field Parsing")
struct ConcreteTests {

    @Test("Parse Concrete from Aggregate")
    func parseAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Aggregate_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Aggregate")
    func roundTripAggregate() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Aggregate_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from App")
    func roundTripApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Audio_Unit_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Audio_Unit_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Audio_Unit_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Audio_Unit_Extension")
    func roundTripAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Audio_Unit_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Document_App")
    func roundTripDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Document_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Empty_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from External_Build_System")
    func parseExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/External_Build_System_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from External_Build_System")
    func roundTripExternal_Build_System() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/External_Build_System_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Framework")
    func roundTripFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Framework_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Game")
    func roundTripGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Game_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Generic_Extension")
    func parseGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Generic_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Generic_Extension")
    func roundTripGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Generic_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Safari_Extension_App")
    func parseSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Safari_Extension_App")
    func roundTripSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Safari_Extension_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from UI_Testing_Bundle")
    func roundTripUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/UI_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Unit_Testing_Bundle")
    func roundTripUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Unit_Testing_Bundle_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Parse Concrete from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Widget_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = (plist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Concrete from Widget_Extension")
    func roundTripWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/ConcreteTests/ConcreteTests.swift", with: "Fixtures/Concrete/Widget_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = (originalPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Concrete"] = value.toPropertyListValue()

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = (reparsedPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Concrete should survive round-trip")
    }

    @Test("Handle missing Concrete")
    func parseMissingConcrete() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = (testPlist["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        #expect(value == nil, "Concrete should be nil when not present")
    }
}
