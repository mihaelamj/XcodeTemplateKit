//
//  Metadata.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

// MARK: - JSON Codable Types

/// Template inventory from `TemplateOptionsExtractor` output.
///
/// Contains all discovered templates with their metadata.
///
/// ## Example JSON
/// ```json
/// {
///   "generatedAt": "2025-11-17T16:38:34Z",
///   "totalTemplates": 88,
///   "totalCombinations": 176,
///   "templates": [...]
/// }
/// ```
public struct Inventory: Codable, Sendable {
    public let generatedAt: String
    public let templates: [Metadata]
    public let totalTemplates: Int
    public let totalCombinations: Int

    public init(
        generatedAt: String,
        templates: [Metadata],
        totalTemplates: Int,
        totalCombinations: Int
    ) {
        self.generatedAt = generatedAt
        self.templates = templates
        self.totalTemplates = totalTemplates
        self.totalCombinations = totalCombinations
    }
}

// MARK: - Template Field Enums

/// Build phase type for file templates.
///
/// Specifies how files created from this template should be handled in build phases.
/// Appears in 16 templates.
public enum BuildableType: String, Codable, Hashable, Sendable {
    case none = "None"
    case test = "Test"
    case hidden = "Hidden"
}

/// Swift Package type for package templates.
///
/// Specifies the type of Swift Package to create.
/// Appears in 5 templates.
public enum PackageType: Codable, Hashable, Sendable {
    case swiftMacro
    case library
    case empty
    case commandPlugin
    case buildToolPlugin
    case unknown(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = PackageType(rawValue: rawValue)
    }

