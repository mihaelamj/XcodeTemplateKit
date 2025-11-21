// swiftlint:disable:next blanket_disable_command
// swiftlint:disable force_cast
import Foundation
@testable import Generator
import Models
import Testing

@Suite("Configurations Field Generation")
struct ConfigurationsGeneratorTests {
    @Test("Encode external build system configurations")
    func encodeExternalBuildSystemConfigurations() throws {
        let configurations: [String: [String: String]] = [
            "Debug": [
                "DEBUGGING_SYMBOLS": "YES",
                "GCC_GENERATE_DEBUGGING_SYMBOLS": "YES",
                "GCC_OPTIMIZATION_LEVEL": "0",
                "DEBUG_INFORMATION_FORMAT": "dwarf",
            ],
            "Release": [
                "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
            ],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurations], format: .xml, options: 0)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict?.keys.count == 2)

        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?["DEBUGGING_SYMBOLS"] == "YES")
        #expect(debugSettings?["GCC_OPTIMIZATION_LEVEL"] == "0")

        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?["DEBUG_INFORMATION_FORMAT"] == "dwarf-with-dsym")
    }

    @Test("Encode empty configurations")
    func encodeEmptyConfigurations() throws {
        let configurations: [String: [String: String]] = [
            "Debug": [:],
            "Release": [:],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurations], format: .xml, options: 0)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict?.keys.count == 2)
        #expect(configurationsDict?["Debug"]?.isEmpty == true)
        #expect(configurationsDict?["Release"]?.isEmpty == true)
    }

    @Test("Encode complete target configurations")
    func encodeCompleteTargetConfigurations() throws {
        let configurations: [String: [String: String]] = [
            "Debug": [
                "DEBUG_INFORMATION_FORMAT": "dwarf",
                "ENABLE_TESTABILITY": "YES",
                "GCC_DYNAMIC_NO_PIC": "NO",
                "GCC_OPTIMIZATION_LEVEL": "0",
                "GCC_PREPROCESSOR_DEFINITIONS": "DEBUG=1",
                "MTL_ENABLE_DEBUG_INFO": "INCLUDE_SOURCE",
                "ONLY_ACTIVE_ARCH": "YES",
            ],
            "Release": [
                "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
                "ENABLE_NS_ASSERTIONS": "NO",
                "MTL_ENABLE_DEBUG_INFO": "NO",
            ],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurations], format: .xml, options: 0)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict != nil)

        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?.count == 7)
        #expect(debugSettings?["GCC_PREPROCESSOR_DEFINITIONS"] == "DEBUG=1")

        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?.count == 3)
        #expect(releaseSettings?["ENABLE_NS_ASSERTIONS"] == "NO")
    }

    @Test("Round-trip from external build system fixture")
    func roundTripFromExternalBuildSystemFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/ExternalBuildSystem_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as! [String: [String: String]]

        // Encode
        let encodedData = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurationsDict], format: .xml, options: 0)

        // Decode
        let decodedPlist = try PropertyListSerialization.propertyList(from: encodedData, format: nil) as! [String: Any]
        let decodedConfigurations = decodedPlist["Configurations"] as! [String: [String: String]]

        // Verify round-trip
        #expect(decodedConfigurations.keys.count == configurationsDict.keys.count)
        #expect(decodedConfigurations["Debug"]?.count == configurationsDict["Debug"]?.count)
        #expect(decodedConfigurations["Release"]?.count == configurationsDict["Release"]?.count)

        #expect(decodedConfigurations["Debug"]?["DEBUGGING_SYMBOLS"] == "YES")
        #expect(decodedConfigurations["Debug"]?["GCC_GENERATE_DEBUGGING_SYMBOLS"] == "YES")
        #expect(decodedConfigurations["Release"]?["DEBUG_INFORMATION_FORMAT"] == "dwarf-with-dsym")
    }

    @Test("Round-trip from complete target fixture")
    func roundTripFromCompleteTargetFixture() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Configurations/CompleteTarget_value.plist")
        let data = try Data(contentsOf: fixtureURL)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as! [String: [String: String]]

        // Encode
        let encodedData = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurationsDict], format: .xml, options: 0)

        // Decode
        let decodedPlist = try PropertyListSerialization.propertyList(from: encodedData, format: nil) as! [String: Any]
        let decodedConfigurations = decodedPlist["Configurations"] as! [String: [String: String]]

        // Verify all Debug settings
        let originalDebug = configurationsDict["Debug"]
        let decodedDebug = decodedConfigurations["Debug"]
        #expect(decodedDebug?.count == originalDebug?.count)
        for (key, value) in originalDebug ?? [:] {
            #expect(decodedDebug?[key] == value)
        }

        // Verify all Release settings
        let originalRelease = configurationsDict["Release"]
        let decodedRelease = decodedConfigurations["Release"]
        #expect(decodedRelease?.count == originalRelease?.count)
        for (key, value) in originalRelease ?? [:] {
            #expect(decodedRelease?[key] == value)
        }
    }

    @Test("Encode heterogeneous configurations")
    func encodeHeterogeneousConfigurations() throws {
        // Different settings per configuration
        let configurations: [String: [String: String]] = [
            "Debug": [
                "ENABLE_TESTABILITY": "YES",
                "GCC_OPTIMIZATION_LEVEL": "0",
                "ONLY_ACTIVE_ARCH": "YES",
            ],
            "Release": [
                "ENABLE_NS_ASSERTIONS": "NO",
                "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
            ],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: ["Configurations": configurations], format: .xml, options: 0)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let configurationsDict = plist["Configurations"] as? [String: [String: String]]

        let debugSettings = configurationsDict?["Debug"]
        #expect(debugSettings?.count == 3)
        #expect(debugSettings?["ENABLE_TESTABILITY"] == "YES")
        #expect(debugSettings?["ENABLE_NS_ASSERTIONS"] == nil)

        let releaseSettings = configurationsDict?["Release"]
        #expect(releaseSettings?.count == 2)
        #expect(releaseSettings?["ENABLE_NS_ASSERTIONS"] == "NO")
        #expect(releaseSettings?["ENABLE_TESTABILITY"] == nil)
    }

    @Test("Encode configurations in complete target")
    func encodeConfigurationsInCompleteTarget() throws {
        let target: [String: Any] = [
            "Configurations": [
                "Debug": [
                    "DEBUG_INFORMATION_FORMAT": "dwarf",
                    "ENABLE_TESTABILITY": "YES",
                ],
                "Release": [
                    "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
                ],
            ],
            "SharedSettings": [:],
        ]

        let template: [String: Any] = [
            "Identifier": "com.apple.dt.unit.test",
            "Kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
            "Targets": [target],
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: template, format: .xml, options: 0)
        let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let targetsArray = plist["Targets"] as? [[String: Any]]
        #expect(targetsArray?.count == 1)

        let decodedTarget = targetsArray?[0]
        let configurationsDict = decodedTarget?["Configurations"] as? [String: [String: String]]
        #expect(configurationsDict?.keys.count == 2)
        #expect(configurationsDict?["Debug"]?["ENABLE_TESTABILITY"] == "YES")
        #expect(configurationsDict?["Release"]?["DEBUG_INFORMATION_FORMAT"] == "dwarf-with-dsym")
    }
}
