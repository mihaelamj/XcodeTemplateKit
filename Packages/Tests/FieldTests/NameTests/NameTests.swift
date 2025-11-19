import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Name" field extraction
///
/// The Name field appears in 6 templates and specifies name overrides.
@Suite("Name Parsing")
struct NameFieldTests {
    @Test("Parse Name", .disabled("Field not yet implemented"))
    func parseName() throws {
        // TODO: Implement Name field in TemplateMetadata
        // TODO: Load from Fixtures/Name_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Name", .disabled("Field not yet implemented"))
    func parseMissingName() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
