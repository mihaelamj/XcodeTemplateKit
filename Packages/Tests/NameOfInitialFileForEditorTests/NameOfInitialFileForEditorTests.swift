import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "NameOfInitialFileForEditor" field extraction
///
/// The NameOfInitialFileForEditor field appears in 6 templates and specifies initial editor file.
@Suite("NameOfInitialFileForEditor Parsing")
struct NameOfInitialFileForEditorFieldTests {
    @Test("Parse NameOfInitialFileForEditor", .disabled("Field not yet implemented"))
    func parseNameOfInitialFileForEditor() throws {
        // TODO: Implement NameOfInitialFileForEditor field in TemplateMetadata
        // TODO: Load from Fixtures/NameOfInitialFileForEditor_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing NameOfInitialFileForEditor", .disabled("Field not yet implemented"))
    func parseMissingNameOfInitialFileForEditor() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
