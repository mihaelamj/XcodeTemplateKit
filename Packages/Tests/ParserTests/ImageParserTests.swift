@testable import Parser
import Models
import Testing
import Foundation

@Suite("Image Parser Tests - Explicit")
struct ImageParserTests {
    @Test("Parse Image enum values")
    func parseImageValues() throws {
        // Test different Image values
        let testCases: [(String, Template.Model.ImageSourceType)] = [
            ("FileTypeIcon", .fileTypeIcon),
            ("SystemSymbolName", .systemSymbol),
            ("BundleImageName", .bundleImage),
            ("BundleIdentifier", .bundleIdentifier)
        ]

        for (rawValue, expectedType) in testCases {
            let parsed = Template.Model.ImageSourceType(rawValue: rawValue)
            #expect(parsed == expectedType)
        }
    }

    @Test("Parse Image from fixture")
    func parseFromFixture() throws {
        // Create a simple plist with Image field
        let plist: [String: Any] = [
            "Image": "FileTypeIcon"
        ]

        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .binary, options: 0)
        let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let imageString = decoded["Image"] as? String
        #expect(imageString == "FileTypeIcon")

        let imageType = imageString.flatMap { Template.Model.ImageSourceType(rawValue: $0) }
        #expect(imageType == .fileTypeIcon)
    }

    @Test("Round-trip Image encoding")
    func roundTripImage() throws {
        let image = Template.Model.ImageSourceType.fileTypeIcon

        // Encode as part of plist
        var plist: [String: Any] = [:]
        plist["Image"] = image.rawValue

        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)

        // Decode
        let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let decodedImage = (decoded["Image"] as? String).flatMap { Template.Model.ImageSourceType(rawValue: $0) }

        #expect(decodedImage == image)
    }
}
