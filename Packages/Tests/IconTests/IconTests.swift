import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Icon" field extraction
///
/// The Icon field appears in 6 templates and specifies icon file names.
@Suite("Icon Parsing")
struct IconFieldTests {
    @Test("Parse Icon", .disabled("Field not yet implemented"))
    func parseIcon() throws {
        // TODO: Implement Icon field in TemplateMetadata
        // TODO: Load from Fixtures/Icon_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Icon", .disabled("Field not yet implemented"))
    func parseMissingIcon() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
