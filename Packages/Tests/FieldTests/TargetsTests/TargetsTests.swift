import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Targets" field extraction
///
/// The Targets field appears in 45 templates and specifies target configuration.
@Suite("Targets Parsing")
struct TargetsFieldTests {
    @Test("Parse Targets", .disabled("Field not yet implemented"))
    func parseTargets() throws {
        // TODO: Implement Targets field in TemplateMetadata
        // TODO: Load from Fixtures/Targets_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Targets", .disabled("Field not yet implemented"))
    func parseMissingTargets() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
