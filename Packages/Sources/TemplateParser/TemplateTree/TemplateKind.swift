//
//  TemplateKind.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation

// MARK: - BaseTemplateKind (Newtype Wrapper)

/// A strongly-typed wrapper guaranteeing this is a *base* template kind.
///
/// This enforces that only base templates (where `isBaseTemplate == true`) can be
/// used as ancestors. The wrapper validates at construction time and during decoding.
///
/// ## Example
/// ```swift
/// // Type-safe ancestors - only base templates allowed
/// let ancestors: [BaseTemplateKind] = [
///     .applicationBase,
///     .crossPlatformBase,
///     .languageChoice
/// ]
///
/// // Invalid - caught at runtime with clear error
/// let invalid = BaseTemplateKind(.app)  // 💥 Precondition failure
/// ```
///
/// ## JSON Encoding
/// The wrapper is transparent during encoding/decoding - it encodes as the underlying
/// `TemplateKind` rawValue, so JSON remains unchanged.
///
/// ```json
/// {
///   "ancestors": ["com.apple.dt.unit.applicationBase", "com.apple.dt.unit.base"]
/// }
/// ```
public struct BaseTemplateKind: Codable, Sendable, Hashable {
    /// The underlying template kind.
    public let kind: TemplateKind

    /// Creates a base template kind with validation.
    ///
    /// - Parameter kind: The template kind to wrap.
    /// - Precondition: `kind.isBaseTemplate` must be `true`.
    public init(_ kind: TemplateKind) {
        precondition(
            kind.isBaseTemplate,
            "Invalid BaseTemplateKind: \(kind.rawValue) is NOT a base template."
        )
        self.kind = kind
    }

    /// Failable initializer for safe construction.
    ///
    /// Returns `nil` if the template kind is not a base template.
    ///
    /// ## Example
    /// ```swift
    /// if let baseKind = BaseTemplateKind(safe: .applicationBase) {
    ///     // Use baseKind
    /// }
    /// ```
    public init?(safe kind: TemplateKind) {
        guard kind.isBaseTemplate else { return nil }
        self.kind = kind
    }

    /// Convenience accessor for the underlying template kind.
    public var templateKind: TemplateKind { kind }

    /// Raw value of the underlying template kind.
    public var rawValue: String { kind.rawValue }

    /// Display name of the underlying template kind.
    public var displayName: String { kind.displayName }
}

// MARK: - Codable Conformance

extension BaseTemplateKind {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decoded = try container.decode(TemplateKind.self)

        guard decoded.isBaseTemplate else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Expected a base template kind, got: \(decoded.rawValue)"
            )
        }

        kind = decoded
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(kind)
    }
}

// MARK: - Static Base Template Accessors

extension BaseTemplateKind {
    // Core Base Templates
    public static let base = BaseTemplateKind(.base)
    public static let baseOptions = BaseTemplateKind(.baseOptions)
    public static let baseDefinitionsLanguage = BaseTemplateKind(.baseDefinitionsLanguage)
    public static let baseStorageType = BaseTemplateKind(.baseStorageType)
    public static let baseProjectSettings = BaseTemplateKind(.baseProjectSettings)
    public static let baseAppLifecycle = BaseTemplateKind(.baseAppLifecycle)
    public static let baseTestingSystem = BaseTemplateKind(.baseTestingSystem)
    public static let baseDefinitionsInfoPlist = BaseTemplateKind(.baseDefinitionsInfoPlist)
    public static let securityCriticalBase = BaseTemplateKind(.securityCriticalBase)

    // Platform Base Templates
    public static let crossPlatformBase = BaseTemplateKind(.crossPlatformBase)
    public static let iosAppBase = BaseTemplateKind(.iosAppBase)
    public static let macosAppBase = BaseTemplateKind(.macosAppBase)
    public static let tvosAppBase = BaseTemplateKind(.tvosAppBase)
    public static let multiplatformBase = BaseTemplateKind(.multiplatformBase)

    // Application Base Templates
    public static let applicationBase = BaseTemplateKind(.applicationBase)
    public static let swiftUIAppBase = BaseTemplateKind(.swiftUIAppBase)
    public static let swiftUIDocumentAppBase = BaseTemplateKind(.swiftUIDocumentAppBase)

