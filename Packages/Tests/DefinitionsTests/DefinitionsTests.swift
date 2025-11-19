import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Definitions" field extraction
///
/// The Definitions field appears in 43 templates and specifies variable definitions.
@Suite("Definitions Parsing")
struct DefinitionsFieldTests {
    @Test("Parse Definitions", .disabled("Field not yet implemented"))
    func parseDefinitions() throws {
        // TODO: Implement Definitions field in TemplateMetadata
        // TODO: Load from Fixtures/Definitions_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Definitions", .disabled("Field not yet implemented"))
    func parseMissingDefinitions() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
