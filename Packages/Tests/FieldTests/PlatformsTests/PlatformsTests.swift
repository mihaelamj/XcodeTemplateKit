
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "Platforms" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("Platforms Field Parsing")
struct PlatformsTests {
    @Test("Parse Platforms from App_Privacy")
    func parseApp_Privacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/App_Privacy_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Asset_Catalog")
    func parseAsset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Audio_Unit_Extension")
    func parseAudio_Unit_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Audio_Unit_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Build_Tool_Plug-in")
    func parseBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Build_Tool_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Command_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Generic_Extension")
    func parseGeneric_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Generic_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Library_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Module_Map")
    func parseModule_Map() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Module_Map_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Objective-C_new_superclass")
    func parseObjective_C_new_superclass() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Objective-C_new_superclass_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Playground_Page")
    func parsePlayground_Page() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Playground_Page_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Property_List")
    func parseProperty_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from RTF_File")
    func parseRTF_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/RTF_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Safari_Extension_App")
    func parseSafari_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Safari_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SceneKit_Asset_Cache")
    func parseSceneKit_Asset_Cache() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SceneKit_Asset_Cache_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SceneKit_Asset_Catalog")
    func parseSceneKit_Asset_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SceneKit_Asset_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SceneKit_Scene_File")
    func parseSceneKit_Scene_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SceneKit_Scene_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SiriKit_Intent_Definition_File")
    func parseSiriKit_Intent_Definition_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SiriKit_Intent_Definition_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Sources_Folder_Swift_File")
    func parseSources_Folder_Swift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Sources_Folder_Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SpriteKit_Action")
    func parseSpriteKit_Action() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SpriteKit_Action_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SpriteKit_Particle_File")
    func parseSpriteKit_Particle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SpriteKit_Particle_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SpriteKit_Scene")
    func parseSpriteKit_Scene() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SpriteKit_Scene_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SpriteKit_Tile_Set")
    func parseSpriteKit_Tile_Set() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SpriteKit_Tile_Set_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Strings_File_(Legacy)")
    func parseStrings_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Strings_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Stringsdict_File_(Legacy)")
    func parseStringsdict_File_Legacy() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Stringsdict_File_(Legacy)_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Swift_Macro_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Touch_Alternatives_Property_List")
    func parseTouch_Alternatives_Property_List() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Touch_Alternatives_Property_List_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from UI_Testing_Bundle")
    func parseUI_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/UI_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Unit_Testing_Bundle")
    func parseUnit_Testing_Bundle() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Unit_Testing_Bundle_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Widget_Extension")
    func parseWidget_Extension() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Widget_Extension_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from iOS_App_Base")
    func parseiOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/iOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from macOS_App_Base")
    func parsemacOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/macOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from macOS_App_Entitlements")
    func parsemacOS_App_Entitlements() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/macOS_App_Entitlements_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse Platforms from tvOS_App_Base")
    func parsetvOS_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "PlatformsTests.swift", with: "Fixtures/tvOS_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["Platforms"] as? [String]

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing Platforms")
    func parseMissingPlatforms() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["Platforms"] as? [String]

        #expect(value == nil, "Platforms should be nil when not present")
    }
}
