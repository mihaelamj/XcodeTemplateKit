import Foundation

// MARK: - File System Provider Protocol

/// Abstracts file system operations for testability.
///
/// This protocol provides the minimal interface needed for template scanning
/// and processing. Following Apple's guidelines for protocol-oriented programming,
/// this allows replacing real file system access with test stubs.
///
/// ## Testing
/// In tests, use a mock implementation that doesn't touch the actual file system:
///
/// ```swift
/// struct MockFileSystem: FileSystemProvider {
///     var files: [String: String] = [:]
///
///     func fileExists(atPath path: String) -> Bool {
///         files[path] != nil
///     }
/// }
/// ```
public protocol FileSystemProvider: Sendable {
    /// Returns whether a file exists at the given path.
    func fileExists(atPath path: String) -> Bool

    /// Returns whether a file at the given path is a directory.
    func fileExists(atPath path: String, isDirectory: UnsafeMutablePointer<ObjCBool>?) -> Bool

    /// Creates a directory enumerator for the given path.
    func enumerator(atPath path: String) -> FileManager.DirectoryEnumerator?

    /// Returns the contents of a directory at the given path.
    func contentsOfDirectory(atPath path: String) throws -> [String]
}

// MARK: - FileManager Conformance

extension FileManager: FileSystemProvider {}
