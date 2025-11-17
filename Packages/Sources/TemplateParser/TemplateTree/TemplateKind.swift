//
//  TemplateKind.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation

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
/// ## Example
/// ```swift
/// let appKind = TemplateKind.app
/// print(appKind.displayName)  // "App"
/// print(appKind.rawValue)     // "com.apple.dt.unit.multiPlatform.app"
/// print(appKind.category)     // TemplateCategory.projectTemplates
/// print(appKind.isBaseTemplate)  // false
///
/// let baseKind = TemplateKind.baseOptions
/// print(baseKind.isBaseTemplate)  // true
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
/// ```
///
/// - Note: Ancestor identifiers are stored as strings and resolved later using
///   `ProjectTemplateParser.loadWithAncestors()` which merges inherited options and nodes.
public enum TemplateKind: String, Hashable, CaseIterable, Codable {
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