    // Extension Base Templates
    public static let appExtensionBase = BaseTemplateKind(.appExtensionBase)
    public static let extensionKitExtensionBase = BaseTemplateKind(.extensionKitExtensionBase)
    public static let multiplatformExtensionKitExtensionBase = BaseTemplateKind(.multiplatformExtensionKitExtensionBase)
    public static let multiplatformAppExtensionBase = BaseTemplateKind(.multiplatformAppExtensionBase)

    // Test Bundle Base Templates
    public static let unitTestBundleBase = BaseTemplateKind(.unitTestBundleBase)
    public static let uiTestBundleBase = BaseTemplateKind(.uiTestBundleBase)
    public static let multiplatformUnitTestBundleBase = BaseTemplateKind(.multiplatformUnitTestBundleBase)
    public static let multiplatformUITestBundleBase = BaseTemplateKind(.multiplatformUITestBundleBase)
    public static let swiftUIAppUnitTestBundleBase = BaseTemplateKind(.swiftUIAppUnitTestBundleBase)
    public static let swiftUIAppUITestBundleBase = BaseTemplateKind(.swiftUIAppUITestBundleBase)

    // Other Base Templates
    public static let frameworkBase = BaseTemplateKind(.frameworkBase)
    public static let bundleBase = BaseTemplateKind(.bundleBase)
    public static let metalLibraryBase = BaseTemplateKind(.metalLibraryBase)
    public static let xpcServiceBase = BaseTemplateKind(.xpcServiceBase)

    // Utility Templates
    public static let storageType = BaseTemplateKind(.storageType)
    public static let storageTypeDocumentApp = BaseTemplateKind(.storageTypeDocumentApp)
    public static let languageChoice = BaseTemplateKind(.languageChoice)
    public static let testingSystem = BaseTemplateKind(.testingSystem)
}

/// High-level categorization of template types.
///
/// Groups templates into major categories for organization.
///
/// ## Example
/// ```swift
/// let category = TemplateCategory.projectTemplates
/// print(category.displayName)  // "Project Templates"
/// ```
public enum TemplateCategory: String, Hashable, CaseIterable {
    case projectTemplates = "Project Templates"
    case packageTemplates = "Package Templates"

    public var displayName: String {
        rawValue
    }
}

