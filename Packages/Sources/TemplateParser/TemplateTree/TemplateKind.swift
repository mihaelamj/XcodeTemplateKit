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
    case fileTemplates = "File Templates"
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
///
/// ## SwiftLint Exceptions
///
/// This file exceeds normal size limits because it catalogs all 158+ Xcode template kinds:
/// - **file_length**: Required to map all Apple template identifiers (Project, File, Package templates)
/// - **type_body_length**: Enum needs 158+ cases plus computed properties for complete coverage
///
/// Splitting this enum would break type safety and make template kind handling more complex.
/// The large size is intentional and necessary for comprehensive Xcode template support.
// swiftlint:disable file_length
// swiftlint:disable:next type_body_length
public enum TemplateKind: Hashable, Codable, Sendable {
    // MARK: - Unknown/Uncatalogued Templates

    case unknown(String) // Preserves the raw value for analysis

    // MARK: - Project Templates (Xcode.Xcode3.ProjectTemplateUnitKind)

    // Other
    case externalBuildSystem
    case aggregate
    case emptyProject

    // Test
    case uiTestingBundle
    case unitTestingBundle

    // Application Extension
    case genericExtension
    case widgetExtension
    case audioUnitExtension

    // Safari Extension Apps
    case iosSafariExtensionApp
    case safariExtensionApp
    case macosSafariExtensionApp
    case sharedSafariExtensionApp

    // Safari Extensions
    case iosSafariExtension
    case macosSafariExtension
    case sharedSafariExtension

    // Game - Main
    case game

    // Game - SceneKit
    case sceneKitGameShared
    case sceneKitGameIOS
    case sceneKitGameMacOS
    case sceneKitGameTvOS

    // Game - SpriteKit
    case spriteKitGameShared
    case spriteKitGameIOS
    case spriteKitGameMacOS
    case spriteKitGameTvOS

    // Game - Metal
    case metalGameShared
    case metalGameIOS
    case metalGameMacOS
    case metalGameTvOS

    // Game - Metal 4
    case metal4GameShared
    case metal4GameIOS
    case metal4GameMacOS
    case metal4GameTvOS

    // Game - RealityKit
    case realityKitGame

    // visionOS
    case immersiveSpaceApp
    case visionOSApp
    case compositorServices

    // Apps - Main
    case documentApp
    case app
    case audioUnitExtensionApp

    // Apps - UI Testing
    case iosAppUITestBundle
    case macosAppUITestBundle
    case multiplatformSwiftUIAppUITestingBundle

    // Apps - SwiftUI
    case multiplatformSwiftUIDocumentApp
    case multiplatformSwiftUIAppTestingBundle
    case multiplatformSwiftUIApp

    // Entitlements
    case macosAppEntitlements

    // Framework
    case framework
    case frameworkTestingBundle

    // Base Templates (used for inheritance only - not directly selectable)
    case base
    case baseOptions
    case baseDefinitionsLanguage
    case baseStorageType
    case baseProjectSettings
    case baseAppLifecycle
    case baseTestingSystem
    case baseDefinitionsInfoPlist
    case securityCriticalBase

    // Platform Base Templates
    case crossPlatformBase
    case iosAppBase
    case macosAppBase
    case tvosAppBase
    case multiplatformBase

    // Application Base Templates
    case applicationBase
    case swiftUIAppBase
    case swiftUIDocumentAppBase

    // Extension Base Templates
    case appExtensionBase
    case extensionKitExtensionBase
    case multiplatformExtensionKitExtensionBase
    case multiplatformAppExtensionBase

    // Test Bundle Base Templates
    case unitTestBundleBase
    case uiTestBundleBase
    case multiplatformUnitTestBundleBase
    case multiplatformUITestBundleBase
    case swiftUIAppUnitTestBundleBase
    case swiftUIAppUITestBundleBase

    // Other Base Templates
    case frameworkBase
    case bundleBase
    case metalLibraryBase
    case xpcServiceBase

    // Utility Templates (used for option configuration)
    case storageType
    case storageTypeDocumentApp
    case languageChoice
    case testingSystem

    // iOS-specific Base Templates
    case iosAppLifecycle
    case iosAppExtensionBase
    case iosBase
    case iosBaseDefinitions
    case iosUITestBundleBase
    case iosLanguageChoice

    // macOS-specific Base Templates
    case macOSAppExtensionBase
    case macOSBase
    case macOSBaseDefinitions
    case macOSUITestBundleBase

    // tvOS-specific Base Templates
    case tvOSBaseDefinitions

    // MARK: - File Templates

    // File Templates - Source Files
    case fileTemplateSwiftFile
    case fileTemplateObjectiveCFile
    case fileTemplateCFile // Also represents C++ File (same identifier)
    case fileTemplateHeaderFile
    case fileTemplateMetalFile
    case fileTemplateAssemblyFile
    case fileTemplateCLIPSFile

    // File Templates - Swift/SwiftUI
    case fileTemplateSwiftUIView
    case fileTemplatePackageSwiftFile
    case fileTemplateSourcesFolderSwiftFile

    // File Templates - Testing
    case fileTemplateSwiftTestingUnitTest
    case fileTemplateXCTestUnitTest
    case fileTemplateXCTestUITest
    case fileTemplatePackageTestCase
    case fileTemplateTestPlan

    // File Templates - UI/Scene
    case fileTemplateStoryboard
    case fileTemplateView
    case fileTemplateWindow
    case fileTemplateMainMenu
    case fileTemplateApplication

    // File Templates - SceneKit
    case fileTemplateSceneKitSceneFile
    case fileTemplateSceneKitAssetCatalog
    case fileTemplateSceneKitAssetCache

    // File Templates - SpriteKit
    case fileTemplateSpriteKitScene
    case fileTemplateSpriteKitAction
    case fileTemplateSpriteKitParticleFile
    case fileTemplateSpriteKitTileSet

    // File Templates - Assets/Resources
    case fileTemplateAssetCatalog
    case fileTemplatePropertyList
    case fileTemplateStringsFileLegacy
    case fileTemplateStringsdictFileLegacy
    /// Touch Alternatives Property List template.
    case fileTemplateTouchAlternativesPropertyList

    // File Templates - Documentation
    case fileTemplateDocumentationCatalog
    case fileTemplateArticleFile
    case fileTemplateTutorialFile
    case fileTemplateTutorialTableOfContentsFile
    case fileTemplateMarkdownFile
    case fileTemplateRTFFile

