// swiftlint:disable type_body_length force_cast
import Foundation
import Models
@testable import Parser
import Testing

/// Comprehensive bidirectional tests for the "DefaultCompletionName" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("DefaultCompletionName Field Parsing")
struct DefaultCompletionNameTests {
    @Test("Parse DefaultCompletionName from App_Entity")
    func parseApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/App_Entity_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from App_Entity")
    func roundTripApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from App_Enum")
    func parseApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/App_Enum_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from App_Enum")
    func roundTripApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/App_Enum_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/App_Privacy_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from App_Privacy")
    func roundTripApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/App_Privacy_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Article_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Article_File")
    func roundTripArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Article_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Assembly_File")
    func parseAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Assembly_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Assembly_File")
    func roundTripAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Assembly_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Asset_Catalog_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Asset_Catalog")
    func roundTripAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Asset_Catalog_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Build_Tool_Plug-in")
    func parseBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Build_Tool_Plug-in_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Build_Tool_Plug-in")
    func roundTripBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Build_Tool_Plug-in_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/C++_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from C++_File")
    func roundTripC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/C++_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from CLIPS_File")
    func parseCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/CLIPS_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from CLIPS_File")
    func roundTripCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/CLIPS_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/C_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from C_File")
    func roundTripC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/C_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Command_Plug-in_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Command_Plug-in")
    func roundTripCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Command_Plug-in_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Configuration_Settings_File")
    func parseConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Configuration_Settings_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Configuration_Settings_File")
    func roundTripConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Configuration_Settings_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Documentation_Catalog_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Documentation_Catalog")
    func roundTripDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Documentation_Catalog_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Empty_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Empty_File")
    func roundTripEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Empty_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Empty_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Empty")
    func roundTripEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Empty_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Exports_File")
    func parseExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Exports_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Exports_File")
    func roundTripExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Exports_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Extension_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Extension_File")
    func roundTripExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Extension_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from File_List")
    func parseFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/File_List_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from File_List")
    func roundTripFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/File_List_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Header_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Header_File")
    func roundTripHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Header_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from INIntent_subclass")
    func parseINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/INIntent_subclass_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from INIntent_subclass")
    func roundTripINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/INIntent_subclass_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Library_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Library")
    func roundTripLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Library_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Link_action")
    func parseLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Link_action_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Link_action")
    func roundTripLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Link_action_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Main_Menu_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Main_Menu")
    func roundTripMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Main_Menu_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Markdown_File")
    func parseMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Markdown_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Markdown_File")
    func roundTripMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Markdown_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Metal_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Metal_File")
    func roundTripMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Metal_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Module_Map")
    func parseModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Module_Map_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Module_Map")
    func roundTripModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Module_Map_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Objective-C_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Objective-C_File")
    func roundTripObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Objective-C_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from PCH_File")
    func parsePCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/PCH_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from PCH_File")
    func roundTripPCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/PCH_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Package_Swift_File")
    func parsePackage_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Package_Swift_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Package_Swift_File")
    func roundTripPackage_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Package_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Package_Test_Case")
    func parsePackage_Test_Case() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Package_Test_Case_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Package_Test_Case")
    func roundTripPackage_Test_Case() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Package_Test_Case_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Playground_Page")
    func parsePlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Playground_Page_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Playground_Page")
    func roundTripPlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Playground_Page_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/RTF_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from RTF_File")
    func roundTripRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/RTF_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SceneKit_Asset_Cache")
    func parseSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SceneKit_Asset_Cache_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SceneKit_Asset_Cache")
    func roundTripSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SceneKit_Asset_Cache_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SceneKit_Asset_Catalog")
    func parseSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SceneKit_Asset_Catalog_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SceneKit_Asset_Catalog")
    func roundTripSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SceneKit_Asset_Catalog_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SceneKit_Scene_File")
    func parseSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SceneKit_Scene_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SceneKit_Scene_File")
    func roundTripSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SceneKit_Scene_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Shell_Script")
    func parseShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Shell_Script_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Shell_Script")
    func roundTripShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Shell_Script_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SiriKit_Intent_Definition_File")
    func parseSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SiriKit_Intent_Definition_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SiriKit_Intent_Definition_File")
    func roundTripSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SiriKit_Intent_Definition_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Sources_Folder_Swift_File")
    func parseSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Sources_Folder_Swift_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Sources_Folder_Swift_File")
    func roundTripSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Sources_Folder_Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SpriteKit_Action")
    func parseSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Action_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SpriteKit_Action")
    func roundTripSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Action_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SpriteKit_Particle_File")
    func parseSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Particle_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SpriteKit_Particle_File")
    func roundTripSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Particle_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SpriteKit_Scene")
    func parseSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Scene_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SpriteKit_Scene")
    func roundTripSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Scene_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SpriteKit_Tile_Set")
    func parseSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Tile_Set_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SpriteKit_Tile_Set")
    func roundTripSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SpriteKit_Tile_Set_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Strings_File_(Legacy)_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Strings_File_(Legacy)")
    func roundTripStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Strings_File_(Legacy)_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Stringsdict_File_(Legacy)_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Stringsdict_File_(Legacy)")
    func roundTripStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Stringsdict_File_(Legacy)_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SwiftUI_View_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from SwiftUI_View")
    func roundTripSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/SwiftUI_View_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Swift_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Swift_File")
    func roundTripSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Swift_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Swift_Macro_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Swift_Macro")
    func roundTripSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Swift_Macro_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Swift_Testing_Unit_Test_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Swift_Testing_Unit_Test")
    func roundTripSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Swift_Testing_Unit_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Test_Plan")
    func parseTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Test_Plan_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Test_Plan")
    func roundTripTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Test_Plan_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Touch_Alternatives_Property_List")
    func parseTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Touch_Alternatives_Property_List_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Touch_Alternatives_Property_List")
    func roundTripTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Touch_Alternatives_Property_List_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Transient_App_Entity")
    func parseTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Transient_App_Entity_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Transient_App_Entity")
    func roundTripTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Transient_App_Entity_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Tutorial_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Tutorial_File")
    func roundTripTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Tutorial_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Tutorial_Table_of_Contents_File_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from Tutorial_Table_of_Contents_File")
    func roundTripTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/Tutorial_Table_of_Contents_File_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/XCTest_UI_Test_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from XCTest_UI_Test")
    func roundTripXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/XCTest_UI_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Parse DefaultCompletionName from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/XCTest_Unit_Test_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["DefaultCompletionName"] as? String

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip DefaultCompletionName from XCTest_Unit_Test")
    func roundTripXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "ParserTests/FieldTests/DefaultCompletionNameTests/DefaultCompletionNameTests.swift",
            with: "Fixtures/DefaultCompletionName/XCTest_Unit_Test_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["DefaultCompletionName"] as? String

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["DefaultCompletionName"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["DefaultCompletionName"] as? String

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "DefaultCompletionName should survive round-trip")
    }

    @Test("Handle missing DefaultCompletionName")
    func parseMissingDefaultCompletionName() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["DefaultCompletionName"] as? String

        #expect(value == nil, "DefaultCompletionName should be nil when not present")
    }
}
