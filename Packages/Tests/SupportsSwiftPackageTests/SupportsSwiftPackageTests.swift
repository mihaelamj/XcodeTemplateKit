import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "SupportsSwiftPackage" field extraction
///
/// The SupportsSwiftPackage field appears in 26 templates and specifies SPM support.
@Suite("SupportsSwiftPackage Parsing")
struct SupportsSwiftPackageFieldTests {
    @Test("Parse SupportsSwiftPackage", .disabled("Field not yet implemented"))
    func parseSupportsSwiftPackage() throws {
        // TODO: Implement SupportsSwiftPackage field in TemplateMetadata
        // TODO: Load from Fixtures/SupportsSwiftPackage_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing SupportsSwiftPackage", .disabled("Field not yet implemented"))
    func parseMissingSupportsSwiftPackage() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