    // File Templates - Configuration
    case fileTemplateConfigurationSettingsFile
    case fileTemplateModuleMap
    case fileTemplatePCHFile
    case fileTemplateFileList
    case fileTemplateExportsFile
    case fileTemplateExtensionFile

    // File Templates - Scripts/Shell
    case fileTemplateShellScript
    case fileTemplatePlaygroundPage

    // File Templates - SiriKit/Intents
    case fileTemplateSiriKitIntentDefinitionFile
    case fileTemplateINIntentSubclass
    case fileTemplateAppEntity
    case fileTemplateTransientAppEntity
    case fileTemplateAppEnum
    case fileTemplateLinkAction

    // File Templates - Other
    case fileTemplateEmpty
    case fileTemplateEmptyFile
    case fileTemplateAppPrivacy
    case fileTemplateObjectiveCNewSuperclass

    // File Templates - Generic File Template Kinds (Xcode.IDE*)
    case fileTemplateTextSubstitution // Xcode.IDEFoundation.TextSubstitutionFileTemplateKind (44 templates)
    case fileTemplateTextSubstitutionKit // Xcode.IDEKit.TextSubstitutionFileTemplateKind (7 templates)
    case fileTemplateRefactoringNewSuperclass // Xcode.IDEKit.RefactoringFileTemplateKind.NewSuperclass
    case fileTemplateTestPlanEditor // Xcode.IDETestPlanEditor.TestPlanTemplateKind

    // File Templates - SiriKit/Intent Builder Kinds
    case fileTemplateSiriAppEntity // Xcode.IDEIntentBuilderEditor.AppEntityTemplateKind
    case fileTemplateSiriTransientAppEntity // Xcode.IDEIntentBuilderEditor.TransientAppEntityTemplateKind
    case fileTemplateSiriAppEnumeration // Xcode.IDEIntentBuilderEditor.AppEnumerationTemplateKind
    case fileTemplateSiriIntent // Xcode.IDEIntentBuilderEditor.IntentTemplateKind
    case fileTemplateSiriLinkAction // Xcode.IDEIntentBuilderEditor.LinkActionTemplateKind

    // MARK: - Package Templates (Xcode.IDESwiftPackageSupport.PackageTemplateKind)

    case swiftMacro
    case buildToolPlugin
    case commandPlugin
    case emptyPackage
    case libraryPackage

    // MARK: - Properties

