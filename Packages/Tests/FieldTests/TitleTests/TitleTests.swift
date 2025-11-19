import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Title" field extraction
///
/// The Title field appears in 6 templates and specifies title overrides.
@Suite("Title Parsing")
struct TitleFieldTests {
    @Test("Parse Title", .disabled("Field not yet implemented"))
    func parseTitle() throws {
        // TODO: Implement Title field in TemplateMetadata
        // TODO: Load from Fixtures/Title_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Title", .disabled("Field not yet implemented"))
    func parseMissingTitle() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
