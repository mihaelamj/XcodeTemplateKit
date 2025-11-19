import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Platforms" field extraction
///
/// The Platforms field appears in 58 templates and specifies supported platforms.
/// Example: ["com.apple.platform.iphoneos", "com.apple.platform.macosx"]
@Suite("Platforms Parsing")
struct PlatformsTests {
    @Test("Parse platforms array", .disabled("Field not yet implemented"))
    func parsePlatforms() throws {
        // TODO: Implement Platforms field in TemplateMetadata
        // TODO: Load from Fixtures/Platforms_App.plist
        throw TestError.notImplemented
    }

    @Test("Parse single platform", .disabled("Field not yet implemented"))
    func parseSinglePlatform() throws {
        throw TestError.notImplemented
    }

    @Test("Handle missing platforms", .disabled("Field not yet implemented"))
    func parseMissingPlatforms() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
