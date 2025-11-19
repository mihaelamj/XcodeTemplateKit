import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "ProjectOnly" field extraction
///
/// The ProjectOnly field appears in 1 templates and specifies project-only flags.
@Suite("ProjectOnly Parsing")
struct ProjectOnlyFieldTests {
    @Test("Parse ProjectOnly", .disabled("Field not yet implemented"))
    func parseProjectOnly() throws {
        // TODO: Implement ProjectOnly field in TemplateMetadata
        // TODO: Load from Fixtures/ProjectOnly_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing ProjectOnly", .disabled("Field not yet implemented"))
    func parseMissingProjectOnly() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
