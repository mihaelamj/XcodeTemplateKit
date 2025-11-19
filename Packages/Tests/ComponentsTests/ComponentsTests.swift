import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Components" field extraction
///
/// The Components field appears in 2 templates and specifies template components.
@Suite("Components Parsing")
struct ComponentsFieldTests {
    @Test("Parse Components", .disabled("Field not yet implemented"))
    func parseComponents() throws {
        // TODO: Implement Components field in TemplateMetadata
        // TODO: Load from Fixtures/Components_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Components", .disabled("Field not yet implemented"))
    func parseMissingComponents() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
