import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "DefaultCompletionName" field extraction
///
/// The DefaultCompletionName field appears in 55 templates and specifies default file/class name.
@Suite("DefaultCompletionName Parsing")
struct DefaultCompletionNameFieldTests {
    @Test("Parse DefaultCompletionName", .disabled("Field not yet implemented"))
    func parseDefaultCompletionName() throws {
        // TODO: Implement DefaultCompletionName field in TemplateMetadata
        // TODO: Load from Fixtures/DefaultCompletionName_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing DefaultCompletionName", .disabled("Field not yet implemented"))
    func parseMissingDefaultCompletionName() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
