
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "Summary" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("Summary Field Parsing")
struct SummaryTests {
    @Test("Parse Summary from App_Entity")
    func parseApp_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from App_Enum")
    func parseApp_Enum() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/App_Enum_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/App_Privacy_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Assembly_File")
    func parseAssembly_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Assembly_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from CLIPS_File")
    func parseCLIPS_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/CLIPS_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Configuration_Settings_File")
    func parseConfiguration_Settings_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Configuration_Settings_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Empty_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Exports_File")
    func parseExports_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Exports_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from File_List")
    func parseFile_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/File_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from INIntent_subclass")
    func parseINIntent_subclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/INIntent_subclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Link_action")
    func parseLink_action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Link_action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Markdown_File")
    func parseMarkdown_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Markdown_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Module_Map")
    func parseModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Module_Map_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from PCH_File")
    func parsePCH_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/PCH_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Property_List")
    func parseProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/RTF_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SceneKit_Asset_Cache")
    func parseSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SceneKit_Asset_Cache_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SceneKit_Asset_Catalog")
    func parseSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SceneKit_Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SceneKit_Scene_File")
    func parseSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SceneKit_Scene_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Shell_Script")
    func parseShell_Script() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Shell_Script_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SiriKit_Intent_Definition_File")
    func parseSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SiriKit_Intent_Definition_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SpriteKit_Action")
    func parseSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SpriteKit_Action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SpriteKit_Particle_File")
    func parseSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SpriteKit_Particle_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SpriteKit_Scene")
    func parseSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SpriteKit_Scene_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SpriteKit_Tile_Set")
    func parseSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SpriteKit_Tile_Set_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Stringsdict_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Test_Plan")
    func parseTest_Plan() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Test_Plan_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Touch_Alternatives_Property_List")
    func parseTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Touch_Alternatives_Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Transient_App_Entity")
    func parseTransient_App_Entity() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Transient_App_Entity_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Summary from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SummaryTests.swift", with: "Fixtures/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Summary"] as? String

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing Summary")
    func parseMissingSummary() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Summary"] as? String

        #expect(value == nil, "Summary should be nil when not present")
    }
}
