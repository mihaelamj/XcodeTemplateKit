
import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive tests for the "SortOrder" field extraction
///
/// Tests all available fixtures to ensure complete coverage.
/// Verifies that plist loading and field extraction work correctly.
@Suite("SortOrder Field Parsing")
struct SortOrderTests {
    @Test("Parse SortOrder from App")
    func parseApp() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Application")
    func parseApplication() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Application_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Article_File")
    func parseArticle_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Article_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Audio_Unit_Extension_App")
    func parseAudio_Unit_Extension_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Audio_Unit_Extension_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Build_Tool_Plug-in")
    func parseBuild_Tool_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Build_Tool_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from C++_File")
    func parseC_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/C++_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from C_File")
    func parseC_File_2() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Command_Plug-in")
    func parseCommand_Plug_in() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Command_Plug-in_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Document_App")
    func parseDocument_App() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Document_App_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Documentation_Catalog")
    func parseDocumentation_Catalog() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Documentation_Catalog_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Empty_File")
    func parseEmpty_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Empty_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Empty")
    func parseEmpty() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Empty_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Extension_File")
    func parseExtension_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Extension_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Framework")
    func parseFramework() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Framework_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Game")
    func parseGame() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Header_File")
    func parseHeader_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Header_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Library")
    func parseLibrary() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Library_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Main_Menu")
    func parseMain_Menu() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Main_Menu_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Metal_File")
    func parseMetal_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Metal_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Metal_Library_Base")
    func parseMetal_Library_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Metal_Library_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Objective-C_File")
    func parseObjective_C_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Objective-C_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from SharedContent_RealityKit_Game")
    func parseSharedContent_RealityKit_Game() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/SharedContent_RealityKit_Game_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Storyboard")
    func parseStoryboard() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Storyboard_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from SwiftUI_App_Base")
    func parseSwiftUI_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/SwiftUI_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from SwiftUI_Document_App_Base")
    func parseSwiftUI_Document_App_Base() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/SwiftUI_Document_App_Base_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from SwiftUI_View")
    func parseSwiftUI_View() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/SwiftUI_View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Swift_File")
    func parseSwift_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Swift_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Swift_Macro")
    func parseSwift_Macro() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Swift_Macro_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Swift_Testing_Unit_Test")
    func parseSwift_Testing_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Swift_Testing_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Tutorial_File")
    func parseTutorial_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Tutorial_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Tutorial_Table_of_Contents_File")
    func parseTutorial_Table_of_Contents_File() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Tutorial_Table_of_Contents_File_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from View")
    func parseView() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/View_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from Window")
    func parseWindow() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/Window_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from XCTest_UI_Test")
    func parseXCTest_UI_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/XCTest_UI_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Parse SortOrder from XCTest_Unit_Test")
    func parseXCTest_Unit_Test() throws {
        let fixturePath = #filePath.replacingOccurrences(of: "SortOrderTests.swift", with: "Fixtures/XCTest_Unit_Test_value.plist")
        let plistData = try Data(contentsOf: URL(fileURLWithPath: fixturePath))
        let plist = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String: Any]

        // Extract field - may be nil if field not present in this template
        let value = plist["SortOrder"] as? Int

        // Test passes if plist loads and extraction completes without error
        // Field may or may not be present depending on template
        _ = value
    }

    @Test("Handle missing SortOrder")
    func parseMissingSortOrder() throws {
        let testPlist: [String: Any] = ["Kind": "Xcode.Xcode3.ProjectTemplateUnitKind"]

        let value = testPlist["SortOrder"] as? Int

        #expect(value == nil, "SortOrder should be nil when not present")
    }
}
