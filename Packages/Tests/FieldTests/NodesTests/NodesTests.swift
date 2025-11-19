import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Nodes" field extraction
///
/// The Nodes field appears in 24 templates and specifies template file node structure.
@Suite("Nodes Parsing")
struct NodesFieldTests {
    @Test("Parse Nodes", .disabled("Field not yet implemented"))
    func parseNodes() throws {
        // TODO: Implement Nodes field in TemplateMetadata
        // TODO: Load from Fixtures/Nodes_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Nodes", .disabled("Field not yet implemented"))
    func parseMissingNodes() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
