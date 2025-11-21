import Foundation
import Models
@testable import Parser
import Testing

@Suite("Configurations Parser Tests")
struct ConfigurationsParserTests {
    @Test("Parse external build system configurations")
    func parseExternalBuildSystemConfigurations() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/ExternalBuildSystem_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict != nil)
        #expect(configurationsDict?.keys.count == 2)

        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?["DEBUGGING_SYMBOLS"] == "YES")
        #expect(debugSettings?["GCC_GENERATE_DEBUGGING_SYMBOLS"] == "YES")
        #expect(debugSettings?["GCC_OPTIMIZATION_LEVEL"] == "0")
        #expect(debugSettings?["DEBUG_INFORMATION_FORMAT"] == "dwarf")

        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?["DEBUG_INFORMATION_FORMAT"] == "dwarf-with-dsym")
    }

    @Test("Parse empty configurations")
    func parseEmptyConfigurations() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/Empty_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict != nil)
        #expect(configurationsDict?.keys.count == 2)

        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?.isEmpty == true)

        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?.isEmpty == true)
    }

    @Test("Parse complete target configurations")
    func parseCompleteTargetConfigurations() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/CompleteTarget_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict != nil)

        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?.count == 7)
        #expect(debugSettings?["DEBUG_INFORMATION_FORMAT"] == "dwarf")
        #expect(debugSettings?["ENABLE_TESTABILITY"] == "YES")
        #expect(debugSettings?["GCC_DYNAMIC_NO_PIC"] == "NO")
        #expect(debugSettings?["GCC_OPTIMIZATION_LEVEL"] == "0")
        #expect(debugSettings?["GCC_PREPROCESSOR_DEFINITIONS"] == "DEBUG=1")
        #expect(debugSettings?["MTL_ENABLE_DEBUG_INFO"] == "INCLUDE_SOURCE")
        #expect(debugSettings?["ONLY_ACTIVE_ARCH"] == "YES")

        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?.count == 3)
        #expect(releaseSettings?["DEBUG_INFORMATION_FORMAT"] == "dwarf-with-dsym")
        #expect(releaseSettings?["ENABLE_NS_ASSERTIONS"] == "NO")
        #expect(releaseSettings?["MTL_ENABLE_DEBUG_INFO"] == "NO")
    }

    @Test("Parse configurations from complete template")
    func parseConfigurationsFromCompleteTemplate() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/CompleteTarget_complete.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let targetsArray = plist["Targets"] as? [[String: Any]]
        #expect(targetsArray?.count == 1)

        let target = targetsArray?[0]
        let configurationsDict = target?["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict != nil)
        #expect(configurationsDict?.keys.count == 2)

        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?.count == 7)

        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?.count == 3)
    }

    @Test("Round-trip external build system configurations")
    func roundTripExternalBuildSystem() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/ExternalBuildSystem_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as! [String: [String: String]]

        // Encode
        let encodedData = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurationsDict], format: .xml, options: 0)

        // Decode
        let decodedPlist = try PropertyListSerialization.propertyList(from: encodedData, format: nil) as! [String: Any]
        let decodedConfigurations = decodedPlist["Configurations"] as! [String: [String: String]]

        #expect(decodedConfigurations.keys.count == configurationsDict.keys.count)
        #expect(decodedConfigurations["Debug"]?["DEBUGGING_SYMBOLS"] == "YES")
        #expect(decodedConfigurations["Release"]?["DEBUG_INFORMATION_FORMAT"] == "dwarf-with-dsym")
    }

    @Test("Round-trip complete target configurations")
    func roundTripCompleteTarget() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/CompleteTarget_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as! [String: [String: String]]

        // Encode
        let encodedData = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurationsDict], format: .xml, options: 0)

        // Decode
        let decodedPlist = try PropertyListSerialization.propertyList(from: encodedData, format: nil) as! [String: Any]
        let decodedConfigurations = decodedPlist["Configurations"] as! [String: [String: String]]

        let originalDebug = configurationsDict["Debug"]
        let decodedDebug = decodedConfigurations["Debug"]
        #expect(decodedDebug?.count == originalDebug?.count)
        #expect(decodedDebug?["GCC_PREPROCESSOR_DEFINITIONS"] == "DEBUG=1")

        let originalRelease = configurationsDict["Release"]
        let decodedRelease = decodedConfigurations["Release"]
        #expect(decodedRelease?.count == originalRelease?.count)
        #expect(decodedRelease?["ENABLE_NS_ASSERTIONS"] == "NO")
    }

    @Test("Handle heterogeneous build settings")
    func handleHeterogeneousBuildSettings() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/CompleteTarget_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]

        // Debug has 7 settings
        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?.count == 7)

        // Release has 3 different settings
        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?.count == 3)

        // Verify settings are different between configurations
        #expect(debugSettings?["ENABLE_TESTABILITY"] == "YES")
        #expect(releaseSettings?["ENABLE_TESTABILITY"] == nil)

        #expect(debugSettings?["ENABLE_NS_ASSERTIONS"] == nil)
        #expect(releaseSettings?["ENABLE_NS_ASSERTIONS"] == "NO")
    }
}
