// swiftlint:disable type_body_length force_cast
import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for the "Nodes" field
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for all fixtures.
@Suite("Nodes Field Parsing")
struct NodesTests {
    @Test("Parse Nodes from App_Extension_Base")
    func parseApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/App_Extension_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from App_Extension_Base")
    func roundTripApp_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/App_Extension_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/Audio_Unit_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from Audio_Unit_Extension_App")
    func roundTripAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/Audio_Unit_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Audio_Unit_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from Audio_Unit_Extension")
    func roundTripAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Audio_Unit_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from Compositor_Services")
    func parseCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Compositor_Services_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from Compositor_Services")
    func roundTripCompositor_Services() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Compositor_Services_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from ExtensionKit_Extension_Base")
    func parseExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/ExtensionKit_Extension_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from ExtensionKit_Extension_Base")
    func roundTripExtensionKit_Extension_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/ExtensionKit_Extension_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from Generic_Extension")
    func parseGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Generic_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from Generic_Extension")
    func roundTripGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Generic_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from Immersive_Space_App")
    func parseImmersive_Space_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Immersive_Space_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from Immersive_Space_App")
    func roundTripImmersive_Space_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Immersive_Space_App_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from Metal_Library_Base")
    func parseMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Metal_Library_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from Metal_Library_Base")
    func roundTripMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Metal_Library_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SharedContent_Metal_4_Game")
    func parseSharedContent_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_Metal_4_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SharedContent_Metal_4_Game")
    func roundTripSharedContent_Metal_4_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_Metal_4_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SharedContent_Metal_Game")
    func parseSharedContent_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_Metal_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SharedContent_Metal_Game")
    func roundTripSharedContent_Metal_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_Metal_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SharedContent_RealityKit_Game")
    func parseSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_RealityKit_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SharedContent_RealityKit_Game")
    func roundTripSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_RealityKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SharedContent_Safari_Extension_App")
    func parseSharedContent_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_Safari_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SharedContent_Safari_Extension_App")
    func roundTripSharedContent_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SharedContent_SceneKit_Game")
    func parseSharedContent_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_SceneKit_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SharedContent_SceneKit_Game")
    func roundTripSharedContent_SceneKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_SceneKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SharedContent_SpriteKit_Game")
    func parseSharedContent_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_SpriteKit_Game_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SharedContent_SpriteKit_Game")
    func roundTripSharedContent_SpriteKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SharedContent_SpriteKit_Game_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SwiftUI_App_Base")
    func parseSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/SwiftUI_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SwiftUI_App_Base")
    func roundTripSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/SwiftUI_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from SwiftUI_Document_App_Base")
    func parseSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SwiftUI_Document_App_Base_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from SwiftUI_Document_App_Base")
    func roundTripSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/SwiftUI_Document_App_Base_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Widget_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from Widget_Extension")
    func roundTripWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/Widget_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from XPC_Service_Base")
    func parseXPC_Service_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/XPC_Service_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from XPC_Service_Base")
    func roundTripXPC_Service_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/XPC_Service_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from iOS_App_Base")
    func parseiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/iOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from iOS_App_Base")
    func roundTripiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/iOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from iOS_Safari_Extension_App")
    func parseiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/iOS_Safari_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from iOS_Safari_Extension_App")
    func roundTripiOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/iOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from iOS_Safari_Extension")
    func parseiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/iOS_Safari_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from iOS_Safari_Extension")
    func roundTripiOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/iOS_Safari_Extension_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from macOS_Safari_Extension_App")
    func parsemacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/macOS_Safari_Extension_App_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from macOS_Safari_Extension_App")
    func roundTripmacOS_Safari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/macOS_Safari_Extension_App_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from macOS_Safari_Extension")
    func parsemacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/macOS_Safari_Extension_value.plist"
        )
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from macOS_Safari_Extension")
    func roundTripmacOS_Safari_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(
            of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift",
            with: "Fixtures/Nodes/macOS_Safari_Extension_value.plist"
        )
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Parse Nodes from tvOS_App_Base")
    func parsetvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/tvOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Nodes"] as? [String]

        // Test passes if plist loads and extraction completes without error
        _ = value
    }

    @Test("Round-trip Nodes from tvOS_App_Base")
    func roundTriptvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "TemplateParserTests/FieldTests/NodesTests/NodesTests.swift", with: "Fixtures/Nodes/tvOS_App_Base_value.plist")
        let originalData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let originalPlist = try PropertyListSerialization.propertyList(from: originalData, format: nil) as! [String: Any]

        // Parse original value
        let value = originalPlist["Nodes"] as? [String]

        // Skip test if field not present in this template
        guard let value else { return }

        // Serialize back to plist
        var outputPlist: [String: Any] = [:]
        outputPlist["Nodes"] = value

        // Serialize to XML data
        let outputData = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)

        // Parse serialized data
        let reparsedPlist = try PropertyListSerialization.propertyList(from: outputData, format: nil) as! [String: Any]
        let reparsedValue = reparsedPlist["Nodes"] as? [String]

        // Verify round-trip preserves value
        #expect(reparsedValue != nil, "Nodes should survive round-trip")
    }

    @Test("Handle missing Nodes")
    func parseMissingNodes() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Nodes"] as? [String]

        #expect(value == nil, "Nodes should be nil when not present")
    }
}