/// Xcode template kind system.
///
/// Templates are identified by their "Kind" field in TemplateInfo.plist.
/// There are two main kind types:
/// - `Xcode.Xcode3.ProjectTemplateUnitKind` - Traditional project templates
/// - `Xcode.IDESwiftPackageSupport.PackageTemplateKind` - Swift Package templates
///
/// Each template also has a unique identifier (e.g., `com.apple.dt.unit.multiPlatform.app`)
/// which is stored in the `Identifier` field.
///
/// ## Template Classification
///
/// Templates fall into three main classifications:
///
/// 1. **User-Selectable Templates** (53 templates)
///    - Directly available in Xcode's "New Project" or "New Package" dialog
///    - Examples: `app`, `framework`, `game`, `libraryPackage`, `swiftMacro`
///    - Properties: `isBaseTemplate == false`, `isUtilityTemplate == false`
///
/// 2. **Base Templates** (31 templates)
///    - Used for inheritance only, not directly selectable
///    - Provide reusable code structure, options, and variables
///    - Examples: `applicationBase`, `crossPlatformBase`, `unitTestBundleBase`
///    - Properties: `isBaseTemplate == true`, `isUtilityTemplate == false`
///
/// 3. **Utility Templates** (4 templates)
///    - Special base templates that provide option configurations
///    - Define reusable option sets for common choices
///    - Examples: `storageType`, `languageChoice`, `testingSystem`
///    - Properties: `isBaseTemplate == true`, `isUtilityTemplate == true`
///
/// ## Example
/// ```swift
/// // User-selectable template
/// let appKind = TemplateKind.app
/// print(appKind.displayName)           // "App"
/// print(appKind.rawValue)              // "com.apple.dt.unit.multiPlatform.app"
/// print(appKind.category)              // TemplateCategory.projectTemplates
/// print(appKind.isBaseTemplate)        // false
/// print(appKind.isUtilityTemplate)     // false
///
/// // Base template (for inheritance)
/// let baseKind = TemplateKind.applicationBase
/// print(baseKind.displayName)          // "Application Base"
/// print(baseKind.isBaseTemplate)       // true
/// print(baseKind.isUtilityTemplate)    // false
///
/// // Utility template (option configuration)
/// let utilityKind = TemplateKind.storageType
/// print(utilityKind.displayName)       // "Storage Type"
/// print(utilityKind.isBaseTemplate)    // true
/// print(utilityKind.isUtilityTemplate) // true
/// ```
///
/// ## Template Inheritance
/// Many templates inherit from base templates using the `Ancestors` field:
/// ```swift
/// // iOS Safari Extension App inherits from these base templates:
/// // - com.apple.dt.unit.applicationBase
/// // - com.apple.dt.unit.iosBase
/// // - com.apple.dt.unit.languageChoice.app.iOS
/// // - com.apple.dt.unit.appLifecycle.iOS
///
/// // This inheritance provides:
/// // 1. Common application options (from applicationBase)
/// // 2. iOS-specific configurations (from iosBase)
/// // 3. Language selection UI (from languageChoice.app.iOS)
/// // 4. App lifecycle options (from appLifecycle.iOS)
/// ```
///
/// ## Property Relationships
/// ```swift
/// // All utility templates are also base templates
/// assert(TemplateKind.allCases.filter { $0.isUtilityTemplate }.allSatisfy { $0.isBaseTemplate })
///
/// // User-selectable templates are neither base nor utility
/// let userTemplates = TemplateKind.allCases.filter { !$0.isBaseTemplate }
/// assert(userTemplates.allSatisfy { !$0.isUtilityTemplate })
///
/// // Package templates are never base or utility templates
/// let packageTemplates = TemplateKind.allCases.filter { $0.category == .packageTemplates }
/// assert(packageTemplates.allSatisfy { !$0.isBaseTemplate && !$0.isUtilityTemplate })
/// ```
///
/// - Note: Ancestor identifiers are stored as strings and resolved later using
///   `ProjectTemplateParser.loadWithAncestors()` which merges inherited options and nodes.
public enum TemplateKind: String, Hashable, CaseIterable, Codable, Sendable {
    // MARK: - Project Templates (Xcode.Xcode3.ProjectTemplateUnitKind)

    // Other
    case externalBuildSystem = "com.apple.dt.unit.externalBuildSystem"
    case aggregate = "com.apple.dt.unit.aggregate"
    case emptyProject = "com.apple.dt.unit.emptyProject"

    // Test
    case uiTestingBundle = "com.apple.dt.unit.multiPlatform.UITestingBundle"
    case unitTestingBundle = "com.apple.dt.unit.multiPlatform.unitTestBundle"

    // Application Extension
    case genericExtension = "com.apple.dt.unit.multiPlatform.generic-extension"
    case widgetExtension = "com.apple.dt.unit.multiPlatform.widget"
    case audioUnitExtension = "com.apple.dt.unit.audiounitextension.multiplatform"

    // Safari Extension Apps
    case iosSafariExtensionApp = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS"
    case safariExtensionApp = "com.apple.dt.unit.multiPlatform.appWithSafariExtension"
    case macosSafariExtensionApp = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.macOS"
    case sharedSafariExtensionApp = "com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared"

    // Safari Extensions
    case iosSafariExtension = "com.apple.dt.unit.multiPlatform.safariExtension.iOS"
    case macosSafariExtension = "com.apple.dt.unit.multiPlatform.safariExtension.macOS"
    case sharedSafariExtension = "com.apple.dt.unit.multiPlatform.safariExtension.shared"

    // Game - Main
    case game = "com.apple.dt.unit.crossPlatformGame"

    // Game - SceneKit
    case sceneKitGameShared = "com.apple.dt.unit.crossPlatformSceneKitGame_sharedComponent"
    case sceneKitGameIOS = "com.apple.dt.unit.crossPlatformSceneKitGame_iOSComponent"
    case sceneKitGameMacOS = "com.apple.dt.unit.crossPlatformSceneKitGame_OSXComponent"
    case sceneKitGameTvOS = "com.apple.dt.unit.crossPlatformSceneKitGame_tvOSComponent"

