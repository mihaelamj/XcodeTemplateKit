import Foundation

// MARK: - Template Environment Protocol

/// Provides access to system dependencies for template processing.
///
/// This protocol abstracts system dependencies like date/time, UUID generation,
/// and user information to enable deterministic testing. Following Apple's
/// protocol-oriented programming guidelines for testability.
///
/// ## Testing
/// In tests, replace the default `SystemEnvironment` with `MockEnvironment`
/// to provide controlled, deterministic values.
///
/// ```swift
/// let env = MockEnvironment(
///     date: Date(timeIntervalSince1970: 0),
///     uuid: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
/// )
/// let scanner = Scanner(environment: env)
/// ```
public protocol TemplateEnvironment: Sendable {
    /// Returns the current date and time.
    func currentDate() -> Date

    /// Generates a new UUID.
    func generateUUID() -> UUID

    /// Returns the current user's short name.
    func userName() -> String

    /// Returns the current user's full name.
    func fullUserName() -> String
}

// MARK: - System Environment

/// Production implementation of `TemplateEnvironment` using system APIs.
public struct SystemEnvironment: TemplateEnvironment {
    public init() {}

    public func currentDate() -> Date {
        Date()
    }

    public func generateUUID() -> UUID {
        UUID()
    }

    public func userName() -> String {
        NSUserName()
    }

    public func fullUserName() -> String {
        NSFullUserName()
    }
}
