//
//  FileNode.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

/// Represents a file or directory node in a template's file structure.
///
/// ## Overview
///
/// A `FileNode` captures the hierarchical file system structure of an Xcode template.
/// It includes both the relative paths (as seen from the template root) and absolute
/// paths (on disk), making it easy to traverse and copy template files.
///
/// ## Example
///
/// ```swift
/// let node = FileNode(
///     name: "ContentView.swift",
///     path: "ContentView.swift",
///     absolutePath: "/path/to/template/ContentView.swift",
///     isDirectory: false,
///     children: nil
/// )
/// ```
///
/// For a directory with children:
///
/// ```swift
/// let directory = FileNode(
///     name: "Assets.xcassets",
///     path: "Assets.xcassets",
///     absolutePath: "/path/to/template/Assets.xcassets",
///     isDirectory: true,
///     children: [
///         FileNode(
///             name: "AccentColor.colorset",
///             path: "Assets.xcassets/AccentColor.colorset",
///             absolutePath: "/path/to/template/Assets.xcassets/AccentColor.colorset",
///             isDirectory: true,
///             children: [...]
///         )
///     ]
/// )
/// ```
///
/// - Note: The `path` is relative to the template bundle root, excluding `TemplateInfo.plist`.
/// - SeeAlso: `ProjectTemplateInfo.fileStructure` for how this integrates with template metadata.
public struct FileNode: Codable, Sendable, Hashable {
    /// The file or directory name (e.g., "ContentView.swift", "Assets.xcassets")
    public let name: String

    /// Relative path from template root (e.g., "Assets.xcassets/AccentColor.colorset/Contents.json")
    public let path: String

    /// Absolute path on disk for the template file or directory
    public let absolutePath: String

    /// Whether this node represents a directory (`true`) or a file (`false`)
    public let isDirectory: Bool

    /// Child nodes if this is a directory, `nil` for files
    ///
    /// For directories, contains all immediate children (files and subdirectories).
    /// For files, always `nil`.
    public let children: [FileNode]?

    public init(
        name: String,
        path: String,
        absolutePath: String,
        isDirectory: Bool,
        children: [FileNode]? = nil
    ) {
        self.name = name
        self.path = path
        self.absolutePath = absolutePath
        self.isDirectory = isDirectory
        self.children = children
    }

    enum CodingKeys: String, CodingKey {
        case name
        case path
        case absolutePath
        case isDirectory
        case children
    }
}
