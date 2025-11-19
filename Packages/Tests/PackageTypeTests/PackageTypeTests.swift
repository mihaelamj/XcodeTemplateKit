import Foundation
@testable import TemplateParser
import Testing

/// Tests for the "PackageType" field extraction
///
/// The PackageType field appears in 5 templates and specifies Swift Package types.
@Suite("PackageType Parsing")
struct PackageTypeFieldTests {
    @Test("Parse PackageType", .disabled("Field not yet implemented"))
    func parsePackageType() throws {
        // TODO: Implement PackageType field in TemplateMetadata
        // TODO: Load from Fixtures/PackageType_*.plist
        throw TestError.notImplemented
    }

    @Test("Handle missing PackageType", .disabled("Field not yet implemented"))
    func parseMissingPackageType() throws {
        throw TestError.notImplemented
    }
}

enum TestError: Error {
    case notImplemented
}
