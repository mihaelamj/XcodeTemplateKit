# TargetsSharedSettings - Complete Type Specification

## Type Name
`TargetsSharedSettings`

## Field Count
68 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct TargetsSharedSettings: Codable, Hashable, Sendable {
            public let aLLOW_TARGET_PLATFORM_SPECIALIZATION: String?
            public let aSSETCATALOG_COMPILER_APPICON_NAME: String
            public let aSSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME: String
            public let aSSETCATALOG_COMPILER_WIDGET_BACKGROUND_COLOR_NAME: String?
            public let cLANG_CXX_LANGUAGE_STANDARD: String?
            public let cLANG_CXX_LIBRARY: String?
            public let cODE_SIGN_ENTITLEMENTS: String?
            public let cOMBINE_HIDPI_IMAGES: String?
            public let cURRENT_PROJECT_VERSION: String?
            public let dYLIB_COMPATIBILITY_VERSION: String?
            public let dYLIB_CURRENT_VERSION: String?
            public let dYLIB_INSTALL_NAME_BASE: String?
            public let eNABLE_APP_SANDBOX: String
            public let eNABLE_HARDENED_RUNTIME: String
            public let eNABLE_MODULE_VERIFIER: String?
            public let eNABLE_OUTGOING_NETWORK_CONNECTIONS: String?
            public let eNABLE_PREVIEWS: String
            public let eNABLE_USER_SELECTED_FILES: String
            public let gENERATE_INFOPLIST_FILE: String?
            public let iNFOPLIST_FILE: String
            public let iNFOPLIST_KEY_CFBundleDisplayName: String
            public let iNFOPLIST_KEY_NSCameraUsageDescription: String?
            public let iNFOPLIST_KEY_NSHumanReadableCopyright: String
            public let iNFOPLIST_KEY_NSMainStoryboardFile: String?
            public let iNFOPLIST_KEY_NSPrincipalClass: String?
            public let iNFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphoneos*]: String?
            public let iNFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphonesimulator*]: String?
            public let iNFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents: String?
            public let iNFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphoneos*]: String?
            public let iNFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphonesimulator*]: String?
            public let iNFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]: String?
            public let iNFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphonesimulator*]: String?
            public let iNFOPLIST_KEY_UILaunchStoryboardName: String?
            public let iNFOPLIST_KEY_UIMainStoryboardFile: String?
            public let iNFOPLIST_KEY_UIStatusBarHidden: String
            public let iNFOPLIST_KEY_UIStatusBarStyle[sdk=iphoneos*]: String?
            public let iNFOPLIST_KEY_UIStatusBarStyle[sdk=iphonesimulator*]: String?
            public let iNFOPLIST_KEY_UISupportedInterfaceOrientations: String?
            public let iNFOPLIST_KEY_UISupportedInterfaceOrientations_iPad: String
            public let iNFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone: String
            public let iNFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphoneos*]: String?
            public let iNFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphonesimulator*]: String?
            public let iNFOPLIST_KEY_UIUserInterfaceStyle: String?
            public let iNSTALL_PATH: String?
            public let iPHONEOS_DEPLOYMENT_TARGET: String?
            public let lD_RUNPATH_SEARCH_PATHS: String
            public let lD_RUNPATH_SEARCH_PATHS[sdk=macosx*]: String
            public let mACOSX_DEPLOYMENT_TARGET: String?
            public let mARKETING_VERSION: String?
            public let mODULE_VERIFIER_SUPPORTED_LANGUAGES: String?
            public let mODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS: String?
            public let oTHER_CFLAGS: String?
            public let oTHER_LDFLAGS: String
            public let pRODUCT_BUNDLE_IDENTIFIER: String
            public let pRODUCT_NAME: String
            public let rEGISTER_APP_GROUPS: String
            public let rUN_CLANG_STATIC_ANALYZER: String?
            public let sDKROOT: String
            public let sKIP_INSTALL: String?
            public let sTRING_CATALOG_GENERATE_SYMBOLS: String
            public let sUPPORTED_PLATFORMS: String?
            public let sWIFT_EMIT_LOC_STRINGS: String
            public let sWIFT_OBJC_BRIDGING_HEADER: String?
            public let sWIFT_OBJC_INTEROP_MODE: String?
            public let tARGETED_DEVICE_FAMILY: String
            public let tVOS_DEPLOYMENT_TARGET: String?
            public let vERSIONING_SYSTEM: String?
            public let xROS_DEPLOYMENT_TARGET: String?
    }
}
```

## Example Values
From template: **tvOS App Base.xctemplate**

### ALLOW_TARGET_PLATFORM_SPECIALIZATION
```
YES
```

### ASSETCATALOG_COMPILER_APPICON_NAME
```
AppIcon
```

### ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME
```
AccentColor
```

### ASSETCATALOG_COMPILER_WIDGET_BACKGROUND_COLOR_NAME
```
WidgetBackground
```

### CLANG_CXX_LANGUAGE_STANDARD
```
c++20
```

### CLANG_CXX_LIBRARY
```
libc++
```

### CODE_SIGN_ENTITLEMENTS
```

