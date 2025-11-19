import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "HiddenFromLibrary" field extraction
///
/// The HiddenFromLibrary field appears in 10 templates and specifies library visibility.
@Suite("HiddenFromLibrary Parsing")
struct HiddenFromLibraryFieldTests {
    @Test("Parse HiddenFromLibrary", .disabled("Field not yet implemented"))
    func parseHiddenFromLibrary() throws {
        // TODO: Implement HiddenFromLibrary field in TemplateMetadata
        // TODO: Load from Fixtures/HiddenFromLibrary_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing HiddenFromLibrary", .disabled("Field not yet implemented"))
    func parseMissingHiddenFromLibrary() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
