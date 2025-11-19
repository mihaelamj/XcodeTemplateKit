import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "LocalizedByDefault" field extraction
///
/// The LocalizedByDefault field appears in 2 templates and specifies localization defaults.
@Suite("LocalizedByDefault Parsing")
struct LocalizedByDefaultFieldTests {
    @Test("Parse LocalizedByDefault", .disabled("Field not yet implemented"))
    func parseLocalizedByDefault() throws {
        // TODO: Implement LocalizedByDefault field in TemplateMetadata
        // TODO: Load from Fixtures/LocalizedByDefault_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing LocalizedByDefault", .disabled("Field not yet implemented"))
    func parseMissingLocalizedByDefault() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
