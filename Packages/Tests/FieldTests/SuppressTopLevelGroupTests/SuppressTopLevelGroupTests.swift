import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "SuppressTopLevelGroup" field extraction
///
/// The SuppressTopLevelGroup field appears in 2 templates and specifies group suppression flags.
@Suite("SuppressTopLevelGroup Parsing")
struct SuppressTopLevelGroupFieldTests {
    @Test("Parse SuppressTopLevelGroup", .disabled("Field not yet implemented"))
    func parseSuppressTopLevelGroup() throws {
        // TODO: Implement SuppressTopLevelGroup field in TemplateMetadata
        // TODO: Load from Fixtures/SuppressTopLevelGroup_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing SuppressTopLevelGroup", .disabled("Field not yet implemented"))
    func parseMissingSuppressTopLevelGroup() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