    /// The raw string identifier for the template kind.
    ///
    /// Returns the template's unique identifier string, typically starting with
    /// "com.apple.dt.unit." for project templates or "com.apple.dt.packageTemplate." for packages.
    ///
    /// ## Example
    /// ```swift
    /// TemplateKind.app.rawValue
    /// // Returns: "com.apple.dt.unit.multiPlatform.app"
    ///
    /// TemplateKind.libraryPackage.rawValue
    /// // Returns: "com.apple.dt.packageTemplate.Library"
    ///
    /// TemplateKind.unknown("custom.template").rawValue
    /// // Returns: "custom.template"
    /// ```
    public var rawValue: String {
        switch self {
        case .unknown(let rawValue): return rawValue
        // Project Templates
        case .externalBuildSystem: return "com.apple.dt.unit.externalBuildSystem"
        case .aggregate: return "com.apple.dt.unit.aggregate"
        case .emptyProject: return "com.apple.dt.unit.emptyProject"
        case .uiTestingBundle: return "com.apple.dt.unit.multiPlatform.UITestingBundle"
        case .unitTestingBundle: return "com.apple.dt.unit.multiPlatform.unitTestBundle"
        case .genericExtension: return "com.apple.dt.unit.multiPlatform.generic-extension"
        case .widgetExtension: return "com.apple.dt.unit.multiPlatform.widget"
        case .audioUnitExtension: return "com.apple.dt.unit.audiounitextension.multiplatform"
        case .iosSafariExtensionApp: return "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS"
        case .safariExtensionApp: return "com.apple.dt.unit.multiPlatform.appWithSafariExtension"
        case .macosSafariExtensionApp: return "com.apple.dt.unit.multiPlatform.appWithSafariExtension.macOS"
        case .sharedSafariExtensionApp: return "com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared"
        case .iosSafariExtension: return "com.apple.dt.unit.multiPlatform.safariExtension.iOS"
        case .macosSafariExtension: return "com.apple.dt.unit.multiPlatform.safariExtension.macOS"
        case .sharedSafariExtension: return "com.apple.dt.unit.multiPlatform.safariExtension.shared"
        case .game: return "com.apple.dt.unit.crossPlatformGame"
        case .sceneKitGameShared: return "com.apple.dt.unit.crossPlatformSceneKitGame_sharedComponent"
        case .sceneKitGameIOS: return "com.apple.dt.unit.crossPlatformSceneKitGame_iOSComponent"
        case .sceneKitGameMacOS: return "com.apple.dt.unit.crossPlatformSceneKitGame_OSXComponent"
        case .sceneKitGameTvOS: return "com.apple.dt.unit.crossPlatformSceneKitGame_tvOSComponent"
        case .spriteKitGameShared: return "com.apple.dt.unit.crossPlatformSpriteKitGame_sharedComponent"
        case .spriteKitGameIOS: return "com.apple.dt.unit.crossPlatformSpriteKitGame_iOSComponent"
        case .spriteKitGameMacOS: return "com.apple.dt.unit.crossPlatformSpriteKitGame_OSXComponent"
        case .spriteKitGameTvOS: return "com.apple.dt.unit.crossPlatformSpriteKitGame_tvOSComponent"
        case .metalGameShared: return "com.apple.dt.unit.crossPlatformMetalGame_sharedComponent"
        case .metalGameIOS: return "com.apple.dt.unit.crossPlatformMetalGame_iOSComponent"
        case .metalGameMacOS: return "com.apple.dt.unit.crossPlatformMetalGame_OSXComponent"
        case .metalGameTvOS: return "com.apple.dt.unit.crossPlatformMetalGame_tvOSComponent"
        case .metal4GameShared: return "com.apple.dt.unit.crossPlatformMetal4Game_sharedComponent"
        case .metal4GameIOS: return "com.apple.dt.unit.crossPlatformMetal4Game_iOSComponent"
        case .metal4GameMacOS: return "com.apple.dt.unit.crossPlatformMetal4Game_OSXComponent"
        case .metal4GameTvOS: return "com.apple.dt.unit.crossPlatformMetal4Game_tvOSComponent"
        case .realityKitGame: return "com.apple.dt.unit.crossPlatformRealityKitGame"
        case .immersiveSpaceApp: return "com.apple.dt.unit.crossPlatform.ImmersiveSpaceComponent"
        case .visionOSApp: return "com.apple.dt.unit.crossPlatform.visionOS.base"
        case .compositorServices: return "com.apple.dt.unit.crossPlatform.CompositorServicesComponent"
        case .documentApp: return "com.apple.dt.unit.multiPlatform.app.document-based"
        case .app: return "com.apple.dt.unit.multiPlatform.app"
        case .audioUnitExtensionApp:
            return "com.apple.dt.unit.SwiftUIApplicationWithAudioUnitExtension.multiPlatform.app"
        case .iosAppUITestBundle: return "com.apple.dt.unit.multiPlatform.app.iOS.tests.ui"
        case .macosAppUITestBundle: return "com.apple.dt.unit.multiPlatform.app.macOS.tests.ui"
        case .multiplatformSwiftUIAppUITestingBundle: return "com.apple.dt.unit.multiPlatform.app.SwiftUI.tests.ui"
        case .multiplatformSwiftUIDocumentApp: return "com.apple.dt.unit.multiPlatform.app.document-based.SwiftUI"
        case .multiplatformSwiftUIAppTestingBundle: return "com.apple.dt.unit.multiPlatform.app.SwiftUI.tests.unit"
        case .multiplatformSwiftUIApp: return "com.apple.dt.unit.multiPlatform.app.SwiftUI"
        case .macosAppEntitlements: return "com.apple.dt.unit.crossPlatformAppEntitlements_OSX"
        case .framework: return "com.apple.dt.unit.multiPlatform.framework"
        case .frameworkTestingBundle: return "com.apple.dt.unit.multiPlatform.frameworkUnitTestBundle"
        // Base Templates
        case .base: return "com.apple.dt.unit.base"
        case .baseOptions: return "com.apple.dt.unit.base_Options"
        case .baseDefinitionsLanguage: return "com.apple.dt.unit.base_DefinitionsLanguage"
        case .baseStorageType: return "com.apple.dt.unit.base_StorageType"
        case .baseProjectSettings: return "com.apple.dt.unit.base_ProjectSettings"
        case .baseAppLifecycle: return "com.apple.dt.unit.base_AppLifecycle"
        case .baseTestingSystem: return "com.apple.dt.unit.base_TestingSystem"
        case .baseDefinitionsInfoPlist: return "com.apple.dt.unit.base_DefinitionsInfoPlist"
        case .securityCriticalBase: return "com.apple.dt.unit.securityCriticalBase"
        case .crossPlatformBase: return "com.apple.dt.unit.crossPlatformBase"
        case .iosAppBase: return "com.apple.dt.unit.crossPlatformAppBase_iOS"
        case .macosAppBase: return "com.apple.dt.unit.crossPlatformAppBase_OSX"
        case .tvosAppBase: return "com.apple.dt.unit.crossPlatformAppBase_tvOS"
        case .multiplatformBase: return "com.apple.dt.unit.multiPlatform.base"
        case .applicationBase: return "com.apple.dt.unit.applicationBase"
        case .swiftUIAppBase: return "com.apple.dt.unit.applicationBase.SwiftUI"
        case .swiftUIDocumentAppBase: return "com.apple.dt.unit.applicationBase.document-based.SwiftUI"
        case .appExtensionBase: return "com.apple.dt.unit.appextensionbase"
        case .extensionKitExtensionBase: return "com.apple.dt.unit.extensionkit-extension"
        case .multiplatformExtensionKitExtensionBase: return "com.apple.dt.unit.multiPlatform.extensionkit-extension"
        case .multiplatformAppExtensionBase: return "com.apple.dt.unit.multiPlatform.nsappex.base"
        case .unitTestBundleBase: return "com.apple.dt.unit.unitTestBundleBase"
        case .uiTestBundleBase: return "com.apple.dt.unit.uiTestBundleBase"
        case .multiplatformUnitTestBundleBase: return "com.apple.dt.unit.multiPlatform.unitTestBundleBase"
        case .multiplatformUITestBundleBase: return "com.apple.dt.unit.multiPlatform.UITestBundleBase"
        case .swiftUIAppUnitTestBundleBase: return "com.apple.dt.unit.unitTestBundleBase.app.SwiftUI"
        case .swiftUIAppUITestBundleBase: return "com.apple.dt.unit.uiTestBundleBase.app.SwiftUI"
        case .frameworkBase: return "com.apple.dt.unit.frameworkBase"
        case .bundleBase: return "com.apple.dt.unit.bundleBase"
        case .metalLibraryBase: return "com.apple.dt.unit.metalLibrary.base"
        case .xpcServiceBase: return "com.apple.dt.unit.xpcservicebase"
        case .storageType: return "com.apple.dt.unit.storageType"
        case .storageTypeDocumentApp: return "com.apple.dt.unit.storageType.document-app"
        case .languageChoice: return "com.apple.dt.unit.languageChoice"
        case .testingSystem: return "com.apple.dt.unit.testingSystem"
        case .iosAppLifecycle: return "com.apple.dt.unit.appLifecycle.iOS"
        case .iosAppExtensionBase: return "com.apple.dt.unit.iosAppExtensionBase"
        case .iosBase: return "com.apple.dt.unit.iosBase"
        case .iosBaseDefinitions: return "com.apple.dt.unit.iosBase_Definitions"
        case .iosUITestBundleBase: return "com.apple.dt.unit.iosUITestBundleBase"
        case .iosLanguageChoice: return "com.apple.dt.unit.languageChoice.app.iOS"
        case .macOSAppExtensionBase: return "com.apple.dt.unit.osxAppExtensionBase"
        case .macOSBase: return "com.apple.dt.unit.osxBase"
        case .macOSBaseDefinitions: return "com.apple.dt.unit.osxBase_Definitions"
        case .macOSUITestBundleBase: return "com.apple.dt.unit.osxUITestBundleBase"
        case .tvOSBaseDefinitions: return "com.apple.dt.unit.tvosBase_Definitions"
        // File Templates
        case .fileTemplateSwiftFile: return "fileTemplate.swiftFile"
        case .fileTemplateObjectiveCFile: return "fileTemplate.objectiveCFile"
        case .fileTemplateCFile: return "fileTemplate.cFile"
        case .fileTemplateHeaderFile: return "fileTemplate.headerFile"
        case .fileTemplateMetalFile: return "fileTemplate.metalFile"
        case .fileTemplateAssemblyFile: return "fileTemplate.assemblyFile"
        case .fileTemplateCLIPSFile: return "fileTemplate.cLIPSFile"
        case .fileTemplateSwiftUIView: return "fileTemplate.swiftUIView"
        case .fileTemplatePackageSwiftFile: return "fileTemplate.packageSwiftFile"
        case .fileTemplateSourcesFolderSwiftFile: return "fileTemplate.sourcesFolderSwiftFile"
        case .fileTemplateSwiftTestingUnitTest: return "fileTemplate.swiftTestingUnitTest"
        case .fileTemplateXCTestUnitTest: return "fileTemplate.xCTestUnitTest"
        case .fileTemplateXCTestUITest: return "fileTemplate.xCTestUITest"
        case .fileTemplatePackageTestCase: return "fileTemplate.packageTestCase"
        case .fileTemplateTestPlan: return "fileTemplate.testPlan"
        case .fileTemplateStoryboard: return "fileTemplate.storyboard"
        case .fileTemplateView: return "fileTemplate.view"
        case .fileTemplateWindow: return "fileTemplate.window"
        case .fileTemplateMainMenu: return "fileTemplate.mainMenu"
        case .fileTemplateApplication: return "fileTemplate.application"
        case .fileTemplateSceneKitSceneFile: return "fileTemplate.sceneKitSceneFile"
        case .fileTemplateSceneKitAssetCatalog: return "fileTemplate.sceneKitAssetCatalog"
        case .fileTemplateSceneKitAssetCache: return "fileTemplate.sceneKitAssetCache"
        case .fileTemplateSpriteKitScene: return "fileTemplate.spriteKitScene"
        case .fileTemplateSpriteKitAction: return "fileTemplate.spriteKitAction"
        case .fileTemplateSpriteKitParticleFile: return "fileTemplate.spriteKitParticleFile"
        case .fileTemplateSpriteKitTileSet: return "fileTemplate.spriteKitTileSet"
        case .fileTemplateAssetCatalog: return "fileTemplate.assetCatalog"
        case .fileTemplatePropertyList: return "fileTemplate.propertyList"
        case .fileTemplateStringsFileLegacy: return "fileTemplate.stringsFileLegacy"
        case .fileTemplateStringsdictFileLegacy: return "fileTemplate.stringsdictFileLegacy"
        case .fileTemplateTouchAlternativesPropertyList: return "fileTemplate.touchAlternativesPropertyList"
        case .fileTemplateDocumentationCatalog: return "fileTemplate.documentationCatalog"
        case .fileTemplateArticleFile: return "fileTemplate.articleFile"
        case .fileTemplateTutorialFile: return "fileTemplate.tutorialFile"
        case .fileTemplateTutorialTableOfContentsFile: return "fileTemplate.tutorialTableofContentsFile"
        case .fileTemplateMarkdownFile: return "fileTemplate.markdownFile"
        case .fileTemplateRTFFile: return "fileTemplate.rTFFile"
        case .fileTemplateConfigurationSettingsFile: return "fileTemplate.configurationSettingsFile"
        case .fileTemplateModuleMap: return "fileTemplate.moduleMap"
        case .fileTemplatePCHFile: return "fileTemplate.pCHFile"
        case .fileTemplateFileList: return "fileTemplate.fileList"
        case .fileTemplateExportsFile: return "fileTemplate.exportsFile"
        case .fileTemplateExtensionFile: return "fileTemplate.extensionFile"
        case .fileTemplateShellScript: return "fileTemplate.shellScript"
        case .fileTemplatePlaygroundPage: return "fileTemplate.playgroundPage"
        case .fileTemplateSiriKitIntentDefinitionFile: return "fileTemplate.siriKitIntentDefinitionFile"
        case .fileTemplateINIntentSubclass: return "fileTemplate.iNIntentsubclass"
        case .fileTemplateAppEntity: return "fileTemplate.appEntity"
        case .fileTemplateTransientAppEntity: return "fileTemplate.transientAppEntity"
        case .fileTemplateAppEnum: return "fileTemplate.appEnum"
        case .fileTemplateLinkAction: return "fileTemplate.linkaction"
        case .fileTemplateEmpty: return "fileTemplate.empty"
        case .fileTemplateEmptyFile: return "fileTemplate.emptyFile"
        case .fileTemplateAppPrivacy: return "fileTemplate.appPrivacy"
        case .fileTemplateObjectiveCNewSuperclass: return "fileTemplate.objectiveCnewsuperclass"
        // File Templates - Generic Kinds (Xcode.IDE*)
        case .fileTemplateTextSubstitution: return "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind"
        case .fileTemplateTextSubstitutionKit: return "Xcode.IDEKit.TextSubstitutionFileTemplateKind"
        case .fileTemplateRefactoringNewSuperclass: return "Xcode.IDEKit.RefactoringFileTemplateKind.NewSuperclass"
        case .fileTemplateTestPlanEditor: return "Xcode.IDETestPlanEditor.TestPlanTemplateKind"
        // File Templates - SiriKit/Intent Builder Kinds
        case .fileTemplateSiriAppEntity: return "Xcode.IDEIntentBuilderEditor.AppEntityTemplateKind"
        case .fileTemplateSiriTransientAppEntity: return "Xcode.IDEIntentBuilderEditor.TransientAppEntityTemplateKind"
        case .fileTemplateSiriAppEnumeration: return "Xcode.IDEIntentBuilderEditor.AppEnumerationTemplateKind"
        case .fileTemplateSiriIntent: return "Xcode.IDEIntentBuilderEditor.IntentTemplateKind"
        case .fileTemplateSiriLinkAction: return "Xcode.IDEIntentBuilderEditor.LinkActionTemplateKind"
        // Package Templates
        case .swiftMacro: return "com.apple.dt.packageTemplate.SwiftMacro"
        case .buildToolPlugin: return "com.apple.dt.packageTemplate.BuildToolPlugin"
        case .commandPlugin: return "com.apple.dt.packageTemplate.CommandPlugin"
        case .emptyPackage: return "com.apple.dt.packageTemplate.Empty"
        case .libraryPackage: return "com.apple.dt.packageTemplate.Library"
        }
    }

