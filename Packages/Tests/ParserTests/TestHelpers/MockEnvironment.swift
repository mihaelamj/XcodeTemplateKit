import Foundation
@testable import Parser

/// Mock environment for deterministic testing.
///
/// Use this in tests to provide controlled, predictable values for system dependencies
/// like dates, UUIDs, and user information.
///
/// ## Example
/// ```swift
/// @Test func templateProcessing() {
///     let env = MockEnvironment(
///         date: Date(timeIntervalSince1970: 0),
///         uuid: UUID(uuidString: "12345678-1234-1234-1234-123456789012")!,
///         userName: "testuser",
///         fullUserName: "Test User"
///     )
///
///     let scanner = Scanner(environment: env)
///     let inventory = scanner.scanAllTemplates()
///
///     // Assert deterministic timestamp
///     #expect(inventory.generatedAt == "1970-01-01T00:00:00Z")
/// }
/// ```
public struct MockEnvironment: TemplateEnvironment {
    public let fixedDate: Date
    public let fixedUUID: UUID
    public let fixedUserName: String
    public let fixedFullUserName: String

    /// Creates a mock environment with fixed values.
    ///
    /// - Parameters:
    ///   - date: Fixed date to return. Defaults to Unix epoch (1970-01-01).
    ///   - uuid: Fixed UUID to return. Defaults to all zeros.
    ///   - userName: Fixed user name. Defaults to "testuser".
    ///   - fullUserName: Fixed full name. Defaults to "Test User".
    public init(
        date: Date = Date(timeIntervalSince1970: 0),
        uuid: UUID = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!,
        userName: String = "testuser",
        fullUserName: String = "Test User"
    ) {
        self.fixedDate = date
        self.fixedUUID = uuid
        self.fixedUserName = userName
        self.fixedFullUserName = fullUserName
    }

    public func currentDate() -> Date { fixedDate }
    public func generateUUID() -> UUID { fixedUUID }
    public func userName() -> String { fixedUserName }
    public func fullUserName() -> String { fixedFullUserName }
}
