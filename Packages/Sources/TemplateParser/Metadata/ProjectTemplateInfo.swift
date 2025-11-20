import Foundation
import TemplateModels

/// Apple platform types supported by Xcode templates.
///
/// ## Example
/// ```swift
/// let iosTemplate = TemplatePlatform.iOS
/// print(iosTemplate.displayName)  // "iOS"
///
/// let multiPlatform: [TemplatePlatform] = [.iOS, .macOS, .tvOS, .visionOS]
/// ```
public enum TemplatePlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case iOS
    case macOS
    case tvOS
    case watchOS
    case visionOS

    public var displayName: String {
        rawValue
    }
}

/// Project template metadata from TemplateInfo.plist.
///
/// Contains all metadata extracted from an Xcode project template's `TemplateInfo.plist` file.
/// Project templates use inheritance to share common configurations via the `ancestors` field.
///
/// ## Example
/// ```swift
/// // iOS Safari Extension App template metadata
/// let templateInfo = ProjectTemplateInfo(
///     kind: "Xcode.Xcode3.ProjectTemplateUnitKind",
///     identifier: "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS",
///     description: "This template builds an iOS app with a Safari web extension.",
///     ancestors: [
///         "com.apple.dt.unit.applicationBase",
///         "com.apple.dt.unit.iosBase",
///         "com.apple.dt.unit.languageChoice.app.iOS",
///         "com.apple.dt.unit.appLifecycle.iOS"
///     ],
///     concrete: true,
///     platforms: ["iOS"],
///     options: [...],  // Interface, Storage, Testing options
///     nodes: [...],    // File and folder structure
///     nameOfInitialFileForEditor: "ContentView.swift"
/// )
/// ```
///
/// ## Inheritance Resolution
/// ```swift
/// // Ancestors are resolved using ProjectTemplateParser.loadWithAncestors()
/// let parser = ProjectTemplateParser()
/// let resolved = try parser.loadWithAncestors(
///     templatePath: "/path/to/template.xctemplate",
///     allTemplates: templateRegistry
/// )
///
/// // The resolved template contains merged options and nodes from all ancestors
/// print(resolved.options.count)  // Includes options from all 4 ancestor templates
/// ```
///
/// - Note: Templates with `concrete == false` are base templates used only for inheritance.
///   User-selectable templates typically have `concrete == true` or `concrete == nil`.
public struct ProjectTemplateInfo: Codable, Sendable {
    /// Template kind identifying the specific template type.
    ///
    /// ## Example
    /// ```swift
    /// appTemplate.kind         // Kind.app
    /// frameworkTemplate.kind   // Kind.framework
    /// baseTemplate.kind        // Kind.applicationBase
    /// ```
    public let kind: Kind

    /// Unique template identifier derived from the template kind.
    ///
    /// This is the same as `kind.rawValue` and is used to reference templates
    /// from other templates' `ancestors` arrays.
    ///
    /// ## Example
    /// ```swift
    /// appTemplate.identifier  // "com.apple.dt.unit.multiPlatform.app"
    /// // Same as:
    /// appTemplate.kind.rawValue  // "com.apple.dt.unit.multiPlatform.app"
    /// ```
    public var identifier: String {
        kind.rawValue
    }

    /// Human-readable description shown in Xcode's template chooser.
    ///
    /// ## Example
    /// ```swift
    /// templateInfo.description
    /// // "This template builds a multiplatform app for iOS, macOS, tvOS, and visionOS."
    /// ```
    public let description: String?