    public init(rawValue: String) {
        switch rawValue {
        case "swift-macro": self = .swiftMacro
        case "library": self = .library
        case "empty": self = .empty
        case "command-plugin": self = .commandPlugin
        case "build-tool-plugin": self = .buildToolPlugin
        default: self = .unknown(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .swiftMacro: return "swift-macro"
        case .library: return "library"
        case .empty: return "empty"
        case .commandPlugin: return "command-plugin"
        case .buildToolPlugin: return "build-tool-plugin"
        case .unknown(let value): return value
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

/// Image source type indicating how template icon should be resolved.
///
/// Specifies whether the image comes from a file, system symbol, bundle, etc.
/// Appears in 59 templates.
public enum ImageSourceType: String, Codable, Hashable, Sendable {
    case fileTypeIcon = "FileTypeIcon"
    case systemSymbol = "SystemSymbolName"
    case bundleImage = "BundleImageName"
    case bundleIdentifier = "BundleIdentifier"
}

/// Project configuration type for template settings.
///
/// Specifies the type of project configuration settings included.
/// Appears in 10 templates.
public enum ProjectConfiguration: String, Codable, Hashable, Sendable {
    case configurations = "Configurations"
    case sharedSettings = "SharedSettings"
}

/// Boolean format used in property lists.
///
/// Xcode templates use two different boolean serialization formats:
/// - **Objective-C format**: String-based "YES" and "NO" (legacy Objective-C convention)
/// - **Swift format**: XML boolean `<true/>` and `<false/>` (modern property list standard)
///
/// ## Usage in Templates
///
/// **Objective-C format** is used by:
/// - `HiddenFromChooser` and `HiddenFromLibrary` (legacy template visibility flags)
/// - All Xcode build settings in Options/Definitions dictionaries (e.g., ENABLE_TESTABILITY)
///
/// **Swift format** is used by:
/// - Modern template metadata fields: `Concrete`, `LocalizedByDefault`, `ProjectOnly`,
///   `SupportsSwiftPackage`, `SuppressTopLevelGroup`, `TargetOnly`
///
/// ## Template Creation
///
/// When writing templates, you must use the correct format:
/// ```xml
/// <!-- Objective-C format -->
/// <key>HiddenFromChooser</key>
/// <string>YES</string>
///
/// <!-- Swift format -->
/// <key>Concrete</key>
/// <true/>
/// ```
///
/// See `BooleanPropertyFormats.md` for complete documentation.
public enum BooleanFormat: Hashable, Sendable {
    /// Objective-C boolean format using YES/NO strings.
    ///
    /// Used for legacy template properties and all Xcode build settings.
    /// Serializes as `<string>YES</string>` or `<string>NO</string>`.
    case objectiveCBoolean(Bool)

    /// Swift boolean format using true/false XML booleans.
    ///
    /// Used for modern template metadata properties.
    /// Serializes as `<true/>` or `<false/>`.
    case swiftBoolean(Bool)

    /// The underlying boolean value.
    public var boolValue: Bool {
        switch self {
        case .objectiveCBoolean(let value), .swiftBoolean(let value):
            return value
        }
    }

    /// Create from a string value (YES/NO).
    ///
    /// - Parameter string: "YES" or "NO" string
    /// - Returns: `.objectiveCBoolean` if valid, nil otherwise
    public static func fromObjectiveCString(_ string: String) -> BooleanFormat? {
        switch string {
        case "YES": return .objectiveCBoolean(true)
        case "NO": return .objectiveCBoolean(false)
        default: return nil
        }
    }

    /// Create from a Swift Bool value.
    ///
    /// - Parameter value: Boolean value
    /// - Returns: `.swiftBoolean` wrapping the value
    public static func fromSwiftBool(_ value: Bool) -> BooleanFormat {
        .swiftBoolean(value)
    }

    /// Serialize to Objective-C string representation (YES/NO).
    ///
    /// Use this when writing HiddenFromChooser, HiddenFromLibrary, or build settings to plists.
    ///
    /// - Returns: "YES"/"NO" for Objective-C format, nil for Swift format
    public func toObjectiveCString() -> String? {
        guard case .objectiveCBoolean(let value) = self else { return nil }
        return value ? "YES" : "NO"
    }

    /// Serialize to property list value for PropertyListSerialization.
    ///
    /// Use this when writing boolean values to plist dictionaries before serialization.
    ///
    /// - Returns: String ("YES"/"NO") for Objective-C format, Bool (true/false) for Swift format
    ///
    /// ## Example
    /// ```swift
    /// var plist: [String: Any] = [:]
    ///
    /// // Objective-C boolean
    /// let hidden = BooleanFormat.objectiveCBoolean(true)
    /// plist["HiddenFromChooser"] = hidden.toPropertyListValue()  // "YES"
    ///
    /// // Swift boolean
    /// let concrete = BooleanFormat.swiftBoolean(true)
    /// plist["Concrete"] = concrete.toPropertyListValue()  // true
    /// ```
    public func toPropertyListValue() -> Any {
        switch self {
        case .objectiveCBoolean(let value):
            return value ? "YES" : "NO"
        case .swiftBoolean(let value):
            return value
        }
    }
}

/// Metadata for a single template from JSON.
///
/// Extracted from a `.xctemplate` bundle's `TemplateInfo.plist`.
///
/// ## Example JSON
/// ```json
/// {
///   "name": "iOS Safari Extension App",
///   "path": "/Applications/Xcode.app/.../iOS Safari Extension App.xctemplate",
///   "kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
///   "identifier": "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS",
///   "ancestors": [
///     "com.apple.dt.unit.applicationBase",
///     "com.apple.dt.unit.iosBase",
///     "com.apple.dt.unit.languageChoice.app.iOS",
///     "com.apple.dt.unit.appLifecycle.iOS"
///   ],
///   "options": [...],
///   "totalCombinations": 1
/// }
/// ```
///
/// - Note: `ancestors` contains template identifier strings that reference parent templates.
///   These are resolved later using `ProjectTemplateParser.loadWithAncestors()`.
public struct Metadata: Codable, Identifiable, Hashable, Sendable {
    public let id: String // Use path as unique ID
    public let name: String
    public let path: String
    public let kind: Kind
    public let ancestors: [Kind]?
    public let options: [Option]
    public let totalCombinations: Int
    public let fileStructure: [FileNode]?

    /// Detailed description of what this template creates.
    ///
    /// Example: "This template creates a multi-platform SwiftUI application."
    /// Appears in 69 of 146 templates.
    public let description: String?

    // MARK: - Simple String Fields

    /// Target association specification ID. Appears in 5 templates.
    public let associatedTargetSpecification: String?

    /// Build phase type for file templates. Appears in 16 templates.
    public let buildableType: BuildableType?

    /// Default filename for the created file. Appears in 69 templates.
    public let defaultCompletionName: String?

    /// UI visibility flag. Appears in 9 templates.
    public let hiddenFromChooser: Bool?

    /// Library visibility flag. Appears in 9 templates.
    public let hiddenFromLibrary: Bool?

    /// Icon filename for template. Appears in 5 templates.
    public let icon: String?

    /// Image asset name. Appears in 59 templates.
    public let image: ImageSourceType?

    /// Primary template file path. Appears in 47 templates.
    public let mainTemplateFile: String?

    /// Display name override. Appears in 9 templates.
    public let templateName: String?

    /// Initial file to open in editor. Appears in 8 templates.
    public let nameOfInitialFileForEditor: String?

    /// Swift Package type. Appears in 5 templates.
    public let packageType: PackageType?

    /// Project configuration. Appears in 10 templates.
    public let project: ProjectConfiguration?

    /// Template summary text. Prevalence unknown.
    public let summary: String?

    // MARK: - Boolean Fields

    /// Whether template is concrete (not abstract). Appears in 17 templates.
    public let concrete: Bool?

    /// Whether template is localized by default. Appears in 2 templates.
    public let localizedByDefault: Bool?

    /// Whether template is project-only. Appears in 1 template.
    public let projectOnly: Bool?

    /// Whether template supports Swift Package. Appears in 25 templates.
    public let supportsSwiftPackage: Bool?

    /// Whether to suppress top-level group. Appears in 3 templates.
    public let suppressTopLevelGroup: Bool?

    /// Whether template is target-only. Appears in 7 templates.
    public let targetOnly: Bool?

    // MARK: - Integer Fields

    /// UI sort order. Appears in 41 templates.
    public let sortOrder: Int?

    // MARK: - Array Fields

    /// Allowed UTI types for file templates. Appears in 26 templates.
    public let allowedTypes: [UniformTypeIdentifier]?

    /// Node identifiers for template. Appears in 40 templates.
    public let nodes: [String]?

    /// Platform identifiers. Appears in 73 templates.
    public let platforms: [Platform]?

    /// Template title. Appears in 6 templates.
    public let title: String?

    // MARK: - Complex Dictionary Fields (Stored as Data)

    /// Component configurations. Appears in 2 templates.
    public let components: Components?

    /// Target configurations. Appears in 71 templates.
    public let targets: Targets?

    /// Template definitions for code generation. Appears in 28 templates.
    public let definitions: Definitions?

    /// Option constraint rules. Appears in 8 templates.
    public let optionConstraints: OptionConstraints?

    /// Original raw content from TemplateInfo.plist.
    ///
    /// Contains the raw text as it appears on disk,
    /// preserving the original formatting and comments.
    public let rawContent: String?

    /// The format type of the raw content.
    ///
    /// Can be "xml", "json", or "openstep" (ASCII plist format).
    public let rawContentType: String?

    /// Template identifier derived from kind.
    public var identifier: String {
        kind.rawValue
    }

    /// Initialize with parsed values
    public init(
        name: String,
        path: String,
        kind: Kind,
        ancestors: [Kind]? = nil,
        options: [Option] = [],
        totalCombinations: Int = 1,
        fileStructure: [FileNode]? = nil,
        description: String? = nil,
        associatedTargetSpecification: String? = nil,
        buildableType: BuildableType? = nil,
        defaultCompletionName: String? = nil,
        hiddenFromChooser: Bool? = nil,
        hiddenFromLibrary: Bool? = nil,
        icon: String? = nil,
        image: ImageSourceType? = nil,
        mainTemplateFile: String? = nil,
        templateName: String? = nil,
        nameOfInitialFileForEditor: String? = nil,
        packageType: PackageType? = nil,
        project: ProjectConfiguration? = nil,
        summary: String? = nil,
        concrete: Bool? = nil,
        localizedByDefault: Bool? = nil,
        projectOnly: Bool? = nil,
        supportsSwiftPackage: Bool? = nil,
        suppressTopLevelGroup: Bool? = nil,
        targetOnly: Bool? = nil,
        sortOrder: Int? = nil,
        allowedTypes: [UniformTypeIdentifier]? = nil,
        nodes: [String]? = nil,
        platforms: [Platform]? = nil,
        title: String? = nil,
        components: Components? = nil,
        targets: Targets? = nil,
        definitions: Definitions? = nil,
        optionConstraints: OptionConstraints? = nil,
        rawContent: String? = nil,
        rawContentType: String? = nil
    ) {
        self.name = name
        self.path = path
        self.kind = kind
        self.ancestors = ancestors
        self.options = options
        self.totalCombinations = totalCombinations
        self.fileStructure = fileStructure
        self.description = description
        self.associatedTargetSpecification = associatedTargetSpecification
        self.buildableType = buildableType
        self.defaultCompletionName = defaultCompletionName
        self.hiddenFromChooser = hiddenFromChooser
        self.hiddenFromLibrary = hiddenFromLibrary
        self.icon = icon
        self.image = image
        self.mainTemplateFile = mainTemplateFile
        self.templateName = templateName
        self.nameOfInitialFileForEditor = nameOfInitialFileForEditor
        self.packageType = packageType
        self.project = project
        self.summary = summary
        self.concrete = concrete
        self.localizedByDefault = localizedByDefault
        self.projectOnly = projectOnly
        self.supportsSwiftPackage = supportsSwiftPackage
        self.suppressTopLevelGroup = suppressTopLevelGroup
        self.targetOnly = targetOnly
        self.sortOrder = sortOrder
        self.allowedTypes = allowedTypes
        self.nodes = nodes
        self.platforms = platforms
        self.title = title
        self.components = components
        self.targets = targets
        self.definitions = definitions
        self.optionConstraints = optionConstraints
        self.rawContent = rawContent
        self.rawContentType = rawContentType
        id = path
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)

        // Try "path" first, fall back to "source_path"
        if let pathValue = try? container.decode(String.self, forKey: .path) {
            path = pathValue
        } else {
            path = try container.decode(String.self, forKey: .sourcePath)
        }

        kind = try container.decode(Kind.self, forKey: .kind)
        ancestors = try container.decodeIfPresent([Kind].self, forKey: .ancestors)
        options = try container.decodeIfPresent([Option].self, forKey: .options) ?? []
        totalCombinations = try container.decodeIfPresent(Int.self, forKey: .totalCombinations) ?? 1
        fileStructure = try container.decodeIfPresent([FileNode].self, forKey: .fileStructure)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        associatedTargetSpecification = try container.decodeIfPresent(String.self, forKey: .associatedTargetSpecification)
        buildableType = try container.decodeIfPresent(BuildableType.self, forKey: .buildableType)
        defaultCompletionName = try container.decodeIfPresent(String.self, forKey: .defaultCompletionName)
        hiddenFromChooser = try container.decodeIfPresent(Bool.self, forKey: .hiddenFromChooser)
        hiddenFromLibrary = try container.decodeIfPresent(Bool.self, forKey: .hiddenFromLibrary)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
        image = try container.decodeIfPresent(ImageSourceType.self, forKey: .image)
        mainTemplateFile = try container.decodeIfPresent(String.self, forKey: .mainTemplateFile)
        templateName = try container.decodeIfPresent(String.self, forKey: .templateName)
        nameOfInitialFileForEditor = try container.decodeIfPresent(String.self, forKey: .nameOfInitialFileForEditor)
        packageType = try container.decodeIfPresent(PackageType.self, forKey: .packageType)
        project = try container.decodeIfPresent(ProjectConfiguration.self, forKey: .project)
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        concrete = try container.decodeIfPresent(Bool.self, forKey: .concrete)
        localizedByDefault = try container.decodeIfPresent(Bool.self, forKey: .localizedByDefault)
        projectOnly = try container.decodeIfPresent(Bool.self, forKey: .projectOnly)
        supportsSwiftPackage = try container.decodeIfPresent(Bool.self, forKey: .supportsSwiftPackage)
        suppressTopLevelGroup = try container.decodeIfPresent(Bool.self, forKey: .suppressTopLevelGroup)
        targetOnly = try container.decodeIfPresent(Bool.self, forKey: .targetOnly)
        sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder)
        allowedTypes = try container.decodeIfPresent([UniformTypeIdentifier].self, forKey: .allowedTypes)
        nodes = try container.decodeIfPresent([String].self, forKey: .nodes)
        platforms = try container.decodeIfPresent([Platform].self, forKey: .platforms)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        components = try container.decodeIfPresent(Components.self, forKey: .components)
        targets = try container.decodeIfPresent(Targets.self, forKey: .targets)
        definitions = try container.decodeIfPresent(Definitions.self, forKey: .definitions)
        optionConstraints = try container.decodeIfPresent(OptionConstraints.self, forKey: .optionConstraints)
        rawContent = try container.decodeIfPresent(String.self, forKey: .rawContent)
        rawContentType = try container.decodeIfPresent(String.self, forKey: .rawContentType)
        id = path // Use path as unique ID
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(path, forKey: .path)
        try container.encode(kind, forKey: .kind)
        try container.encodeIfPresent(ancestors, forKey: .ancestors)
        try container.encode(options, forKey: .options)
        try container.encode(totalCombinations, forKey: .totalCombinations)
        try container.encodeIfPresent(fileStructure, forKey: .fileStructure)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(associatedTargetSpecification, forKey: .associatedTargetSpecification)
        try container.encodeIfPresent(buildableType, forKey: .buildableType)
        try container.encodeIfPresent(defaultCompletionName, forKey: .defaultCompletionName)
        try container.encodeIfPresent(hiddenFromChooser, forKey: .hiddenFromChooser)
        try container.encodeIfPresent(hiddenFromLibrary, forKey: .hiddenFromLibrary)
        try container.encodeIfPresent(icon, forKey: .icon)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(mainTemplateFile, forKey: .mainTemplateFile)
        try container.encodeIfPresent(templateName, forKey: .templateName)
        try container.encodeIfPresent(nameOfInitialFileForEditor, forKey: .nameOfInitialFileForEditor)
        try container.encodeIfPresent(packageType, forKey: .packageType)
        try container.encodeIfPresent(project, forKey: .project)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(concrete, forKey: .concrete)
        try container.encodeIfPresent(localizedByDefault, forKey: .localizedByDefault)
        try container.encodeIfPresent(projectOnly, forKey: .projectOnly)
        try container.encodeIfPresent(supportsSwiftPackage, forKey: .supportsSwiftPackage)
        try container.encodeIfPresent(suppressTopLevelGroup, forKey: .suppressTopLevelGroup)
        try container.encodeIfPresent(targetOnly, forKey: .targetOnly)
        try container.encodeIfPresent(sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(allowedTypes, forKey: .allowedTypes)
        try container.encodeIfPresent(nodes, forKey: .nodes)
        try container.encodeIfPresent(platforms, forKey: .platforms)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(components, forKey: .components)
        try container.encodeIfPresent(targets, forKey: .targets)
        try container.encodeIfPresent(definitions, forKey: .definitions)
        try container.encodeIfPresent(optionConstraints, forKey: .optionConstraints)
        try container.encodeIfPresent(rawContent, forKey: .rawContent)
        try container.encodeIfPresent(rawContentType, forKey: .rawContentType)
    }

    enum CodingKeys: String, CodingKey {
        case name
        case path
        case sourcePath = "source_path"
        case kind = "identifier" // Decode from "identifier" field - the unique template identifier
        case ancestors
        case options
        case totalCombinations
        case fileStructure = "file_structure"
        case description
        case associatedTargetSpecification
        case buildableType
        case defaultCompletionName
        case hiddenFromChooser
        case hiddenFromLibrary
        case icon
        case image
        case mainTemplateFile
        case templateName
        case nameOfInitialFileForEditor
        case packageType
        case project
        case summary
        case concrete
        case localizedByDefault
        case projectOnly
        case supportsSwiftPackage
        case suppressTopLevelGroup
        case targetOnly
        case sortOrder
        case allowedTypes
        case nodes
        case platforms
        case title
        case components
        case targets
        case definitions
        case optionConstraints
        case rawContent = "raw_content"
        case rawContentType = "raw_content_type"
    }
}