```

### COMBINE_HIDPI_IMAGES
```
YES
```

### CURRENT_PROJECT_VERSION
```
1
```

### DYLIB_COMPATIBILITY_VERSION
```
1
```

### DYLIB_CURRENT_VERSION
```
1
```

### DYLIB_INSTALL_NAME_BASE
```
@rpath
```

### ENABLE_APP_SANDBOX
```
YES
```

### ENABLE_HARDENED_RUNTIME
```
YES
```

### ENABLE_MODULE_VERIFIER
```
YES
```

### ENABLE_OUTGOING_NETWORK_CONNECTIONS
```
YES
```

### ENABLE_PREVIEWS
```
YES
```

### ENABLE_USER_SELECTED_FILES
```
readonly
```

### GENERATE_INFOPLIST_FILE
```
YES
```

### INFOPLIST_FILE
```
___PACKAGENAME___/Info.plist
```

### INFOPLIST_KEY_CFBundleDisplayName
```
___PARENTPACKAGENAME___
```

### INFOPLIST_KEY_NSCameraUsageDescription
```
CAMERA_USAGE_DESCRIPTION
```

### INFOPLIST_KEY_NSHumanReadableCopyright
```
___COPYRIGHT___
```

### INFOPLIST_KEY_NSMainStoryboardFile
```
Main
```

### INFOPLIST_KEY_NSPrincipalClass
```
NSApplication
```

### INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphoneos*]
```
YES
```

### INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphonesimulator*]
```
YES
```

### INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents
```
YES
```

### INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphoneos*]
```
YES
```

### INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphonesimulator*]
```
YES
```

### INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]
```
YES
```

### INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphonesimulator*]
```
YES
```

### INFOPLIST_KEY_UILaunchStoryboardName
```
LaunchScreen
```

### INFOPLIST_KEY_UIMainStoryboardFile
```
Main
```

### INFOPLIST_KEY_UIStatusBarHidden
```
YES
```

### INFOPLIST_KEY_UIStatusBarStyle[sdk=iphoneos*]
```
UIStatusBarStyleDefault
```

### INFOPLIST_KEY_UIStatusBarStyle[sdk=iphonesimulator*]
```
UIStatusBarStyleDefault
```

### INFOPLIST_KEY_UISupportedInterfaceOrientations
```
UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight
```

### INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad
```
UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight
```

### INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone
```
UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight
```

### INFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphoneos*]
```
YES
```

### INFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphonesimulator*]
```
YES
```

### INFOPLIST_KEY_UIUserInterfaceStyle
```
Automatic
```

### INSTALL_PATH
```
$(LOCAL_LIBRARY_DIR)/Frameworks
```

### IPHONEOS_DEPLOYMENT_TARGET
```
latest_iphoneos
```

### LD_RUNPATH_SEARCH_PATHS
```
$(inherited) @executable_path/Frameworks
```

### LD_RUNPATH_SEARCH_PATHS[sdk=macosx*]
```
@executable_path/../Frameworks
```

### MACOSX_DEPLOYMENT_TARGET
```
___BESTMACOSVERSION___
```

### MARKETING_VERSION
```
1.0
```

### MODULE_VERIFIER_SUPPORTED_LANGUAGES
```
objective-c objective-c++
```

### MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS
```
gnu17 gnu++20
```

### OTHER_CFLAGS
```

```

### OTHER_LDFLAGS
```

```

### PRODUCT_BUNDLE_IDENTIFIER
```
___VARIABLE_bundleIdentifierPrefix:bundleIdentifier___.___VARIABLE_productName:RFC1034Identifier___
```

### PRODUCT_NAME
```
$(TARGET_NAME)
```

### REGISTER_APP_GROUPS
```
YES
```

### RUN_CLANG_STATIC_ANALYZER
```
YES
```

### SDKROOT
```
appletvos
```

### SKIP_INSTALL
```
YES
```

### STRING_CATALOG_GENERATE_SYMBOLS
```
NO
```

### SUPPORTED_PLATFORMS
```
iphoneos iphonesimulator macosx appletvos appletvsimulator xros xrsimulator
```

### SWIFT_EMIT_LOC_STRINGS
```
NO
```

### SWIFT_OBJC_BRIDGING_HEADER
```
___PACKAGENAME___/Common/___PACKAGENAMEASIDENTIFIER___-Bridging-Header.h
```

### SWIFT_OBJC_INTEROP_MODE
```
objcxx
```

### TARGETED_DEVICE_FAMILY
```
1,2
```

### TVOS_DEPLOYMENT_TARGET
```
latest_appletvos
```

### VERSIONING_SYSTEM
```

```

### XROS_DEPLOYMENT_TARGET
```
latest_xros
```