    /// Array of ancestor template kinds for inheritance.
    ///
    /// Templates inherit options, variables, and nodes from their ancestors.
    /// Ancestors are processed in order, with later ancestors overriding earlier ones.
    ///
    /// ## Example
    /// ```swift
    /// // iOS App template inherits from multiple base templates
    /// templateInfo.ancestors
    /// // [
    /// //   .applicationBase,      // Common app structure
    /// //   .iosAppBase,           // iOS-specific config
    /// //   .languageChoice,       // Swift/Obj-C choice
    /// //   .baseAppLifecycle      // SwiftUI/UIKit choice
    /// // ]
    /// ```
    ///
    /// ## Inheritance Chain
    /// ```swift
    /// // Each ancestor can itself have ancestors, forming a chain:
    /// // App Template
    /// //   └─ .applicationBase
    /// //        └─ .base
    /// //             └─ .baseOptions
    /// //
    /// // Resolution merges all ancestors recursively:
    /// let resolved = try parser.loadWithAncestors(templatePath: path, allTemplates: registry)
    /// // resolved.options contains options from App + applicationBase + base + baseOptions
    /// ```
    ///
    /// ## Common Ancestor Types
    /// - **Structure Ancestors**: `.applicationBase`, `.frameworkBase`, `.bundleBase`
    ///   - Provide fundamental project structure and common options
    /// - **Platform Ancestors**: `.iosAppBase`, `.macosAppBase`, `.tvosAppBase`, `.crossPlatformBase`
    ///   - Add platform-specific configurations and settings
    /// - **Option Ancestors**: `.languageChoice`, `.storageType`, `.testingSystem`
    ///   - Provide standardized option UIs for common choices
    /// - **Lifecycle Ancestors**: `.baseAppLifecycle`, `.baseStorageType`
    ///   - Configure app architecture patterns (SwiftUI vs UIKit, Core Data vs SwiftData)
    ///
    /// Array of base template kinds for inheritance.
    ///
    /// Type-safe wrapper ensures only base templates can be used as ancestors.
    /// User-selectable templates cannot be inherited from.
    ///
    /// ## Example
    /// ```swift
    /// let info = ProjectTemplateInfo(
    ///     kind: .app,
    ///     ancestors: [
    ///         .applicationBase,
    ///         .crossPlatformBase,
    ///         .languageChoice
    ///     ]
    /// )
    /// ```
    ///
    /// - Note: Ancestor resolution happens via `ProjectTemplateParser.loadWithAncestors()`,
    ///   which merges options and nodes from all ancestors in the inheritance chain.
    ///
    /// - SeeAlso: `BaseTemplateKind` for the complete list of valid ancestor templates.
    public let ancestors: [BaseTemplateKind]?

    /// Whether this template can be instantiated directly (`true`) or is inheritance-only (`false`).
    ///
    /// ## Example
    /// ```swift
    /// appTemplate.concrete        // true or nil (user-selectable)
    /// baseTemplate.concrete       // false (inheritance-only)
    /// utilityTemplate.concrete    // false (provides options only)
    /// ```
    public let concrete: Bool?

    /// Supported platforms for this template.
    ///
    /// ## Example
    /// ```swift
    /// iosAppTemplate.platforms     // [.iOS]
    /// multiplatformTemplate.platforms  // [.iOS, .macOS, .tvOS, .visionOS]
    /// macosFramework.platforms     // [.macOS]
    /// ```
    public let platforms: [TemplatePlatform]?

    /// Template options shown in Xcode's template configuration UI.
    ///
    /// ## Example
    /// ```swift
    /// // Options inherited from ancestors are merged with template's own options
    /// templateInfo.options
    /// // [
    /// //   TemplateOption(identifier: "interfaceChoice", name: "Interface", ...),
    /// //   TemplateOption(identifier: "storageChoice", name: "Storage", ...),
    /// //   TemplateOption(identifier: "includeTests", name: "Include Tests", ...)
    /// // ]
    /// ```
    public let options: [TemplateOption]?

    /// Template nodes defining the file and folder structure.
    ///
    /// ## Example
    /// ```swift
    /// templateInfo.nodes
    /// // ["App.xcodeproj", "Sources", "Tests", "README.md"]
    /// ```
    public let nodes: [String]?

    /// Initial file to open in the editor after project creation.
    ///
    /// ## Example
    /// ```swift
    /// swiftUITemplate.nameOfInitialFileForEditor  // "ContentView.swift"
    /// uiKitTemplate.nameOfInitialFileForEditor    // "ViewController.swift"
    /// ```
    public let nameOfInitialFileForEditor: String?

