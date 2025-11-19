import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "HiddenFromChooser" field extraction
///
/// The HiddenFromChooser field appears in 10 templates and specifies chooser visibility.
@Suite("HiddenFromChooser Parsing")
struct HiddenFromChooserFieldTests {
    @Test("Parse HiddenFromChooser", .disabled("Field not yet implemented"))
    func parseHiddenFromChooser() throws {
        // TODO: Implement HiddenFromChooser field in TemplateMetadata
        // TODO: Load from Fixtures/HiddenFromChooser_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing HiddenFromChooser", .disabled("Field not yet implemented"))
    func parseMissingHiddenFromChooser() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