    // Game - SpriteKit
    case spriteKitGameShared = "com.apple.dt.unit.crossPlatformSpriteKitGame_sharedComponent"
    case spriteKitGameIOS = "com.apple.dt.unit.crossPlatformSpriteKitGame_iOSComponent"
    case spriteKitGameMacOS = "com.apple.dt.unit.crossPlatformSpriteKitGame_OSXComponent"
    case spriteKitGameTvOS = "com.apple.dt.unit.crossPlatformSpriteKitGame_tvOSComponent"

    // Game - Metal
    case metalGameShared = "com.apple.dt.unit.crossPlatformMetalGame_sharedComponent"
    case metalGameIOS = "com.apple.dt.unit.crossPlatformMetalGame_iOSComponent"
    case metalGameMacOS = "com.apple.dt.unit.crossPlatformMetalGame_OSXComponent"
    case metalGameTvOS = "com.apple.dt.unit.crossPlatformMetalGame_tvOSComponent"

    // Game - Metal 4
    case metal4GameShared = "com.apple.dt.unit.crossPlatformMetal4Game_sharedComponent"
    case metal4GameIOS = "com.apple.dt.unit.crossPlatformMetal4Game_iOSComponent"
    case metal4GameMacOS = "com.apple.dt.unit.crossPlatformMetal4Game_OSXComponent"
    case metal4GameTvOS = "com.apple.dt.unit.crossPlatformMetal4Game_tvOSComponent"

    // Game - RealityKit
    case realityKitGame = "com.apple.dt.unit.crossPlatformRealityKitGame"

    // visionOS
    case immersiveSpaceApp = "com.apple.dt.unit.crossPlatform.ImmersiveSpaceComponent"
    case visionOSApp = "com.apple.dt.unit.crossPlatform.visionOS.base"
    case compositorServices = "com.apple.dt.unit.crossPlatform.CompositorServicesComponent"

    // Apps - Main
    case documentApp = "com.apple.dt.unit.multiPlatform.app.document-based"
    case app = "com.apple.dt.unit.multiPlatform.app"
    case audioUnitExtensionApp = "com.apple.dt.unit.SwiftUIApplicationWithAudioUnitExtension.multiPlatform.app"

    // Apps - UI Testing
    case iosAppUITestBundle = "com.apple.dt.unit.multiPlatform.app.iOS.tests.ui"
    case macosAppUITestBundle = "com.apple.dt.unit.multiPlatform.app.macOS.tests.ui"
    case multiplatformSwiftUIAppUITestingBundle = "com.apple.dt.unit.multiPlatform.app.SwiftUI.tests.ui"

    // Apps - SwiftUI
    case multiplatformSwiftUIDocumentApp = "com.apple.dt.unit.multiPlatform.app.document-based.SwiftUI"
    case multiplatformSwiftUIAppTestingBundle = "com.apple.dt.unit.multiPlatform.app.SwiftUI.tests.unit"
    case multiplatformSwiftUIApp = "com.apple.dt.unit.multiPlatform.app.SwiftUI"

    // Entitlements
    case macosAppEntitlements = "com.apple.dt.unit.crossPlatformAppEntitlements_OSX"

    // Framework
    case framework = "com.apple.dt.unit.multiPlatform.framework"
    case frameworkTestingBundle = "com.apple.dt.unit.multiPlatform.frameworkUnitTestBundle"

    // Base Templates (used for inheritance only - not directly selectable)
    case base = "com.apple.dt.unit.base"
    case baseOptions = "com.apple.dt.unit.base_Options"
    case baseDefinitionsLanguage = "com.apple.dt.unit.base_DefinitionsLanguage"
    case baseStorageType = "com.apple.dt.unit.base_StorageType"
    case baseProjectSettings = "com.apple.dt.unit.base_ProjectSettings"
    case baseAppLifecycle = "com.apple.dt.unit.base_AppLifecycle"
    case baseTestingSystem = "com.apple.dt.unit.base_TestingSystem"
    case baseDefinitionsInfoPlist = "com.apple.dt.unit.base_DefinitionsInfoPlist"
    case securityCriticalBase = "com.apple.dt.unit.securityCriticalBase"

