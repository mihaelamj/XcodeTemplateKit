import Foundation
@testable import Generator
import Models
import Testing

@Suite("Image Field Generation")
struct ImageGeneratorTests {
    @Test("Encode Image enum values")
    func encodeImageValues() throws {
        let testCases: [(Template.Model.ImageSourceType, String)] = [
            (.fileTypeIcon, "FileTypeIcon"),
            (.systemSymbol, "SystemSymbolName"),
            (.bundleImage, "BundleImageName"),
            (.bundleIdentifier, "BundleIdentifier"),
        ]

        for (imageType, expectedRawValue) in testCases {
            var plist: [String: Any] = [:]
            plist["Image"] = imageType.rawValue

            let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
            let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

            #expect(decoded["Image"] as? String == expectedRawValue)
        }
    }

    @Test("Round-trip Image encoding")
    func roundTripImage() throws {
        let image = Template.Model.ImageSourceType.fileTypeIcon

        var plist: [String: Any] = [:]
        plist["Image"] = image.rawValue

        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
        let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        let decodedImageString = decoded["Image"] as? String
        let decodedImage = decodedImageString.flatMap { Template.Model.ImageSourceType(rawValue: $0) }

        #expect(decodedImage == image)
    }

    @Test("Encode all Image types")
    func encodeAllImageTypes() throws {
        let allTypes: [Template.Model.ImageSourceType] = [
            .fileTypeIcon,
            .systemSymbol,
            .bundleImage,
            .bundleIdentifier,
        ]

        for imageType in allTypes {
            var plist: [String: Any] = [:]
            plist["Image"] = imageType.rawValue

            let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
            let decoded = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

            #expect(decoded["Image"] as? String == imageType.rawValue)
        }
    }
}
