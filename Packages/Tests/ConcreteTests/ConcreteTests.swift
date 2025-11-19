import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Concrete" field extraction
///
/// The Concrete field appears in 14 templates and specifies concrete vs base template.
@Suite("Concrete Parsing")
struct ConcreteFieldTests {
    @Test("Parse Concrete", .disabled("Field not yet implemented"))
    func parseConcrete() throws {
        // TODO: Implement Concrete field in TemplateMetadata
        // TODO: Load from Fixtures/Concrete_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Concrete", .disabled("Field not yet implemented"))
    func parseMissingConcrete() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