    // Platform Base Templates
    case crossPlatformBase = "com.apple.dt.unit.crossPlatformBase"
    case iosAppBase = "com.apple.dt.unit.crossPlatformAppBase_iOS"
    case macosAppBase = "com.apple.dt.unit.crossPlatformAppBase_OSX"
    case tvosAppBase = "com.apple.dt.unit.crossPlatformAppBase_tvOS"
    case multiplatformBase = "com.apple.dt.unit.multiPlatform.base"

    // Application Base Templates
    case applicationBase = "com.apple.dt.unit.applicationBase"
    case swiftUIAppBase = "com.apple.dt.unit.applicationBase.SwiftUI"
    case swiftUIDocumentAppBase = "com.apple.dt.unit.applicationBase.document-based.SwiftUI"

    // Extension Base Templates
    case appExtensionBase = "com.apple.dt.unit.appextensionbase"
    case extensionKitExtensionBase = "com.apple.dt.unit.extensionkit-extension"
    case multiplatformExtensionKitExtensionBase = "com.apple.dt.unit.multiPlatform.extensionkit-extension"
    case multiplatformAppExtensionBase = "com.apple.dt.unit.multiPlatform.nsappex.base"

    // Test Bundle Base Templates
    case unitTestBundleBase = "com.apple.dt.unit.unitTestBundleBase"
    case uiTestBundleBase = "com.apple.dt.unit.uiTestBundleBase"
    case multiplatformUnitTestBundleBase = "com.apple.dt.unit.multiPlatform.unitTestBundleBase"
    case multiplatformUITestBundleBase = "com.apple.dt.unit.multiPlatform.UITestBundleBase"
    case swiftUIAppUnitTestBundleBase = "com.apple.dt.unit.unitTestBundleBase.app.SwiftUI"
    case swiftUIAppUITestBundleBase = "com.apple.dt.unit.uiTestBundleBase.app.SwiftUI"

    // Other Base Templates
    case frameworkBase = "com.apple.dt.unit.frameworkBase"
    case bundleBase = "com.apple.dt.unit.bundleBase"
    case metalLibraryBase = "com.apple.dt.unit.metalLibrary.base"
    case xpcServiceBase = "com.apple.dt.unit.xpcservicebase"

    // Utility Templates (used for option configuration)
    case storageType = "com.apple.dt.unit.storageType"
    case storageTypeDocumentApp = "com.apple.dt.unit.storageType.document-app"
    case languageChoice = "com.apple.dt.unit.languageChoice"
    case testingSystem = "com.apple.dt.unit.testingSystem"

    // MARK: - Package Templates (Xcode.IDESwiftPackageSupport.PackageTemplateKind)

    case swiftMacro = "com.apple.dt.packageTemplate.SwiftMacro"
    case buildToolPlugin = "com.apple.dt.packageTemplate.BuildToolPlugin"
    case commandPlugin = "com.apple.dt.packageTemplate.CommandPlugin"
    case emptyPackage = "com.apple.dt.packageTemplate.Empty"
    case libraryPackage = "com.apple.dt.packageTemplate.Library"

    // MARK: - Properties

