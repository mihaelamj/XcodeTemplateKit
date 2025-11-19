import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Project" field extraction
///
/// The Project field appears in 8 templates and specifies project-level configuration.
@Suite("Project Parsing")
struct ProjectFieldTests {
    @Test("Parse Project", .disabled("Field not yet implemented"))
    func parseProject() throws {
        // TODO: Implement Project field in TemplateMetadata
        // TODO: Load from Fixtures/Project_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Project", .disabled("Field not yet implemented"))
    func parseMissingProject() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
