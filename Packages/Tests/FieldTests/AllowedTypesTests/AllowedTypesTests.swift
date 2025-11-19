import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "AllowedTypes" field extraction
///
/// The AllowedTypes field appears in 26 templates and specifies allowed file types.
@Suite("AllowedTypes Parsing")
struct AllowedTypesFieldTests {
    @Test("Parse AllowedTypes", .disabled("Field not yet implemented"))
    func parseAllowedTypes() throws {
        // TODO: Implement AllowedTypes field in TemplateMetadata
        // TODO: Load from Fixtures/AllowedTypes_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing AllowedTypes", .disabled("Field not yet implemented"))
    func parseMissingAllowedTypes() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