    /// Human-readable name for the template kind.
    ///
    /// Converts the template identifier into a user-friendly display name suitable
    /// for showing in UI elements like outlines, menus, or lists.
    ///
    /// ## Example
    /// ```swift
    /// TemplateKind.app.displayName
    /// // Returns: "App"
    ///
    /// TemplateKind.multiplatformSwiftUIDocumentApp.displayName
    /// // Returns: "Multiplatform SwiftUI Document App"
    ///
    /// TemplateKind.iosSafariExtensionApp.displayName
    /// // Returns: "iOS Safari Extension App"
    ///
    /// TemplateKind.applicationBase.displayName
    /// // Returns: "Application Base"
    ///
    /// TemplateKind.buildToolPlugin.displayName
    /// // Returns: "Build Tool Plug-in"
    /// ```
    ///
    /// - Note: Display names are human-readable and may contain spaces, capitalization,
    ///   and platform-specific formatting (e.g., "iOS", "macOS", "tvOS", "visionOS").
    public var displayName: String {
        switch self {
        // Other
        case .externalBuildSystem: return "External Build System"
        case .aggregate: return "Aggregate"
        case .emptyProject: return "Empty Project"
        // Test
        case .uiTestingBundle: return "UI Testing Bundle"
        case .unitTestingBundle: return "Unit Testing Bundle"
        // Application Extension
        case .genericExtension: return "Generic Extension"
        case .widgetExtension: return "Widget Extension"
        case .audioUnitExtension: return "Audio Unit Extension"
        // Safari Extension Apps
        case .iosSafariExtensionApp: return "iOS Safari Extension App"
        case .safariExtensionApp: return "Safari Extension App"
        case .macosSafariExtensionApp: return "macOS Safari Extension App"
        case .sharedSafariExtensionApp: return "Shared Safari Extension App"
        // Safari Extensions
        case .iosSafariExtension: return "iOS Safari Extension"
        case .macosSafariExtension: return "macOS Safari Extension"
        case .sharedSafariExtension: return "Shared Safari Extension"
        // Game
        case .game: return "Game"
        // Game - SceneKit
        case .sceneKitGameShared: return "SceneKit Game (Shared)"
        case .sceneKitGameIOS: return "SceneKit Game (iOS)"
        case .sceneKitGameMacOS: return "SceneKit Game (macOS)"
        case .sceneKitGameTvOS: return "SceneKit Game (tvOS)"
        // Game - SpriteKit
        case .spriteKitGameShared: return "SpriteKit Game (Shared)"
        case .spriteKitGameIOS: return "SpriteKit Game (iOS)"
        case .spriteKitGameMacOS: return "SpriteKit Game (macOS)"
        case .spriteKitGameTvOS: return "SpriteKit Game (tvOS)"
        // Game - Metal
        case .metalGameShared: return "Metal Game (Shared)"
        case .metalGameIOS: return "Metal Game (iOS)"
        case .metalGameMacOS: return "Metal Game (macOS)"
        case .metalGameTvOS: return "Metal Game (tvOS)"
        // Game - Metal 4
        case .metal4GameShared: return "Metal 4 Game (Shared)"
        case .metal4GameIOS: return "Metal 4 Game (iOS)"
        case .metal4GameMacOS: return "Metal 4 Game (macOS)"
        case .metal4GameTvOS: return "Metal 4 Game (tvOS)"
        // Game - RealityKit
        case .realityKitGame: return "RealityKit Game"
        // visionOS
        case .immersiveSpaceApp: return "Immersive Space App"
        case .visionOSApp: return "visionOS App"
        case .compositorServices: return "Compositor Services"
        // Apps - Main
        case .documentApp: return "Document App"
        case .app: return "App"
        case .audioUnitExtensionApp: return "Audio Unit Extension App"
        // Apps - UI Testing
        case .iosAppUITestBundle: return "iOS App UI Test Bundle"
        case .macosAppUITestBundle: return "macOS App UI Test Bundle"
        case .multiplatformSwiftUIAppUITestingBundle: return "Multiplatform SwiftUI App UI Testing Bundle"
        // Apps - SwiftUI
        case .multiplatformSwiftUIDocumentApp: return "Multiplatform SwiftUI Document App"
        case .multiplatformSwiftUIAppTestingBundle: return "Multiplatform SwiftUI App Testing Bundle"
        case .multiplatformSwiftUIApp: return "Multiplatform SwiftUI App"
        // Entitlements
        case .macosAppEntitlements: return "macOS App Entitlements"
        // Framework
        case .framework: return "Framework"
        case .frameworkTestingBundle: return "Framework Testing Bundle"
        // Base Templates
        case .base: return "Base"
        case .baseOptions: return "Base Options"
        case .baseDefinitionsLanguage: return "Base Definitions Language"
        case .baseStorageType: return "Base Storage Type"
        case .baseProjectSettings: return "Base Project Settings"
        case .baseAppLifecycle: return "Base App Lifecycle"
        case .baseTestingSystem: return "Base Testing System"
        case .baseDefinitionsInfoPlist: return "Base Definitions Info.plist"
        case .securityCriticalBase: return "Security Critical Base"
        // Platform Base Templates
        case .crossPlatformBase: return "Cross-Platform Base"
        case .iosAppBase: return "iOS App Base"
        case .macosAppBase: return "macOS App Base"
        case .tvosAppBase: return "tvOS App Base"
        case .multiplatformBase: return "Multiplatform Base"
        // Application Base Templates
        case .applicationBase: return "Application Base"
        case .swiftUIAppBase: return "SwiftUI App Base"
        case .swiftUIDocumentAppBase: return "SwiftUI Document App Base"
        // Extension Base Templates
        case .appExtensionBase: return "App Extension Base"
        case .extensionKitExtensionBase: return "ExtensionKit Extension Base"
        case .multiplatformExtensionKitExtensionBase: return "Multiplatform ExtensionKit Extension Base"
        case .multiplatformAppExtensionBase: return "Multiplatform App Extension Base"
        // Test Bundle Base Templates
        case .unitTestBundleBase: return "Unit Test Bundle Base"
        case .uiTestBundleBase: return "UI Test Bundle Base"
        case .multiplatformUnitTestBundleBase: return "Multiplatform Unit Test Bundle Base"
        case .multiplatformUITestBundleBase: return "Multiplatform UI Test Bundle Base"
        case .swiftUIAppUnitTestBundleBase: return "SwiftUI App Unit Test Bundle Base"
        case .swiftUIAppUITestBundleBase: return "SwiftUI App UI Test Bundle Base"
        // Other Base Templates
        case .frameworkBase: return "Framework Base"
        case .bundleBase: return "Bundle Base"
        case .metalLibraryBase: return "Metal Library Base"
        case .xpcServiceBase: return "XPC Service Base"
        // Utility Templates
        case .storageType: return "Storage Type"
        case .storageTypeDocumentApp: return "Storage Type Document App"
        case .languageChoice: return "Language Choice"
        case .testingSystem: return "Testing System"
        // Package Templates
        case .swiftMacro: return "Swift Macro"
        case .buildToolPlugin: return "Build Tool Plug-in"
        case .commandPlugin: return "Command Plug-in"
        case .emptyPackage: return "Empty Package"
        case .libraryPackage: return "Library Package"
        }
    }

