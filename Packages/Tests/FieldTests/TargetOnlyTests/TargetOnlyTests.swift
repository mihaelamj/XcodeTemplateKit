import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "TargetOnly" field extraction
///
/// The TargetOnly field appears in 7 templates and specifies target-only flags.
@Suite("TargetOnly Parsing")
struct TargetOnlyFieldTests {
    @Test("Parse TargetOnly", .disabled("Field not yet implemented"))
    func parseTargetOnly() throws {
        // TODO: Implement TargetOnly field in TemplateMetadata
        // TODO: Load from Fixtures/TargetOnly_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing TargetOnly", .disabled("Field not yet implemented"))
    func parseMissingTargetOnly() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
