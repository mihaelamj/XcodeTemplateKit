import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Summary" field extraction
///
/// The Summary field appears in 52 templates and specifies short template summary.
@Suite("Summary Parsing")
struct SummaryFieldTests {
    @Test("Parse Summary", .disabled("Field not yet implemented"))
    func parseSummary() throws {
        // TODO: Implement Summary field in TemplateMetadata
        // TODO: Load from Fixtures/Summary_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Summary", .disabled("Field not yet implemented"))
    func parseMissingSummary() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