    /// Returns the high-level category this template belongs to.
    ///
    /// Templates are organized into two main categories:
    /// - **Project Templates**: Traditional Xcode projects (apps, frameworks, games, extensions)
    /// - **Package Templates**: Swift Package Manager packages (libraries, macros, plugins)
    ///
    /// ## Example
    /// ```swift
    /// TemplateKind.app.category
    /// // Returns: TemplateCategory.projectTemplates
    ///
    /// TemplateKind.framework.category
    /// // Returns: TemplateCategory.projectTemplates
    ///
    /// TemplateKind.libraryPackage.category
    /// // Returns: TemplateCategory.packageTemplates
    ///
    /// TemplateKind.swiftMacro.category
    /// // Returns: TemplateCategory.packageTemplates
    ///
    /// TemplateKind.applicationBase.category
    /// // Returns: TemplateCategory.projectTemplates (base templates are project templates)
    /// ```
    ///
    /// - Note: All base templates and utility templates belong to the project templates category,
    ///   even though they are not directly user-selectable.
    public var category: TemplateCategory {
        switch self {
        case .swiftMacro, .buildToolPlugin, .commandPlugin, .emptyPackage, .libraryPackage:
            return .packageTemplates
        default:
            return .projectTemplates
        }
    }

    /// Returns `true` for templates that are used for inheritance only and not directly selectable by users.
    ///
    /// Base templates provide reusable options, variables, and nodes that other templates inherit from.
    /// They typically cannot be instantiated directly in Xcode's template selection dialog.
    ///
    /// ## Example
    /// ```swift
    /// TemplateKind.base.isBaseTemplate                 // true
    /// TemplateKind.applicationBase.isBaseTemplate      // true
    /// TemplateKind.app.isBaseTemplate                  // false (user-selectable)
    /// TemplateKind.framework.isBaseTemplate            // false (user-selectable)
    /// ```
    public var isBaseTemplate: Bool {
        switch self {
        // Core Base Templates
        case .base, .baseOptions, .baseDefinitionsLanguage, .baseStorageType,
             .baseProjectSettings, .baseAppLifecycle, .baseTestingSystem,
             .baseDefinitionsInfoPlist, .securityCriticalBase,
             // Platform Base Templates
             .crossPlatformBase, .iosAppBase, .macosAppBase, .tvosAppBase, .multiplatformBase,
             // Application Base Templates
             .applicationBase, .swiftUIAppBase, .swiftUIDocumentAppBase,
             // Extension Base Templates
             .appExtensionBase, .extensionKitExtensionBase,
             .multiplatformExtensionKitExtensionBase, .multiplatformAppExtensionBase,
             // Test Bundle Base Templates
             .unitTestBundleBase, .uiTestBundleBase,
             .multiplatformUnitTestBundleBase, .multiplatformUITestBundleBase,
             .swiftUIAppUnitTestBundleBase, .swiftUIAppUITestBundleBase,
             // Other Base Templates
             .frameworkBase, .bundleBase, .metalLibraryBase, .xpcServiceBase,
             // Utility Templates (used for option configuration)
             .storageType, .storageTypeDocumentApp, .languageChoice, .testingSystem:
            return true
        default:
            return false
        }
    }