    /// Initialize from a raw template identifier string.
    ///
    /// Creates a `TemplateKind` from the template's unique identifier.
    /// Returns `.unknown(rawValue)` if the identifier is not recognized.
    ///
    /// ## Example
    /// ```swift
    /// let kind = TemplateKind(rawValue: "com.apple.dt.unit.multiPlatform.app")
    /// // Returns: .app
    ///
    /// let unknownKind = TemplateKind(rawValue: "custom.unknown.template")
    /// // Returns: .unknown("custom.unknown.template")
    /// ```
    ///
    /// ## SwiftLint Exceptions
    ///
    /// This initializer violates complexity and length rules because it maps 158+ template identifiers:
    /// - **cyclomatic_complexity**: Switch has 158+ cases (one per template kind)
    /// - **function_body_length**: Required to map all Xcode template identifier strings to enum cases
    ///
    /// This is auto-generated mapping code. Each template kind needs its own case mapping.
    /// Complexity cannot be reduced without breaking the exhaustive string-to-enum conversion.
    // swiftlint:disable:next function_body_length
    public init(rawValue: String) {
        switch rawValue {
        // Project Templates
        case "com.apple.dt.unit.externalBuildSystem": self = .externalBuildSystem
        case "com.apple.dt.unit.aggregate": self = .aggregate
        case "com.apple.dt.unit.emptyProject": self = .emptyProject
        case "com.apple.dt.unit.multiPlatform.UITestingBundle": self = .uiTestingBundle
        case "com.apple.dt.unit.multiPlatform.unitTestBundle": self = .unitTestingBundle
        case "com.apple.dt.unit.multiPlatform.generic-extension": self = .genericExtension
        case "com.apple.dt.unit.multiPlatform.widget": self = .widgetExtension
        case "com.apple.dt.unit.audiounitextension.multiplatform": self = .audioUnitExtension
        case "com.apple.dt.unit.multiPlatform.appWithSafariExtension.iOS": self = .iosSafariExtensionApp
        case "com.apple.dt.unit.multiPlatform.appWithSafariExtension": self = .safariExtensionApp
        case "com.apple.dt.unit.multiPlatform.appWithSafariExtension.macOS": self = .macosSafariExtensionApp
        case "com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared": self = .sharedSafariExtensionApp
        case "com.apple.dt.unit.multiPlatform.safariExtension.iOS": self = .iosSafariExtension
        case "com.apple.dt.unit.multiPlatform.safariExtension.macOS": self = .macosSafariExtension
        case "com.apple.dt.unit.multiPlatform.safariExtension.shared": self = .sharedSafariExtension
        case "com.apple.dt.unit.crossPlatformGame": self = .game
        case "com.apple.dt.unit.crossPlatformSceneKitGame_sharedComponent": self = .sceneKitGameShared
        case "com.apple.dt.unit.crossPlatformSceneKitGame_iOSComponent": self = .sceneKitGameIOS
        case "com.apple.dt.unit.crossPlatformSceneKitGame_OSXComponent": self = .sceneKitGameMacOS
        case "com.apple.dt.unit.crossPlatformSceneKitGame_tvOSComponent": self = .sceneKitGameTvOS
        case "com.apple.dt.unit.crossPlatformSpriteKitGame_sharedComponent": self = .spriteKitGameShared
        case "com.apple.dt.unit.crossPlatformSpriteKitGame_iOSComponent": self = .spriteKitGameIOS
        case "com.apple.dt.unit.crossPlatformSpriteKitGame_OSXComponent": self = .spriteKitGameMacOS
        case "com.apple.dt.unit.crossPlatformSpriteKitGame_tvOSComponent": self = .spriteKitGameTvOS
        case "com.apple.dt.unit.crossPlatformMetalGame_sharedComponent": self = .metalGameShared
        case "com.apple.dt.unit.crossPlatformMetalGame_iOSComponent": self = .metalGameIOS
        case "com.apple.dt.unit.crossPlatformMetalGame_OSXComponent": self = .metalGameMacOS
        case "com.apple.dt.unit.crossPlatformMetalGame_tvOSComponent": self = .metalGameTvOS
        case "com.apple.dt.unit.crossPlatformMetal4Game_sharedComponent": self = .metal4GameShared
        case "com.apple.dt.unit.crossPlatformMetal4Game_iOSComponent": self = .metal4GameIOS
        case "com.apple.dt.unit.crossPlatformMetal4Game_OSXComponent": self = .metal4GameMacOS
        case "com.apple.dt.unit.crossPlatformMetal4Game_tvOSComponent": self = .metal4GameTvOS
        case "com.apple.dt.unit.crossPlatformRealityKitGame": self = .realityKitGame
        case "com.apple.dt.unit.crossPlatform.ImmersiveSpaceComponent": self = .immersiveSpaceApp
        case "com.apple.dt.unit.crossPlatform.visionOS.base": self = .visionOSApp
        case "com.apple.dt.unit.crossPlatform.CompositorServicesComponent": self = .compositorServices
        case "com.apple.dt.unit.multiPlatform.app.document-based": self = .documentApp
        case "com.apple.dt.unit.multiPlatform.app": self = .app
        case "com.apple.dt.unit.SwiftUIApplicationWithAudioUnitExtension.multiPlatform.app":
            self = .audioUnitExtensionApp
        case "com.apple.dt.unit.multiPlatform.app.iOS.tests.ui": self = .iosAppUITestBundle
        case "com.apple.dt.unit.multiPlatform.app.macOS.tests.ui": self = .macosAppUITestBundle
        case "com.apple.dt.unit.multiPlatform.app.SwiftUI.tests.ui": self = .multiplatformSwiftUIAppUITestingBundle
        case "com.apple.dt.unit.multiPlatform.app.document-based.SwiftUI": self = .multiplatformSwiftUIDocumentApp
        case "com.apple.dt.unit.multiPlatform.app.SwiftUI.tests.unit": self = .multiplatformSwiftUIAppTestingBundle
        case "com.apple.dt.unit.multiPlatform.app.SwiftUI": self = .multiplatformSwiftUIApp
        case "com.apple.dt.unit.crossPlatformAppEntitlements_OSX": self = .macosAppEntitlements
        case "com.apple.dt.unit.multiPlatform.framework": self = .framework
        case "com.apple.dt.unit.multiPlatform.frameworkUnitTestBundle": self = .frameworkTestingBundle
        // Base Templates
        case "com.apple.dt.unit.base": self = .base
        case "com.apple.dt.unit.base_Options": self = .baseOptions
        case "com.apple.dt.unit.base_DefinitionsLanguage": self = .baseDefinitionsLanguage
        case "com.apple.dt.unit.base_StorageType": self = .baseStorageType
        case "com.apple.dt.unit.base_ProjectSettings": self = .baseProjectSettings
        case "com.apple.dt.unit.base_AppLifecycle": self = .baseAppLifecycle
        case "com.apple.dt.unit.base_TestingSystem": self = .baseTestingSystem
        case "com.apple.dt.unit.base_DefinitionsInfoPlist": self = .baseDefinitionsInfoPlist
        case "com.apple.dt.unit.securityCriticalBase": self = .securityCriticalBase
        case "com.apple.dt.unit.crossPlatformBase": self = .crossPlatformBase
        case "com.apple.dt.unit.crossPlatformAppBase_iOS": self = .iosAppBase
        case "com.apple.dt.unit.crossPlatformAppBase_OSX": self = .macosAppBase
        case "com.apple.dt.unit.crossPlatformAppBase_tvOS": self = .tvosAppBase
        case "com.apple.dt.unit.multiPlatform.base": self = .multiplatformBase
        case "com.apple.dt.unit.applicationBase": self = .applicationBase
        case "com.apple.dt.unit.applicationBase.SwiftUI": self = .swiftUIAppBase
        case "com.apple.dt.unit.applicationBase.document-based.SwiftUI": self = .swiftUIDocumentAppBase
        case "com.apple.dt.unit.appextensionbase": self = .appExtensionBase
        case "com.apple.dt.unit.extensionkit-extension": self = .extensionKitExtensionBase
        case "com.apple.dt.unit.multiPlatform.extensionkit-extension": self = .multiplatformExtensionKitExtensionBase
        case "com.apple.dt.unit.multiPlatform.nsappex.base": self = .multiplatformAppExtensionBase
        case "com.apple.dt.unit.unitTestBundleBase": self = .unitTestBundleBase
        case "com.apple.dt.unit.uiTestBundleBase": self = .uiTestBundleBase
        case "com.apple.dt.unit.multiPlatform.unitTestBundleBase": self = .multiplatformUnitTestBundleBase
        case "com.apple.dt.unit.multiPlatform.UITestBundleBase": self = .multiplatformUITestBundleBase
        case "com.apple.dt.unit.unitTestBundleBase.app.SwiftUI": self = .swiftUIAppUnitTestBundleBase
        case "com.apple.dt.unit.uiTestBundleBase.app.SwiftUI": self = .swiftUIAppUITestBundleBase
        case "com.apple.dt.unit.frameworkBase": self = .frameworkBase
        case "com.apple.dt.unit.bundleBase": self = .bundleBase
        case "com.apple.dt.unit.metalLibrary.base": self = .metalLibraryBase
        case "com.apple.dt.unit.xpcservicebase": self = .xpcServiceBase
        case "com.apple.dt.unit.storageType": self = .storageType
        case "com.apple.dt.unit.storageType.document-app": self = .storageTypeDocumentApp
        case "com.apple.dt.unit.languageChoice": self = .languageChoice
        case "com.apple.dt.unit.testingSystem": self = .testingSystem
        case "com.apple.dt.unit.appLifecycle.iOS": self = .iosAppLifecycle
        case "com.apple.dt.unit.iosAppExtensionBase": self = .iosAppExtensionBase
        case "com.apple.dt.unit.iosBase": self = .iosBase
        case "com.apple.dt.unit.iosBase_Definitions": self = .iosBaseDefinitions
        case "com.apple.dt.unit.iosUITestBundleBase": self = .iosUITestBundleBase
        case "com.apple.dt.unit.languageChoice.app.iOS": self = .iosLanguageChoice
        case "com.apple.dt.unit.osxAppExtensionBase": self = .macOSAppExtensionBase
        case "com.apple.dt.unit.osxBase": self = .macOSBase
        case "com.apple.dt.unit.osxBase_Definitions": self = .macOSBaseDefinitions
        case "com.apple.dt.unit.osxUITestBundleBase": self = .macOSUITestBundleBase
        case "com.apple.dt.unit.tvosBase_Definitions": self = .tvOSBaseDefinitions
        // File Templates
        case "fileTemplate.swiftFile": self = .fileTemplateSwiftFile
        case "fileTemplate.objectiveCFile": self = .fileTemplateObjectiveCFile
        case "fileTemplate.cFile": self = .fileTemplateCFile
        case "fileTemplate.headerFile": self = .fileTemplateHeaderFile
        case "fileTemplate.metalFile": self = .fileTemplateMetalFile
        case "fileTemplate.assemblyFile": self = .fileTemplateAssemblyFile
        case "fileTemplate.cLIPSFile": self = .fileTemplateCLIPSFile
        case "fileTemplate.swiftUIView": self = .fileTemplateSwiftUIView
        case "fileTemplate.packageSwiftFile": self = .fileTemplatePackageSwiftFile
        case "fileTemplate.sourcesFolderSwiftFile": self = .fileTemplateSourcesFolderSwiftFile
        case "fileTemplate.swiftTestingUnitTest": self = .fileTemplateSwiftTestingUnitTest
        case "fileTemplate.xCTestUnitTest": self = .fileTemplateXCTestUnitTest
        case "fileTemplate.xCTestUITest": self = .fileTemplateXCTestUITest
        case "fileTemplate.packageTestCase": self = .fileTemplatePackageTestCase
        case "fileTemplate.testPlan": self = .fileTemplateTestPlan
        case "fileTemplate.storyboard": self = .fileTemplateStoryboard
        case "fileTemplate.view": self = .fileTemplateView
        case "fileTemplate.window": self = .fileTemplateWindow
        case "fileTemplate.mainMenu": self = .fileTemplateMainMenu
        case "fileTemplate.application": self = .fileTemplateApplication
        case "fileTemplate.sceneKitSceneFile": self = .fileTemplateSceneKitSceneFile
        case "fileTemplate.sceneKitAssetCatalog": self = .fileTemplateSceneKitAssetCatalog
        case "fileTemplate.sceneKitAssetCache": self = .fileTemplateSceneKitAssetCache
        case "fileTemplate.spriteKitScene": self = .fileTemplateSpriteKitScene
        case "fileTemplate.spriteKitAction": self = .fileTemplateSpriteKitAction
        case "fileTemplate.spriteKitParticleFile": self = .fileTemplateSpriteKitParticleFile
        case "fileTemplate.spriteKitTileSet": self = .fileTemplateSpriteKitTileSet
        case "fileTemplate.assetCatalog": self = .fileTemplateAssetCatalog
        case "fileTemplate.propertyList": self = .fileTemplatePropertyList
        case "fileTemplate.stringsFileLegacy": self = .fileTemplateStringsFileLegacy
        case "fileTemplate.stringsdictFileLegacy": self = .fileTemplateStringsdictFileLegacy
        case "fileTemplate.touchAlternativesPropertyList": self = .fileTemplateTouchAlternativesPropertyList
        case "fileTemplate.documentationCatalog": self = .fileTemplateDocumentationCatalog
        case "fileTemplate.articleFile": self = .fileTemplateArticleFile
        case "fileTemplate.tutorialFile": self = .fileTemplateTutorialFile
        case "fileTemplate.tutorialTableofContentsFile": self = .fileTemplateTutorialTableOfContentsFile
        case "fileTemplate.markdownFile": self = .fileTemplateMarkdownFile
        case "fileTemplate.rTFFile": self = .fileTemplateRTFFile
        case "fileTemplate.configurationSettingsFile": self = .fileTemplateConfigurationSettingsFile
        case "fileTemplate.moduleMap": self = .fileTemplateModuleMap
        case "fileTemplate.pCHFile": self = .fileTemplatePCHFile
        case "fileTemplate.fileList": self = .fileTemplateFileList
        case "fileTemplate.exportsFile": self = .fileTemplateExportsFile
        case "fileTemplate.extensionFile": self = .fileTemplateExtensionFile
        case "fileTemplate.shellScript": self = .fileTemplateShellScript
        case "fileTemplate.playgroundPage": self = .fileTemplatePlaygroundPage
        case "fileTemplate.siriKitIntentDefinitionFile": self = .fileTemplateSiriKitIntentDefinitionFile
        case "fileTemplate.iNIntentsubclass": self = .fileTemplateINIntentSubclass
        case "fileTemplate.appEntity": self = .fileTemplateAppEntity
        case "fileTemplate.transientAppEntity": self = .fileTemplateTransientAppEntity
        case "fileTemplate.appEnum": self = .fileTemplateAppEnum
        case "fileTemplate.linkaction": self = .fileTemplateLinkAction
        case "fileTemplate.empty": self = .fileTemplateEmpty
        case "fileTemplate.emptyFile": self = .fileTemplateEmptyFile
        case "fileTemplate.appPrivacy": self = .fileTemplateAppPrivacy
        case "fileTemplate.objectiveCnewsuperclass": self = .fileTemplateObjectiveCNewSuperclass
        // File Templates - Generic Kinds (Xcode.IDE*)
        case "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind": self = .fileTemplateTextSubstitution
        case "Xcode.IDEKit.TextSubstitutionFileTemplateKind": self = .fileTemplateTextSubstitutionKit
        case "Xcode.IDEKit.RefactoringFileTemplateKind.NewSuperclass": self = .fileTemplateRefactoringNewSuperclass
        case "Xcode.IDETestPlanEditor.TestPlanTemplateKind": self = .fileTemplateTestPlanEditor
        // File Templates - SiriKit/Intent Builder Kinds
        case "Xcode.IDEIntentBuilderEditor.AppEntityTemplateKind": self = .fileTemplateSiriAppEntity
        case "Xcode.IDEIntentBuilderEditor.TransientAppEntityTemplateKind": self = .fileTemplateSiriTransientAppEntity
        case "Xcode.IDEIntentBuilderEditor.AppEnumerationTemplateKind": self = .fileTemplateSiriAppEnumeration
        case "Xcode.IDEIntentBuilderEditor.IntentTemplateKind": self = .fileTemplateSiriIntent
        case "Xcode.IDEIntentBuilderEditor.LinkActionTemplateKind": self = .fileTemplateSiriLinkAction
        // Package Templates
        case "com.apple.dt.packageTemplate.SwiftMacro": self = .swiftMacro
        case "com.apple.dt.packageTemplate.BuildToolPlugin": self = .buildToolPlugin
        case "com.apple.dt.packageTemplate.CommandPlugin": self = .commandPlugin
        case "com.apple.dt.packageTemplate.Empty": self = .emptyPackage
        case "com.apple.dt.packageTemplate.Library": self = .libraryPackage
        // Unknown
        default: self = .unknown(rawValue)
        }
    }

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
        // Unknown
        case .unknown(let rawValue): return "Unknown (\(rawValue))"
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
        // iOS-specific Base Templates
        case .iosAppLifecycle: return "iOS App Lifecycle"
        case .iosAppExtensionBase: return "iOS App Extension Base"
        case .iosBase: return "iOS Base"
        case .iosBaseDefinitions: return "iOS Base Definitions"
        case .iosUITestBundleBase: return "iOS UI Test Bundle Base"
        case .iosLanguageChoice: return "iOS Language Choice"
        // macOS-specific Base Templates
        case .macOSAppExtensionBase: return "macOS App Extension Base"
        case .macOSBase: return "macOS Base"
        case .macOSBaseDefinitions: return "macOS Base Definitions"
        case .macOSUITestBundleBase: return "macOS UI Test Bundle Base"
        // tvOS-specific Base Templates
        case .tvOSBaseDefinitions: return "tvOS Base Definitions"
        // File Templates - Source Files
        case .fileTemplateSwiftFile: return "Swift File"
        case .fileTemplateObjectiveCFile: return "Objective-C File"
        case .fileTemplateCFile: return "C/C++ File"
        case .fileTemplateHeaderFile: return "Header File"
        case .fileTemplateMetalFile: return "Metal File"
        case .fileTemplateAssemblyFile: return "Assembly File"
        case .fileTemplateCLIPSFile: return "CLIPS File"
        // File Templates - Swift/SwiftUI
        case .fileTemplateSwiftUIView: return "SwiftUI View"
        case .fileTemplatePackageSwiftFile: return "Package Swift File"
        case .fileTemplateSourcesFolderSwiftFile: return "Sources Folder Swift File"
        // File Templates - Testing
        case .fileTemplateSwiftTestingUnitTest: return "Swift Testing Unit Test"
        case .fileTemplateXCTestUnitTest: return "XCTest Unit Test"
        case .fileTemplateXCTestUITest: return "XCTest UI Test"
        case .fileTemplatePackageTestCase: return "Package Test Case"
        case .fileTemplateTestPlan: return "Test Plan"
        // File Templates - UI/Scene
        case .fileTemplateStoryboard: return "Storyboard"
        case .fileTemplateView: return "View"
        case .fileTemplateWindow: return "Window"
        case .fileTemplateMainMenu: return "Main Menu"
        case .fileTemplateApplication: return "Application"
        // File Templates - SceneKit
        case .fileTemplateSceneKitSceneFile: return "SceneKit Scene File"
        case .fileTemplateSceneKitAssetCatalog: return "SceneKit Asset Catalog"
        case .fileTemplateSceneKitAssetCache: return "SceneKit Asset Cache"
        // File Templates - SpriteKit
        case .fileTemplateSpriteKitScene: return "SpriteKit Scene"
        case .fileTemplateSpriteKitAction: return "SpriteKit Action"
        case .fileTemplateSpriteKitParticleFile: return "SpriteKit Particle File"
        case .fileTemplateSpriteKitTileSet: return "SpriteKit Tile Set"
        // File Templates - Assets/Resources
        case .fileTemplateAssetCatalog: return "Asset Catalog"
        case .fileTemplatePropertyList: return "Property List"
        case .fileTemplateStringsFileLegacy: return "Strings File (Legacy)"
        case .fileTemplateStringsdictFileLegacy: return "Stringsdict File (Legacy)"
        case .fileTemplateTouchAlternativesPropertyList: return "Touch Alternatives Property List"
        // File Templates - Documentation
        case .fileTemplateDocumentationCatalog: return "Documentation Catalog"
        case .fileTemplateArticleFile: return "Article File"
        case .fileTemplateTutorialFile: return "Tutorial File"
        case .fileTemplateTutorialTableOfContentsFile: return "Tutorial Table of Contents File"
        case .fileTemplateMarkdownFile: return "Markdown File"
        case .fileTemplateRTFFile: return "RTF File"
        // File Templates - Configuration
        case .fileTemplateConfigurationSettingsFile: return "Configuration Settings File"
        case .fileTemplateModuleMap: return "Module Map"
        case .fileTemplatePCHFile: return "PCH File"
        case .fileTemplateFileList: return "File List"
        case .fileTemplateExportsFile: return "Exports File"
        case .fileTemplateExtensionFile: return "Extension File"
        // File Templates - Scripts/Shell
        case .fileTemplateShellScript: return "Shell Script"
        case .fileTemplatePlaygroundPage: return "Playground Page"
        // File Templates - SiriKit/Intents
        case .fileTemplateSiriKitIntentDefinitionFile: return "SiriKit Intent Definition File"
        case .fileTemplateINIntentSubclass: return "INIntent Subclass"
        case .fileTemplateAppEntity: return "App Entity"
        case .fileTemplateTransientAppEntity: return "Transient App Entity"
        case .fileTemplateAppEnum: return "App Enum"
        case .fileTemplateLinkAction: return "Link Action"
        // File Templates - Other
        case .fileTemplateEmpty: return "Empty"
        case .fileTemplateEmptyFile: return "Empty File"
        case .fileTemplateAppPrivacy: return "App Privacy"
        case .fileTemplateObjectiveCNewSuperclass: return "Objective-C New Superclass"
        // File Templates - Generic Kinds
        case .fileTemplateTextSubstitution: return "Text Substitution File"
        case .fileTemplateTextSubstitutionKit: return "Text Substitution File (Kit)"
        case .fileTemplateRefactoringNewSuperclass: return "Refactoring New Superclass"
        case .fileTemplateTestPlanEditor: return "Test Plan"
        // File Templates - SiriKit/Intent Builder
        case .fileTemplateSiriAppEntity: return "Siri App Entity"
        case .fileTemplateSiriTransientAppEntity: return "Siri Transient App Entity"
        case .fileTemplateSiriAppEnumeration: return "Siri App Enumeration"
        case .fileTemplateSiriIntent: return "Siri Intent"
        case .fileTemplateSiriLinkAction: return "Siri Link Action"
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
        case .fileTemplateSwiftFile, .fileTemplateObjectiveCFile, .fileTemplateCFile,
             .fileTemplateHeaderFile, .fileTemplateMetalFile, .fileTemplateAssemblyFile,
             .fileTemplateCLIPSFile, .fileTemplateSwiftUIView, .fileTemplatePackageSwiftFile,
             .fileTemplateSourcesFolderSwiftFile, .fileTemplateSwiftTestingUnitTest,
             .fileTemplateXCTestUnitTest, .fileTemplateXCTestUITest, .fileTemplatePackageTestCase,
             .fileTemplateTestPlan, .fileTemplateStoryboard, .fileTemplateView, .fileTemplateWindow,
             .fileTemplateMainMenu, .fileTemplateApplication, .fileTemplateSceneKitSceneFile,
             .fileTemplateSceneKitAssetCatalog, .fileTemplateSceneKitAssetCache,
             .fileTemplateSpriteKitScene, .fileTemplateSpriteKitAction,
             .fileTemplateSpriteKitParticleFile, .fileTemplateSpriteKitTileSet,
             .fileTemplateAssetCatalog, .fileTemplatePropertyList, .fileTemplateStringsFileLegacy,
             .fileTemplateStringsdictFileLegacy, .fileTemplateTouchAlternativesPropertyList,
             .fileTemplateDocumentationCatalog, .fileTemplateArticleFile, .fileTemplateTutorialFile,
             .fileTemplateTutorialTableOfContentsFile, .fileTemplateMarkdownFile, .fileTemplateRTFFile,
             .fileTemplateConfigurationSettingsFile, .fileTemplateModuleMap, .fileTemplatePCHFile,
             .fileTemplateFileList, .fileTemplateExportsFile, .fileTemplateExtensionFile,
             .fileTemplateShellScript, .fileTemplatePlaygroundPage,
             .fileTemplateSiriKitIntentDefinitionFile, .fileTemplateINIntentSubclass,
             .fileTemplateAppEntity, .fileTemplateTransientAppEntity, .fileTemplateAppEnum,
             .fileTemplateLinkAction, .fileTemplateEmpty, .fileTemplateEmptyFile,
             .fileTemplateAppPrivacy, .fileTemplateObjectiveCNewSuperclass:
            return .fileTemplates
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
             .storageType, .storageTypeDocumentApp, .languageChoice, .testingSystem,
             // iOS-specific Base Templates
             .iosAppLifecycle, .iosAppExtensionBase, .iosBase, .iosBaseDefinitions,
             .iosUITestBundleBase, .iosLanguageChoice,
             // macOS-specific Base Templates
             .macOSAppExtensionBase, .macOSBase, .macOSBaseDefinitions, .macOSUITestBundleBase,
             // tvOS-specific Base Templates
             .tvOSBaseDefinitions:
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

// MARK: - Codable Conformance

extension TemplateKind {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self.init(rawValue: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
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
