import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "Image" field extraction
///
/// The Image field appears in 49 templates and specifies template icon.
@Suite("Image Parsing")
struct ImageFieldTests {
    @Test("Parse Image", .disabled("Field not yet implemented"))
    func parseImage() throws {
        // TODO: Implement Image field in TemplateMetadata
        // TODO: Load from Fixtures/Image_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing Image", .disabled("Field not yet implemented"))
    func parseMissingImage() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