    /// Returns `true` for utility templates that provide option configurations.
    ///
    /// Utility templates are special base templates that define reusable option sets
    /// for common configuration choices. They are referenced by other templates to
    /// provide standardized option UIs (storage type, language choice, testing system).
    ///
    /// ## Example
    /// ```swift
    /// TemplateKind.storageType.isUtilityTemplate
    /// // Returns: true
    /// // Purpose: Provides options for None/Core Data/SwiftData storage
    ///
    /// TemplateKind.languageChoice.isUtilityTemplate
    /// // Returns: true
    /// // Purpose: Provides options for Swift/Objective-C language selection
    ///
    /// TemplateKind.testingSystem.isUtilityTemplate
    /// // Returns: true
    /// // Purpose: Provides options for XCTest/Swift Testing framework selection
    ///
    /// TemplateKind.app.isUtilityTemplate
    /// // Returns: false (user-selectable template, not a utility)
    ///
    /// TemplateKind.applicationBase.isUtilityTemplate
    /// // Returns: false (base template, but not a utility)
    /// ```
    ///
    /// ## Utility Template Types
    /// - **storageType**: Storage options (None, Core Data, SwiftData)
    /// - **storageTypeDocumentApp**: Storage options specific to document-based apps
    /// - **languageChoice**: Programming language selection (Swift, Objective-C)
    /// - **testingSystem**: Testing framework selection (XCTest, Swift Testing)
    ///
    /// - Note: All utility templates are also base templates (`isBaseTemplate == true`),
    ///   but not all base templates are utility templates. Utility templates specifically
    ///   provide option configurations, while other base templates provide code structure.
    public var isUtilityTemplate: Bool {
        switch self {
        case .storageType, .storageTypeDocumentApp, .languageChoice, .testingSystem:
            return true
        default:
            return false
        }
    }
}

/// Template option types.
///
/// Defines the UI control type for template options in Xcode's template selection dialog.
///
/// ## Example
/// ```swift
/// // Popup menu for interface choice
/// let interfaceOption = OptionType.popup
/// print(interfaceOption.displayName)  // "Popup"
///
/// // Checkbox for "Include Tests"
/// let testsOption = OptionType.checkbox
/// print(testsOption.displayName)  // "Checkbox"
///
/// // Static value (computed, not user-selectable)
/// let bundleIdOption = OptionType.staticValue
/// print(bundleIdOption.rawValue)  // "static"
/// ```
///
/// ## Real-world Examples
/// - `.popup`: Interface (SwiftUI/UIKit), Storage (None/Core Data/SwiftData), Testing System
/// - `.checkbox`: Include Tests, Include UI Tests, Use Core Data, Host in CloudKit
/// - `.text`: Product Name, Organization Name, Build Tool Path, Subtype Code
/// - `.staticValue`: Bundle Identifier (computed from other values)
public enum OptionType: String, Hashable, Codable {
    case popup
    case checkbox
    case radio
    case text
    case staticValue = "static"

    public var displayName: String {
        switch self {
        case .popup: return "Popup"
        case .checkbox: return "Checkbox"
        case .radio: return "Radio"
        case .text: return "Text"
        case .staticValue: return "Static"
        }
    }
}