    /// Complete file and directory structure within the template bundle.
    ///
    /// Represents all files and folders in the `.xctemplate` bundle, excluding
    /// `TemplateInfo.plist` (which is captured separately). Organized as a
    /// hierarchical tree with nested directories.
    ///
    /// - Important: **This field is NOT in Xcode's original template files.**
    ///   It is populated only when decoding from our extracted metadata JSON files
    ///   (generated by `TemplateGenerator.swift`). When parsing directly from Xcode's
    ///   template files (`.plist` or `.json` in `.xctemplate` bundles), this will be `nil`.
    ///
    /// ## Example
    /// ```swift
    /// // ❌ Parsing from Xcode's template files - fileStructure will be nil
    /// // (Whether TemplateInfo.plist or TemplateInfo.json from .xctemplate bundle)
    /// let plistData = try Data(contentsOf: URL(fileURLWithPath: "App.xctemplate/TemplateInfo.plist"))
    /// let fromPlist = try PropertyListDecoder().decode(ProjectTemplateInfo.self, from: plistData)
    /// print(fromPlist.fileStructure)  // nil - not in Xcode's template files
    ///
    /// // ✅ Decoding from our extracted metadata JSON - fileStructure is populated
    /// let extractedJSON = try Data(contentsOf: URL(fileURLWithPath: "_template_metadata.json"))
    /// let fromExtracted = try JSONDecoder().decode(ProjectTemplateInfo.self, from: extractedJSON)
    /// print(fromExtracted.fileStructure?.count)  // 10 - extracted file structure
    /// // [
    /// //   FileNode(name: "App.swift", path: "App.swift", isDirectory: false),
    /// //   FileNode(name: "ContentView.swift", path: "ContentView.swift", isDirectory: false),
    /// //   FileNode(
    /// //     name: "Assets.xcassets",
    /// //     path: "Assets.xcassets",
    /// //     isDirectory: true,
    /// //     children: [...]
    /// //   )
    /// // ]
    /// ```
    ///
    /// ## File Types Included
    /// - `.swift`, `.h`, `.m` source files
    /// - `.xcassets` asset catalogs (with nested colorsets, imagesets)
    /// - `.xcdatamodeld` Core Data models (with nested `.xcdatamodel`)
    /// - `.storyboard`, `.xib` interface files
    /// - `.entitlements` capability files
    /// - Configuration and resource files
    ///
    /// ## Templates Without Files
    /// Many templates (especially user-selectable ones like App, Game, Framework)
    /// only contain a `TemplateInfo.plist` with inheritance configuration.
    /// These have an empty `fileStructure` array in extracted metadata and
    /// inherit files from their `ancestors`.
    ///
    /// ## Data Sources
    /// ```swift
    /// // 1. From Xcode's template files (plist or json in .xctemplate bundle)
    /// let parser = ProjectTemplateParser()
    /// let info = try parser.parse(plistPath: "App.xctemplate/TemplateInfo.plist")
    /// // info.fileStructure == nil (field doesn't exist in Xcode's files)
    ///
    /// // 2. From our extracted metadata JSON (_template_metadata.json)
    /// let extractedData = try Data(contentsOf: URL(fileURLWithPath: "_template_metadata.json"))
    /// let metadata = try JSONDecoder().decode(ProjectTemplateInfo.self, from: extractedData)
    /// // metadata.fileStructure contains complete file tree (our addition)
    /// ```
    ///
    /// - Note: Base templates typically contain the actual source files,
    ///   while user-selectable templates primarily define inheritance chains.
    ///
    /// - SeeAlso: `FileNode` for the structure of individual file/directory nodes.
    public let fileStructure: [FileNode]?

    enum CodingKeys: String, CodingKey {
        case kind = "Identifier" // Decode from Identifier field which maps to Kind enum
        case description = "Description"
        case ancestors = "Ancestors"
        case concrete = "Concrete"
        case platforms = "Platforms"
        case options = "Options"
        case nodes = "Nodes"
        case nameOfInitialFileForEditor = "NameOfInitialFileForEditor"
        case fileStructure = "file_structure" // From extracted JSON metadata
    }
}

/// Template option from Options array
public struct TemplateOption: Codable, Sendable {
    public let identifier: String?
    public let name: String?
    public let description: String?
    public let type: String?
    public let `default`: String?
    public let override: String?
    public let values: [String]?
    public let required: Bool?
    public let notPersisted: Bool?
    public let units: [String: ParserOptionUnit]?

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case description = "Description"
        case type = "Type"
        case `default` = "Default"
        case override = "Override"
        case values = "Values"
        case required = "Required"
        case notPersisted = "NotPersisted"
        case units = "Units"
    }
}

/// Unit within an option (for conditional generation)
public struct ParserOptionUnit: Codable, Sendable {
    public let components: [ParserComponent]?
    public let nodes: [String]?

    enum CodingKeys: String, CodingKey {
        case components = "Components"
        case nodes = "Nodes"
    }
}

/// Component within a unit
public struct ParserComponent: Codable, Sendable {
    public let identifier: String?
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
    }
}
