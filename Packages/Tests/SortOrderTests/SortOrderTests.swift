import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "SortOrder" field extraction
///
/// The SortOrder field appears in 35 templates and specifies display order.
@Suite("SortOrder Parsing")
struct SortOrderFieldTests {
    @Test("Parse SortOrder", .disabled("Field not yet implemented"))
    func parseSortOrder() throws {
        // TODO: Implement SortOrder field in TemplateMetadata
        // TODO: Load from Fixtures/SortOrder_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing SortOrder", .disabled("Field not yet implemented"))
    func parseMissingSortOrder() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
