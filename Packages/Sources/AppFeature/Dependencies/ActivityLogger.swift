import Foundation
import OSLog

// MARK: - Activity Logger Protocol

/// Abstracts logging operations for testability.
///
/// This protocol provides a minimal logging interface following Apple's
/// protocol-oriented programming guidelines. In production, use `OSActivityLogger`
/// for real logging. In tests, use `SilentLogger` to avoid console spam.
///
/// ## Testing
/// ```swift
/// let model = TemplateTreeModel(
///     inventory: .mock,
///     logger: SilentLogger()
/// )
/// // Tests run silently without logging output
/// ```
public protocol ActivityLogger: Sendable {
    /// Logs a message.
    func log(_ message: String)

    /// Begins an activity interval for performance tracking.
    func beginInterval(_ name: StaticString) -> any Sendable

    /// Ends an activity interval.
    func endInterval(_ name: StaticString, _ interval: any Sendable)

    /// Emits a performance event.
    func emitEvent(_ name: StaticString)
}

// MARK: - OS Activity Logger

/// Production logger using OSLog and OSSignposter.
public struct OSActivityLogger: ActivityLogger {
    private let logger: Logger
    private let signposter: OSSignposter

    public init(subsystem: String, category: String) {
        self.logger = Logger(subsystem: subsystem, category: category)
        let log = OSLog(subsystem: subsystem, category: .pointsOfInterest)
        self.signposter = OSSignposter(logHandle: log)
    }

    public func log(_ message: String) {
        logger.info("\(message)")
    }

    public func beginInterval(_ name: StaticString) -> any Sendable {
        let id = signposter.makeSignpostID()
        return signposter.beginInterval(name, id: id)
    }

    public func endInterval(_ name: StaticString, _ interval: any Sendable) {
        if let state = interval as? OSSignpostIntervalState {
            signposter.endInterval(name, state)
        }
    }

    public func emitEvent(_ name: StaticString) {
        let id = signposter.makeSignpostID()
        signposter.emitEvent(name, id: id)
    }
}

// MARK: - Silent Logger

/// Test logger that produces no output.
public struct SilentLogger: ActivityLogger {
    private struct EmptyInterval: Sendable {}

    public init() {}

    public func log(_ message: String) {}

    public func beginInterval(_ name: StaticString) -> any Sendable {
        EmptyInterval()
    }

    public func endInterval(_ name: StaticString, _ interval: any Sendable) {}

    public func emitEvent(_ name: StaticString) {}
}
