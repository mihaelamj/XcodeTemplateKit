import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "BuildableType" field extraction
///
/// The BuildableType field appears in 15 templates and specifies buildable target types.
@Suite("BuildableType Parsing")
struct BuildableTypeFieldTests {
    @Test("Parse BuildableType", .disabled("Field not yet implemented"))
    func parseBuildableType() throws {
        // TODO: Implement BuildableType field in TemplateMetadata
        // TODO: Load from Fixtures/BuildableType_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing BuildableType", .disabled("Field not yet implemented"))
    func parseMissingBuildableType() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
