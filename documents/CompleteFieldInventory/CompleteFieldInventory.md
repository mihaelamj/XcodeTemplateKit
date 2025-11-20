# Complete Xcode Template Field Inventory

Extracted from: `/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates`
Total unique field paths: 652
Top-level fields: 37

## Field Hierarchy

### AllowedTypes

- **AllowedTypes** (__NSArrayM) - 3 examples

### Ancestors

- **Ancestors** (__NSArrayM) - 3 examples
- **Ancestors** (__NSArray0) - 3 examples

### AssociatedTargetSpecification

- **AssociatedTargetSpecification** (__NSDictionaryM) - 3 examples
  - **AllowableProductTypes** (__NSArrayM) - 3 examples
  - **AssociatedTargetIsDependent** (__NSCFBoolean) - 3 examples
    - Example: `1`
  - **AssociatedTargetIsTargetToBeTested** (__NSCFBoolean) - 2 examples
    - Example: `1`
  - **AssociatedTargetNeedsProductBuildPhaseInjection** (__NSCFBoolean) - 3 examples
    - Example: `1`
  - **PopUpDescription** (__NSCFString) - 3 examples
    - Example: `The application that this new test bundle will be testing. The new UI Tests will be associated with that target's scheme.`
  - **PopUpTitle** (__NSCFString) - 3 examples
    - Example: `Target to be Tested:`

### BuildableType

- **BuildableType** (NSTaggedPointerString) - 3 examples
  - Example: `None`

### Components

- **Components** (__NSArrayM) - 2 examples

### Components[]

  - **Identifier** (__NSCFString) - 2 examples
    - Example: `com.apple.dt.unit.multiPlatform.appWithSafariExtension.shared`
  - **Name** (__NSCFString) - 2 examples
    - Example: `Shared (App)`
  - **ProductBuildPhaseInjections** (__NSArrayM) - 1 examples
    - **TargetIdentifier** (__NSCFString) - 1 examples
      - Example: `com.apple.dt.applicationTarget`

### Concrete

- **Concrete** (__NSCFBoolean) - 3 examples
  - Example: `1`

### DefaultCompletionName

- **DefaultCompletionName** (__NSCFConstantString) - 3 examples
  - Example: `Class`
- **DefaultCompletionName** (__NSCFString) - 3 examples
  - Example: `Class`
- **DefaultCompletionName** (NSTaggedPointerString) - 3 examples
  - Example: `Class`

### Definitions

- **Definitions** (__NSDictionaryM) - 3 examples
- **Definitions** (__NSDictionaryI) - 3 examples
  - ***:class:*** (__NSCFString) - 1 examples
    - Example: `@class ___*___;
`
  - ***:comments** (__NSCFString) - 1 examples
    - Example: `//___FILEHEADER___
`
  - ***:extension** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFString) - 1 examples
      - Example: `@interface ___FILEBASENAME___ ()
`
    - **End** (NSTaggedPointerString) - 1 examples
      - Example: `@end
`
  - ***:implementation** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFString) - 1 examples
      - Example: `@implementation ___FILEBASENAME___
`
    - **End** (NSTaggedPointerString) - 1 examples
      - Example: `@end`
  - ***:implementation:methods** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFConstantString) - 1 examples
      - Example: ``
    - **End** (__NSCFConstantString) - 1 examples
      - Example: ``
  - ***:implementation:methods:*** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFString) - 1 examples
      - Example: `___*___ {`
    - **End** (NSTaggedPointerString) - 1 examples
      - Example: `}

`
    - **Indent** (__NSCFNumber) - 1 examples
      - Example: `1`
  - ***:implementation:methods:applicationDidBecomeActive:comments** (__NSCFString) - 2 examples
    - Example: `// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.`
  - ***:implementation:methods:applicationDidEnterBackground:comments** (__NSCFString) - 2 examples
    - Example: `// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
`
  - ***:implementation:methods:applicationDidFinishLaunching:comments** (__NSCFString) - 1 examples
    - Example: `// Insert code here to initialize your application`
  - ***:implementation:methods:applicationWillEnterForeground:comments** (__NSCFString) - 2 examples
    - Example: `// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.`
  - ***:implementation:methods:applicationWillResignActive:comments** (__NSCFString) - 2 examples
    - Example: `// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
`
  - ***:implementation:methods:applicationWillTerminate:comments** (__NSCFString) - 3 examples
    - Example: `// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.`
  - ***:implementation:methods:init** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFString) - 1 examples
      - Example: `- (instancetype)init {
    self = [super init];
    if (self) {`
    - **End** (__NSCFString) - 1 examples
      - Example: `    }
    return self;
}
`
    - **Indent** (__NSCFNumber) - 1 examples
      - Example: `2`
  - ***:implementation:properties** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFConstantString) - 1 examples
      - Example: ``
    - **End** (NSTaggedPointerString) - 1 examples
      - Example: `

`
  - ***:implementation:synthesize** (__NSDictionaryM) - 1 examples
    - **End** (NSTaggedPointerString) - 1 examples
      - Example: `
`
  - ***:implementation:synthesize:*** (__NSCFString) - 1 examples
    - Example: `@synthesize ___*___;`
  - ***:imports** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFConstantString) - 1 examples
      - Example: ``
    - **End** (NSTaggedPointerString) - 1 examples
      - Example: `
`
  - ***:imports:importFramework:*** (__NSCFString) - 1 examples
    - Example: `#import <___*___/___*___.h>`
  - ***:imports:importHeader:*** (__NSCFString) - 1 examples
    - Example: `#import "___*___"`
  - ***:interface** (__NSDictionaryM) - 1 examples
    - **Beginning** (__NSCFString) - 1 examples
      - Example: `@interface ___*___
`
    - **End** (NSTaggedPointerString) - 1 examples
      - Example: `
@end
`
    - **sks** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Actions.sks`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **swift** (__NSDictionaryM) - 1 examples
      - **OmitFromProjectStructure** (__NSCFBoolean) - 1 examples
        - Example: `1`
      - **Path** (__NSCFString) - 1 examples
        - Example: `AppModel.swift`
    - **scnassets** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Art.scnassets`
      - **SortOrder** (__NSCFNumber) - 1 examples
        - Example: `99`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **xcassets** (__NSDictionaryM) - 3 examples
      - **AssetGeneration** (__NSArrayM) - 3 examples
        - **Name** (NSTaggedPointerString) - 3 examples
          - Example: `AppIcon`
        - **Platforms** (__NSDictionaryM) - 3 examples
          - **iOS** (__NSCFString) - 3 examples
            - Example: `true`
          - **iOS** (NSTaggedPointerString) - 3 examples
            - Example: `true`
          - **macOS** (NSTaggedPointerString) - 3 examples
            - Example: `true`
          - **macOS** (__NSCFString) - 3 examples
            - Example: `true`
          - **visionOS** (NSTaggedPointerString) - 1 examples
            - Example: `true`
        - **Type** (NSTaggedPointerString) - 3 examples
          - Example: `appicon`
        - **Type** (__NSCFString) - 3 examples
          - Example: `appicon`
      - **OmitFromProjectStructure** (__NSCFBoolean) - 1 examples
        - Example: `1`
      - **Path** (__NSCFString) - 3 examples
        - Example: `Assets.xcassets`
      - **SortOrder** (__NSCFNumber) - 3 examples
        - Example: `100`
      - **TargetIdentifiers** (__NSArrayM) - 3 examples
      - **storyboard** (__NSDictionaryM) - 3 examples
        - **Path** (__NSCFString) - 3 examples
          - Example: `LaunchScreen.storyboard`
        - **SortOrder** (__NSCFNumber) - 3 examples
          - Example: `97`
      - **storyboard** (__NSDictionaryM) - 3 examples
        - **Path** (__NSCFString) - 3 examples
          - Example: `Main.storyboard`
        - **SortOrder** (__NSCFNumber) - 3 examples
          - Example: `98`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Common/Audio/SimplePlayEngine.swift`
    - **aif** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Common/Audio/Synth.aif`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Common/MIDI/MIDIManager.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `_Shared/Common/Parameters/ParameterSpecBase.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Common/String/StringHelpers.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Common/TypeAliases.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Common/UI/ViewControllerRepresentable.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `_Shared/Common/Utility/CrossPlatform.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `_Shared/Common/Utility/String+Utils.swift`
    - **h** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `_Shared/Common/___PACKAGENAMEASIDENTIFIER___-Bridging-Header.h`
    - **swift** (__NSDictionaryM) - 2 examples
      - **Path** (__NSCFString) - 2 examples
        - Example: `ContentView.swift`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **sks** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `GameScene.sks`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **plist** (__NSDictionaryM) - 1 examples
      - **Beginning** (__NSCFString) - 1 examples
        - Example: `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
`
      - **End** (__NSCFString) - 1 examples
        - Example: `</dict>
</plist>`
      - **Indent** (__NSCFNumber) - 1 examples
        - Example: `1`
      - **SortOrder** (__NSCFNumber) - 1 examples
        - Example: `200`
      - **SubstituteMacros** (__NSCFBoolean) - 1 examples
        - Example: `1`
      - **TargetIdentifiers** (__NSArray0) - 1 examples
    - **plist:EXAppExtensionAttributes** (__NSCFString) - 1 examples
      - Example: `<key>EXAppExtensionAttributes</key>
    <dict>
        <key>EXExtensionPointIdentifier</key>
        <string>com.example.example-extension</string>
    </dict>
`
    - **plist:NSExtension** (__NSCFString) - 3 examples
      - Example: `<key>NSExtension</key>
<dict>
    <key>NSExtensionPointIdentifier</key>
    <string>com.apple.widgetkit-extension</string>
</dict>
`
    - **plist:UIApplicationSceneManifest** (__NSDictionaryM) - 1 examples
      - **Beginning** (__NSCFString) - 1 examples
        - Example: `
            <key>UIApplicationSceneManifest</key>
            <dict>
                <key>UIApplicationSupportsMultipleScenes</key>
                <false/>
                <key>UISceneConfigurations</key>
                <dict>
                    <key>UIWindowSceneSessionRoleApplication</key>
                    <array>
                        <dict>
                            <key>UISceneConfigurationName</key>
                            <string>Default Configuration</string>
                            <key>UISceneDelegateClassName</key>
                            <string>___VARIABLE_moduleNamePrefixForClasses:XML___SceneDelegate</string>
`
      - **End** (__NSCFString) - 1 examples
        - Example: `
                        </dict>
                    </array>
                </dict>
            </dict>
`
      - **Indent** (__NSCFNumber) - 1 examples
        - Example: `2`
    - **plist:UIApplicationSceneManifest:UISceneStoryboardFile** (__NSCFString) - 1 examples
      - Example: `
<key>UISceneStoryboardFile</key>
<string>Main</string>
`
    - **plist:XPCService** (__NSCFConstantString) - 3 examples
      - Example: ``
    - **plist:XPCService** (__NSCFString) - 3 examples
      - Example: ``
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Model/AudioUnitHostModel.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArrayM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `Model/AudioUnitViewModel.swift`
    - **md** (__NSDictionaryM) - 1 examples
      - **Group** (__NSArray0) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `_Shared/README.md`
      - **html** (__NSDictionaryM) - 1 examples
        - **Group** (NSTaggedPointerString) - 1 examples
          - Example: `Resources`
        - **Path** (NSTaggedPointerString) - 1 examples
          - Example: `Main.html`
        - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **png** (__NSDictionaryM) - 1 examples
      - **Group** (NSTaggedPointerString) - 1 examples
        - Example: `Resources`
      - **Path** (NSTaggedPointerString) - 1 examples
        - Example: `Icon.png`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **js** (__NSDictionaryM) - 1 examples
      - **Group** (NSTaggedPointerString) - 1 examples
        - Example: `Resources`
      - **Path** (NSTaggedPointerString) - 1 examples
        - Example: `Script.js`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **css** (__NSDictionaryM) - 1 examples
      - **Group** (NSTaggedPointerString) - 1 examples
        - Example: `Resources`
      - **Path** (NSTaggedPointerString) - 1 examples
        - Example: `Style.css`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **h** (__NSDictionaryM) - 1 examples
      - **OmitFromProjectStructure** (__NSCFBoolean) - 1 examples
        - Example: `1`
      - **Path** (__NSCFString) - 1 examples
        - Example: `ShaderTypes.h`
    - **metal** (__NSDictionaryM) - 1 examples
      - **OmitFromProjectStructure** (__NSCFBoolean) - 1 examples
        - Example: `1`
      - **Path** (__NSCFString) - 1 examples
        - Example: `Shaders.metal`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `SpinComponent.swift`
      - **TargetIdentifiers** (__NSArrayM) - 1 examples
    - **swift** (__NSDictionaryM) - 1 examples
      - **OmitFromProjectStructure** (__NSCFBoolean) - 1 examples
        - Example: `1`
      - **Path** (__NSCFString) - 1 examples
        - Example: `ToggleImmersiveSpaceButton.swift`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `ValidationView.swift`
    - **entitlements** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `App.entitlements`
      - **SortOrder** (__NSCFNumber) - 1 examples
        - Example: `1000`
      - **TargetIdentifiers** (__NSArray0) - 1 examples
    - **swift** (__NSDictionaryM) - 1 examples
      - **Path** (NSTaggedPointerString) - 1 examples
        - Example: `App.swift`
      - **SortOrder** (__NSCFNumber) - 1 examples
        - Example: `98`
    - **swift** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `WidgetBundle.swift`
    - **metal** (__NSDictionaryM) - 1 examples
      - **Path** (__NSCFString) - 1 examples
        - Example: `___PACKAGENAMEASIDENTIFIER___.metal`
    - **m** (__NSDictionaryM) - 1 examples
      - **SortOrder** (__NSCFNumber) - 1 examples
        - Example: `999`
    - **m:main** (__NSDictionaryM) - 1 examples
      - **Beginning** (__NSCFString) - 1 examples
        - Example: `int main(int argc, const char * argv[]) {`
      - **End** (NSTaggedPointerString) - 1 examples
        - Example: `}`
      - **Indent** (__NSCFNumber) - 1 examples
        - Example: `1`
    - **m:main:NSApplicationMain** (__NSCFString) - 1 examples
      - Example: `@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
}
return NSApplicationMain(argc, argv);`

### Description

- **Description** (__NSCFString) - 3 examples
  - Example: `A Transient App Entity.`

### HiddenFromChooser

- **HiddenFromChooser** (NSTaggedPointerString) - 3 examples
  - Example: `YES`
- **HiddenFromChooser** (__NSCFBoolean) - 3 examples
  - Example: `YES`

### HiddenFromLibrary

- **HiddenFromLibrary** (__NSCFBoolean) - 3 examples
  - Example: `YES`
- **HiddenFromLibrary** (NSTaggedPointerString) - 3 examples
  - Example: `YES`

### Icon

- **Icon** (__NSCFString) - 3 examples
  - Example: `TemplateIcon`

### Identifier

- **Identifier** (__NSCFString) - 3 examples
  - Example: `com.apple.dt.unit.externalBuildSystem`

### Image

- **Image** (__NSDictionaryM) - 3 examples
  - **BundleIdentifier** (__NSCFString) - 3 examples
    - Example: `com.apple.dt.IDEKit`
  - **BundleImageName** (__NSCFString) - 3 examples
    - Example: `unittest`
  - **BundleImageName** (NSTaggedPointerString) - 3 examples
    - Example: `unittest`
  - **FileTypeIcon** (__NSCFConstantString) - 3 examples
    - Example: `xcconfig`
  - **FileTypeIcon** (__NSCFString) - 3 examples
    - Example: `xcconfig`
  - **FileTypeIcon** (NSTaggedPointerString) - 3 examples
    - Example: `xcconfig`
  - **SystemSymbolName** (__NSCFString) - 3 examples
    - Example: `gearshape`
  - **SystemSymbolName** (NSTaggedPointerString) - 3 examples
    - Example: `gearshape`

### Kind

- **Kind** (__NSCFString) - 3 examples
  - Example: `Xcode.IDEIntentBuilderEditor.TransientAppEntityTemplateKind`

### LocalizedByDefault

- **LocalizedByDefault** (__NSCFBoolean) - 2 examples
  - Example: `1`

### MainTemplateFile

- **MainTemplateFile** (__NSCFString) - 3 examples
  - Example: `___FILEBASENAME___.swift`

### Name

- **Name** (NSTaggedPointerString) - 3 examples
  - Example: `Empty`
- **Name** (__NSCFString) - 3 examples
  - Example: `Empty`

### NameOfInitialFileForEditor

- **NameOfInitialFileForEditor** (__NSCFString) - 3 examples
  - Example: `manifest.json`

### Nodes

- **Nodes** (__NSArrayM) - 3 examples

### OptionConstraints

- **OptionConstraints** (__NSArrayM) - 3 examples

### OptionConstraints[]

  - **ConstraintType** (__NSCFString) - 3 examples
    - Example: `DefaultIfAssociatedTarget`
  - **Identifier** (__NSCFString) - 3 examples
    - Example: `productName`
  - **Value** (__NSCFString) - 3 examples
    - Example: `___ASSOCIATEDTARGET_bundleName___UITests`

### Options

- **Options** (__NSArrayM) - 3 examples

### Options[]

  - **Default** (__NSCFConstantString) - 3 examples
    - Example: `Grid Tile Set`
  - **Default** (NSTaggedPointerString) - 3 examples
    - Example: `Grid Tile Set`
  - **Default** (__NSCFString) - 3 examples
    - Example: `Grid Tile Set`
  - **Description** (__NSCFString) - 3 examples
    - Example: `Name of the unit test class`
  - **EmptyReplacement** (__NSCFConstantString) - 3 examples
    - Example: `ProductName`
  - **Identifier** (__NSCFString) - 3 examples
    - Example: `productName`
  - **Identifier** (NSTaggedPointerString) - 3 examples
    - Example: `productName`
  - **Name** (NSTaggedPointerString) - 3 examples
    - Example: `Class:`
  - **Name** (__NSCFString) - 3 examples
    - Example: `Class:`
  - **NotPersisted** (NSTaggedPointerString) - 3 examples
    - Example: `Yes`
  - **NotPersisted** (__NSCFBoolean) - 3 examples
    - Example: `Yes`
  - **Override** (__NSCFString) - 3 examples
    - Example: `Swift`
  - **Override** (NSTaggedPointerString) - 3 examples
    - Example: `Swift`
  - **Placeholder** (__NSCFString) - 1 examples
    - Example: `Your Company`
  - **Required** (__NSCFBoolean) - 3 examples
    - Example: `Yes`
  - **Required** (NSTaggedPointerString) - 3 examples
    - Example: `Yes`
  - **RequiredOptionsForValues** (__NSDictionaryM) - 3 examples
    - **None** (__NSDictionaryM) - 1 examples
      - **languageChoice** (NSTaggedPointerString) - 1 examples
        - Example: `Suppress`
    - **Swift Testing** (__NSDictionaryM) - 2 examples
      - **languageChoice** (NSTaggedPointerString) - 2 examples
        - Example: `Swift`
    - **SwiftData** (__NSDictionaryM) - 2 examples
      - **appLifecycle** (NSTaggedPointerString) - 2 examples
        - Example: `SwiftUI`
  - **SortOrder** (__NSCFNumber) - 3 examples
    - Example: `100`
  - **Type** (NSTaggedPointerString) - 3 examples
    - Example: `text`
  - **Units** (__NSDictionaryM) - 3 examples
    - **ForAppTemplate** (__NSDictionaryM) - 2 examples
      - **Targets** (__NSArrayM) - 2 examples
        - **SharedSettings** (__NSDictionaryM) - 2 examples
          - **PRODUCT_BUNDLE_IDENTIFIER** (__NSCFString) - 2 examples
            - Example: `___VARIABLE_bundleIdentifier:bundleIdentifier___.Extension`
    - **Metal** (__NSDictionaryM) - 1 examples
    - **Metal 4** (__NSDictionaryM) - 1 examples
      - **Components** (__NSArrayM) - 1 examples
        - **Identifier** (__NSCFString) - 1 examples
          - Example: `com.apple.dt.unit.crossPlatformMetal4Game_sharedComponent`
        - **Name** (__NSCFString) - 1 examples
          - Example: `___PACKAGENAME___ Shared`
      - **Components** (__NSArrayM) - 1 examples
        - **Identifier** (__NSCFString) - 1 examples
          - Example: `com.apple.dt.unit.crossPlatformMetalGame_sharedComponent`
        - **Name** (__NSCFString) - 1 examples
          - Example: `___PACKAGENAME___ Shared`
    - **Objective-C** (__NSDictionaryM) - 3 examples
      - **Definitions** (__NSDictionaryI) - 3 examples
      - **Definitions** (__NSDictionaryM) - 3 examples
        - ***:implementation:methods:awakeFromNib:super** (__NSCFString) - 2 examples
          - Example: `[super awakeFromNib];`
        - ***:implementation:methods:viewDidLoad:super** (__NSCFString) - 2 examples
          - Example: `[super viewDidLoad];
// Do any additional setup after loading the view.`
          - **h** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `AppDelegate.h`
            - **SortOrder** (__NSCFNumber) - 1 examples
              - Example: `1`
          - **h:interface:window** (__NSCFString) - 2 examples
            - Example: `@property (strong, nonatomic) UIWindow *window;
`
          - **m** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `AppDelegate.m`
            - **SortOrder** (__NSCFNumber) - 1 examples
              - Example: `2`
          - **m:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body** (__NSCFString) - 3 examples
            - Example: `return YES;`
          - **m:implementation:methods:applicationdidFinishLaunchingWithOptions:body** (__NSCFString) - 2 examples
            - Example: `// Override point for customization after application launch.`
          - **m:implementation:methods:applicationdidFinishLaunchingWithOptions:return** (__NSCFString) - 2 examples
            - Example: `return YES;`
          - **h** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `GameController.h`
            - **TargetIdentifiers** (__NSArray0) - 1 examples
          - **m** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `GameController.m`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **h** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `GameScene.h`
            - **TargetIdentifiers** (__NSArray0) - 1 examples
          - **m** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `GameScene.m`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **h** (__NSDictionaryM) - 3 examples
            - **Path** (__NSCFString) - 3 examples
              - Example: `SpriteKit_GameViewController.h`
          - **m** (__NSDictionaryM) - 3 examples
            - **New item** (__NSCFConstantString) - 2 examples
              - Example: ``
            - **Path** (__NSCFString) - 3 examples
              - Example: `SpriteKit_GameViewController.m`
          - **h** (__NSDictionaryM) - 2 examples
            - **Path** (NSTaggedPointerString) - 2 examples
              - Example: `Renderer.h`
            - **TargetIdentifiers** (__NSArray0) - 2 examples
          - **m** (__NSDictionaryM) - 2 examples
            - **Path** (NSTaggedPointerString) - 2 examples
              - Example: `Renderer.m`
            - **TargetIdentifiers** (__NSArrayM) - 2 examples
          - **h** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `SafariWebExtensionHandler.h`
          - **m** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `SafariWebExtensionHandler.m`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **h** (__NSDictionaryM) - 2 examples
            - **Path** (__NSCFString) - 2 examples
              - Example: `ShaderTypes.h`
          - **metal** (__NSDictionaryM) - 2 examples
            - **Path** (__NSCFString) - 2 examples
              - Example: `Shaders.metal`
            - **TargetIdentifiers** (__NSArrayM) - 2 examples
          - **h** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `ViewController.h`
          - **m** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `ViewController.m`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **m** (__NSDictionaryM) - 1 examples
            - **Path** (NSTaggedPointerString) - 1 examples
              - Example: `UITest.m`
          - **m** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `UITestLaunchTests.m`
          - **h** (__NSDictionaryM) - 1 examples
            - **BuildAttributes** (__NSArrayM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `Framework.h`
          - **m:main** (__NSDictionaryM) - 2 examples
            - **Beginning** (__NSCFString) - 2 examples
              - Example: `int main(int argc, char * argv[]) {`
            - **End** (NSTaggedPointerString) - 2 examples
              - Example: `}`
            - **Indent** (__NSCFNumber) - 2 examples
              - Example: `1`
          - **m:main:NSApplicationMain** (__NSCFString) - 1 examples
            - Example: `@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
}
return NSApplicationMain(argc, argv);`
          - **m:main:UIApplicationMain** (__NSCFString) - 2 examples
            - Example: `NSString * appDelegateClassName;
@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
    appDelegateClassName = NSStringFromClass([AppDelegate class]);
}
return UIApplicationMain(argc, argv, nil, appDelegateClassName);
`
      - **Nodes** (__NSArrayM) - 3 examples
      - **RequiredOptions** (__NSDictionaryM) - 2 examples
        - **appLifecycle** (NSTaggedPointerString) - 2 examples
          - Example: `Cocoa`
      - **Targets** (__NSArrayM) - 2 examples
        - **SharedSettings** (__NSDictionaryM) - 2 examples
          - **INFOPLIST_KEY_NSMainStoryboardFile** (NSTaggedPointerString) - 1 examples
            - Example: `Main`
          - **INFOPLIST_KEY_NSPrincipalClass** (__NSCFConstantString) - 1 examples
            - Example: `NSApplication`
          - **INFOPLIST_KEY_UILaunchStoryboardName** (__NSCFString) - 1 examples
            - Example: `LaunchScreen`
          - **INFOPLIST_KEY_UIMainStoryboardFile** (NSTaggedPointerString) - 1 examples
            - Example: `Main`
        - **TargetIdentifier** (__NSCFString) - 2 examples
          - Example: `com.apple.dt.iosApplicationTarget`
    - **RealityKit** (__NSDictionaryM) - 1 examples
      - **Components** (__NSArrayM) - 1 examples
        - **Identifier** (__NSCFString) - 1 examples
          - Example: `com.apple.dt.unit.crossPlatformRealityKitGame`
        - **Name** (__NSCFString) - 1 examples
          - Example: `___PACKAGENAME___`
    - **Renderer** (__NSArrayM) - 1 examples
      - **Definitions** (__NSDictionaryM) - 1 examples
          - **swift** (__NSDictionaryM) - 1 examples
            - **OmitFromProjectStructure** (__NSCFBoolean) - 1 examples
              - Example: `1`
            - **Path** (__NSCFString) - 1 examples
              - Example: `Metal/Mixed-Full/Renderer.swift`
      - **Nodes** (__NSArrayM) - 1 examples
      - **RequiredOptions** (__NSDictionaryM) - 1 examples
        - **immersiveSpaceStyle** (NSTaggedPointerString) - 1 examples
          - Example: `Full`
        - **secondarySceneType** (NSTaggedPointerString) - 1 examples
          - Example: `Metal`
    - **SceneKit** (__NSDictionaryM) - 1 examples
      - **Components** (__NSArrayM) - 1 examples
        - **Identifier** (__NSCFString) - 1 examples
          - Example: `com.apple.dt.unit.crossPlatformSceneKitGame_sharedComponent`
        - **Name** (__NSCFString) - 1 examples
          - Example: `___PACKAGENAME___ Shared`
    - **SpriteKit** (__NSDictionaryM) - 1 examples
      - **Components** (__NSArrayM) - 1 examples
        - **Identifier** (__NSCFString) - 1 examples
          - Example: `com.apple.dt.unit.crossPlatformSpriteKitGame_sharedComponent`
        - **Name** (__NSCFString) - 1 examples
          - Example: `___PACKAGENAME___ Shared`
    - **Swift** (__NSDictionaryM) - 3 examples
    - **Swift Testing** (__NSDictionaryM) - 1 examples
      - **Definitions** (__NSDictionaryM) - 1 examples
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `UnitTest-SwiftTesting.swift`
      - **Nodes** (__NSArrayM) - 1 examples
      - **Definitions** (__NSDictionaryM) - 3 examples
        - ***:class:*** (__NSCFConstantString) - 1 examples
          - Example: ``
        - ***:implementation** (__NSDictionaryM) - 1 examples
          - **Beginning** (__NSCFString) - 1 examples
            - Example: `class ___*___ {
`
          - **End** (NSTaggedPointerString) - 1 examples
            - Example: `
}
`
          - **Indent** (__NSCFNumber) - 1 examples
            - Example: `1`
        - ***:implementation:methods:awakeFromNib:super** (__NSCFString) - 2 examples
          - Example: `super.awakeFromNib()`
        - ***:implementation:methods:init** (__NSDictionaryM) - 1 examples
          - **Beginning** (__NSCFString) - 1 examples
            - Example: `override init() {
    super.init()
`
          - **End** (NSTaggedPointerString) - 1 examples
            - Example: `}

`
          - **Indent** (__NSCFNumber) - 1 examples
            - Example: `1`
        - ***:implementation:methods:viewDidLoad:super** (__NSCFString) - 2 examples
          - Example: `super.viewDidLoad()
// Do any additional setup after loading the view.`
        - ***:imports:importFramework:*** (__NSCFString) - 1 examples
          - Example: `import ___*___`
        - ***:imports:importHeader:*** (__NSCFConstantString) - 1 examples
          - Example: ``
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `AppDelegate.swift`
            - **SortOrder** (__NSCFNumber) - 1 examples
              - Example: `1`
          - **swift:NSApplicationMain** (NSTaggedPointerString) - 1 examples
            - Example: `@main`
          - **swift:UIApplicationMain** (NSTaggedPointerString) - 2 examples
            - Example: `@main`
          - **swift:implementation:methods:applicationShouldTerminateAfterLastWindowClosed:body** (NSTaggedPointerString) - 3 examples
            - Example: `return true`
          - **swift:implementation:methods:applicationdidFinishLaunchingWithOptions:body** (__NSCFString) - 2 examples
            - Example: `// Override point for customization after application launch.`
          - **swift:implementation:methods:applicationdidFinishLaunchingWithOptions:return** (NSTaggedPointerString) - 2 examples
            - Example: `return true`
          - **swift:implementation:properties:window** (__NSCFString) - 2 examples
            - Example: `var window: UIWindow?`
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `GameController.swift`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `GameScene.swift`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **swift** (__NSDictionaryM) - 3 examples
            - **Path** (__NSCFString) - 3 examples
              - Example: `SpriteKit_GameViewController.swift`
          - **swift** (__NSDictionaryM) - 2 examples
            - **Path** (__NSCFString) - 2 examples
              - Example: `Renderer.swift`
            - **TargetIdentifiers** (__NSArrayM) - 2 examples
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `SafariWebExtensionHandler.swift`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **h** (__NSDictionaryM) - 2 examples
            - **Path** (__NSCFString) - 2 examples
              - Example: `ShaderTypes.h`
            - **TargetIdentifiers** (__NSArrayM) - 2 examples
          - **metal** (__NSDictionaryM) - 2 examples
            - **Path** (__NSCFString) - 2 examples
              - Example: `Shaders.metal`
            - **TargetIdentifiers** (__NSArrayM) - 2 examples
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `ViewController.swift`
            - **TargetIdentifiers** (__NSArrayM) - 1 examples
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `UITest.swift`
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `UITestLaunchTests.swift`
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `Framework.swift`
          - **swift** (__NSDictionaryM) - 1 examples
            - **SortOrder** (__NSCFNumber) - 1 examples
              - Example: `999`
          - **swift:main** (__NSDictionaryM) - 1 examples
            - **Beginning** (__NSCFConstantString) - 1 examples
              - Example: ``
            - **End** (__NSCFConstantString) - 1 examples
              - Example: ``
      - **Nodes** (__NSArrayM) - 3 examples
      - **Project** (__NSDictionaryM) - 1 examples
        - **Configurations** (__NSDictionaryM) - 1 examples
          - **Debug** (__NSDictionaryM) - 1 examples
            - **SWIFT_ACTIVE_COMPILATION_CONDITIONS** (__NSCFString) - 1 examples
              - Example: `DEBUG $(inherited)`
            - **SWIFT_OPTIMIZATION_LEVEL** (NSTaggedPointerString) - 1 examples
              - Example: `-Onone`
          - **Release** (__NSDictionaryM) - 1 examples
            - **SWIFT_COMPILATION_MODE** (__NSCFString) - 1 examples
              - Example: `wholemodule`
      - **RequiredOptions** (__NSDictionaryM) - 2 examples
        - **appLifecycle** (NSTaggedPointerString) - 2 examples
          - Example: `Cocoa`
      - **Targets** (__NSArrayM) - 3 examples
        - **Concrete** (__NSCFBoolean) - 2 examples
          - Example: `0`
        - **SharedSettings** (__NSDictionaryM) - 3 examples
          - **INFOPLIST_KEY_NSMainStoryboardFile** (NSTaggedPointerString) - 1 examples
            - Example: `Main`
          - **INFOPLIST_KEY_NSPrincipalClass** (__NSCFConstantString) - 1 examples
            - Example: `NSApplication`
          - **INFOPLIST_KEY_UILaunchStoryboardName** (__NSCFString) - 1 examples
            - Example: `LaunchScreen`
          - **INFOPLIST_KEY_UIMainStoryboardFile** (NSTaggedPointerString) - 1 examples
            - Example: `Main`
          - **SWIFT_APPROACHABLE_CONCURRENCY** (NSTaggedPointerString) - 1 examples
            - Example: `YES`
          - **SWIFT_DEFAULT_ACTOR_ISOLATION** (NSTaggedPointerString) - 1 examples
            - Example: `MainActor`
          - **SWIFT_OBJC_BRIDGING_HEADER** (__NSCFString) - 3 examples
            - Example: `___PARENTPACKAGENAME___ Shared/ShaderTypes.h`
          - **SWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY** (NSTaggedPointerString) - 1 examples
            - Example: `YES`
          - **SWIFT_VERSION** (NSTaggedPointerString) - 1 examples
            - Example: `5.0`
        - **TargetIdentifier** (__NSCFString) - 2 examples
          - Example: `com.apple.dt.iosApplicationTarget`
    - **SwiftData** (__NSArrayM) - 2 examples
      - **Targets** (__NSArrayM) - 2 examples
        - **SharedSettings** (__NSDictionaryI) - 2 examples
        - **TargetIdentifier** (__NSCFString) - 2 examples
          - Example: `com.apple.dt.applicationTarget`
    - **XCTest** (__NSDictionaryM) - 1 examples
      - **Definitions** (__NSDictionaryM) - 1 examples
          - **swift** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `UnitTest-XCTest.swift`
      - **Nodes** (__NSArrayM) - 1 examples
      - **RequiredOptions** (__NSDictionaryM) - 1 examples
        - **languageChoice** (NSTaggedPointerString) - 1 examples
          - Example: `Swift`
    - **true** (__NSDictionaryM) - 1 examples
      - **Definitions** (__NSDictionaryM) - 1 examples
          - **docc** (__NSDictionaryM) - 1 examples
            - **Path** (__NSCFString) - 1 examples
              - Example: `___PACKAGENAMEASIDENTIFIER___.docc`
            - **SortOrder** (__NSCFNumber) - 1 examples
              - Example: `99`
      - **Nodes** (__NSArrayM) - 1 examples
  - **Value** (NSTaggedPointerString) - 1 examples
    - Example: `XCTest`
  - **ValueTitles** (__NSArrayM) - 3 examples
  - **Values** (__NSArrayM) - 3 examples
  - **Values** (__NSArray0) - 3 examples
  - **Variables** (__NSDictionaryI) - 2 examples
  - **Variables** (__NSDictionaryM) - 2 examples
    - **Objective-C** (__NSDictionaryM) - 1 examples
      - **ibCustomModuleProvider** (__NSCFConstantString) - 1 examples
        - Example: ``
      - **moduleNamePrefixForClasses** (__NSCFConstantString) - 1 examples
        - Example: ``
    - **Swift** (__NSDictionaryM) - 1 examples
      - **ibCustomModuleProvider** (NSTaggedPointerString) - 1 examples
        - Example: `target`
      - **moduleNamePrefixForClasses** (__NSCFString) - 1 examples
        - Example: `$(PRODUCT_MODULE_NAME).`

### PackageType

- **PackageType** (__NSCFString) - 3 examples
  - Example: `swift-macro`
- **PackageType** (NSTaggedPointerString) - 3 examples
  - Example: `swift-macro`

### Platforms

- **Platforms** (__NSArrayM) - 3 examples
- **Platforms** (__NSArray0) - 3 examples

### Project

- **Project** (__NSDictionaryM) - 3 examples
  - **Configurations** (__NSDictionaryM) - 3 examples
    - **Debug** (__NSDictionaryI) - 3 examples
    - **Debug** (__NSDictionaryM) - 3 examples
      - **DEBUG_INFORMATION_FORMAT** (NSTaggedPointerString) - 1 examples
        - Example: `dwarf`
      - **ENABLE_TESTABILITY** (NSTaggedPointerString) - 1 examples
        - Example: `YES`
      - **GCC_DYNAMIC_NO_PIC** (NSTaggedPointerString) - 1 examples
        - Example: `NO`
      - **GCC_OPTIMIZATION_LEVEL** (NSTaggedPointerString) - 1 examples
        - Example: `0`
      - **GCC_PREPROCESSOR_DEFINITIONS** (__NSCFString) - 1 examples
        - Example: `DEBUG=1 $(inherited)`
      - **MTL_ENABLE_DEBUG_INFO** (__NSCFString) - 2 examples
        - Example: `INCLUDE_SOURCE`
      - **ONLY_ACTIVE_ARCH** (NSTaggedPointerString) - 1 examples
        - Example: `YES`
    - **Release** (__NSDictionaryI) - 3 examples
    - **Release** (__NSDictionaryM) - 3 examples
      - **DEBUG_INFORMATION_FORMAT** (__NSCFString) - 1 examples
        - Example: `dwarf-with-dsym`
      - **ENABLE_NS_ASSERTIONS** (NSTaggedPointerString) - 1 examples
        - Example: `NO`
      - **MTL_ENABLE_DEBUG_INFO** (NSTaggedPointerString) - 2 examples
        - Example: `NO`
  - **SharedSettings** (__NSDictionaryM) - 3 examples
    - **ALWAYS_SEARCH_USER_PATHS** (NSTaggedPointerString) - 2 examples
      - Example: `NO`
    - **ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_ANALYZER_NONNULL** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION** (__NSCFString) - 1 examples
      - Example: `YES_AGGRESSIVE`
    - **CLANG_CXX_LANGUAGE_STANDARD** (NSTaggedPointerString) - 1 examples
      - Example: `gnu++20`
    - **CLANG_ENABLE_MODULES** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_ENABLE_OBJC_ARC** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_ENABLE_OBJC_WEAK** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_BOOL_CONVERSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_COMMA** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_CONSTANT_CONVERSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_DIRECT_OBJC_ISA_USAGE** (NSTaggedPointerString) - 1 examples
      - Example: `YES_ERROR`
    - **CLANG_WARN_DOCUMENTATION_COMMENTS** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_EMPTY_BODY** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_ENUM_CONVERSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_INFINITE_RECURSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_INT_CONVERSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_NON_LITERAL_NULL_CONVERSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_OBJC_LITERAL_CONVERSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_OBJC_ROOT_CLASS** (NSTaggedPointerString) - 1 examples
      - Example: `YES_ERROR`
    - **CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_RANGE_LOOP_ANALYSIS** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_STRICT_PROTOTYPES** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_SUSPICIOUS_MOVE** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN_UNGUARDED_AVAILABILITY** (__NSCFString) - 1 examples
      - Example: `YES_AGGRESSIVE`
    - **CLANG_WARN_UNREACHABLE_CODE** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CLANG_WARN__DUPLICATE_METHOD_MATCH** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **COPY_PHASE_STRIP** (NSTaggedPointerString) - 1 examples
      - Example: `NO`
    - **CURRENT_PROJECT_VERSION** (NSTaggedPointerString) - 1 examples
      - Example: `1`
    - **ENABLE_STRICT_OBJC_MSGSEND** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **ENABLE_USER_SCRIPT_SANDBOXING** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **GCC_C_LANGUAGE_STANDARD** (NSTaggedPointerString) - 1 examples
      - Example: `gnu17`
    - **GCC_NO_COMMON_BLOCKS** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **GCC_WARN_64_TO_32_BIT_CONVERSION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **GCC_WARN_ABOUT_RETURN_TYPE** (NSTaggedPointerString) - 1 examples
      - Example: `YES_ERROR`
    - **GCC_WARN_UNDECLARED_SELECTOR** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **GCC_WARN_UNINITIALIZED_AUTOS** (__NSCFString) - 1 examples
      - Example: `YES_AGGRESSIVE`
    - **GCC_WARN_UNUSED_FUNCTION** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **GCC_WARN_UNUSED_VARIABLE** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **IPHONEOS_DEPLOYMENT_TARGET** (NSTaggedPointerString) - 2 examples
      - Example: `15.0`
    - **LOCALIZATION_PREFERS_STRING_CATALOGS** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **MACOSX_DEPLOYMENT_TARGET** (NSTaggedPointerString) - 2 examples
      - Example: `10.14`
    - **MTL_FAST_MATH** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **VERSIONING_SYSTEM** (__NSCFString) - 1 examples
      - Example: `apple-generic`
    - **VERSION_INFO_PREFIX** (__NSCFConstantString) - 1 examples
      - Example: ``

### ProjectOnly

- **ProjectOnly** (__NSCFBoolean) - 1 examples
  - Example: `1`

### SortOrder

- **SortOrder** (NSTaggedPointerString) - 3 examples
  - Example: `1`
- **SortOrder** (__NSCFNumber) - 3 examples
  - Example: `1`

### Summary

- **Summary** (__NSCFString) - 3 examples
  - Example: `A Transient App Entity`

### SupportsSwiftPackage

- **SupportsSwiftPackage** (__NSCFBoolean) - 3 examples
  - Example: `1`

### SuppressTopLevelGroup

- **SuppressTopLevelGroup** (__NSCFBoolean) - 2 examples
  - Example: `1`

### TargetOnly

- **TargetOnly** (__NSCFBoolean) - 3 examples
  - Example: `1`

### Targets

- **Targets** (__NSArrayM) - 3 examples

### Targets[]

  - **BuildPhases** (__NSArrayM) - 3 examples
    - **Class** (NSTaggedPointerString) - 3 examples
      - Example: `Sources`
  - **BuildToolArgsString** (__NSCFString) - 1 examples
    - Example: `$(ACTION)`
  - **BuildToolPath** (__NSCFString) - 1 examples
    - Example: `___VARIABLE_buildToolPath___`
  - **Concrete** (__NSCFBoolean) - 3 examples
    - Example: `0`
  - **Configurations** (__NSDictionaryM) - 3 examples
    - **Debug** (__NSDictionaryI) - 3 examples
    - **Debug** (__NSDictionaryM) - 3 examples
      - **DEBUGGING_SYMBOLS** (NSTaggedPointerString) - 1 examples
        - Example: `YES`
      - **DEBUG_INFORMATION_FORMAT** (NSTaggedPointerString) - 1 examples
        - Example: `dwarf`
      - **GCC_GENERATE_DEBUGGING_SYMBOLS** (NSTaggedPointerString) - 1 examples
        - Example: `YES`
      - **GCC_OPTIMIZATION_LEVEL** (NSTaggedPointerString) - 1 examples
        - Example: `0`
    - **Release** (__NSDictionaryM) - 3 examples
    - **Release** (__NSDictionaryI) - 3 examples
      - **DEBUG_INFORMATION_FORMAT** (__NSCFString) - 1 examples
        - Example: `dwarf-with-dsym`
      - **VALIDATE_PRODUCT** (NSTaggedPointerString) - 2 examples
        - Example: `YES`
  - **Frameworks** (__NSArrayM) - 2 examples
  - **Frameworks** (__NSArray0) - 2 examples
  - **Name** (__NSCFString) - 3 examples
    - Example: `___PACKAGENAME___`
  - **ProductType** (__NSCFString) - 3 examples
    - Example: `com.apple.product-type.bundle.unit-test`
  - **SharedSettings** (__NSDictionaryM) - 3 examples
    - **ALLOW_TARGET_PLATFORM_SPECIALIZATION** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **ASSETCATALOG_COMPILER_APPICON_NAME** (__NSCFString) - 3 examples
      - Example: `AppIcon`
    - **ASSETCATALOG_COMPILER_APPICON_NAME** (NSTaggedPointerString) - 3 examples
      - Example: `AppIcon`
    - **ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME** (__NSCFString) - 3 examples
      - Example: `AccentColor`
    - **ASSETCATALOG_COMPILER_WIDGET_BACKGROUND_COLOR_NAME** (__NSCFString) - 1 examples
      - Example: `WidgetBackground`
    - **CLANG_CXX_LANGUAGE_STANDARD** (NSTaggedPointerString) - 1 examples
      - Example: `c++20`
    - **CLANG_CXX_LIBRARY** (NSTaggedPointerString) - 1 examples
      - Example: `libc++`
    - **CODE_SIGN_ENTITLEMENTS** (__NSCFString) - 2 examples
      - Example: ``
    - **CODE_SIGN_ENTITLEMENTS** (__NSCFConstantString) - 2 examples
      - Example: ``
    - **COMBINE_HIDPI_IMAGES** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **CURRENT_PROJECT_VERSION** (NSTaggedPointerString) - 1 examples
      - Example: `1`
    - **DYLIB_COMPATIBILITY_VERSION** (NSTaggedPointerString) - 1 examples
      - Example: `1`
    - **DYLIB_CURRENT_VERSION** (NSTaggedPointerString) - 1 examples
      - Example: `1`
    - **DYLIB_INSTALL_NAME_BASE** (NSTaggedPointerString) - 1 examples
      - Example: `@rpath`
    - **ENABLE_APP_SANDBOX** (NSTaggedPointerString) - 3 examples
      - Example: `YES`
    - **ENABLE_HARDENED_RUNTIME** (NSTaggedPointerString) - 3 examples
      - Example: `YES`
    - **ENABLE_MODULE_VERIFIER** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **ENABLE_OUTGOING_NETWORK_CONNECTIONS** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **ENABLE_PREVIEWS** (NSTaggedPointerString) - 3 examples
      - Example: `YES`
    - **ENABLE_USER_SELECTED_FILES** (NSTaggedPointerString) - 3 examples
      - Example: `readonly`
    - **GENERATE_INFOPLIST_FILE** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **INFOPLIST_FILE** (__NSCFString) - 3 examples
      - Example: `___PACKAGENAME___/Info.plist`
    - **INFOPLIST_KEY_CFBundleDisplayName** (__NSCFString) - 3 examples
      - Example: `___PARENTPACKAGENAME___`
    - **INFOPLIST_KEY_NSCameraUsageDescription** (__NSCFString) - 1 examples
      - Example: `CAMERA_USAGE_DESCRIPTION`
    - **INFOPLIST_KEY_NSHumanReadableCopyright** (__NSCFString) - 3 examples
      - Example: `___COPYRIGHT___`
    - **INFOPLIST_KEY_NSMainStoryboardFile** (NSTaggedPointerString) - 1 examples
      - Example: `Main`
    - **INFOPLIST_KEY_NSPrincipalClass** (__NSCFConstantString) - 1 examples
      - Example: `NSApplication`
    - **INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphoneos*]** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphonesimulator*]** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphoneos*]** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphonesimulator*]** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphonesimulator*]** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UILaunchStoryboardName** (__NSCFString) - 2 examples
      - Example: `LaunchScreen`
    - **INFOPLIST_KEY_UIMainStoryboardFile** (NSTaggedPointerString) - 2 examples
      - Example: `Main`
    - **INFOPLIST_KEY_UIStatusBarHidden** (NSTaggedPointerString) - 3 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UIStatusBarStyle[sdk=iphoneos*]** (__NSCFString) - 2 examples
      - Example: `UIStatusBarStyleDefault`
    - **INFOPLIST_KEY_UIStatusBarStyle[sdk=iphonesimulator*]** (__NSCFString) - 2 examples
      - Example: `UIStatusBarStyleDefault`
    - **INFOPLIST_KEY_UISupportedInterfaceOrientations** (__NSCFString) - 1 examples
      - Example: `UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight`
    - **INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad** (__NSCFString) - 3 examples
      - Example: `UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight`
    - **INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone** (__NSCFString) - 3 examples
      - Example: `UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight`
    - **INFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphoneos*]** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UISupportsDocumentBrowser[sdk=iphonesimulator*]** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **INFOPLIST_KEY_UIUserInterfaceStyle** (NSTaggedPointerString) - 1 examples
      - Example: `Automatic`
    - **INSTALL_PATH** (__NSCFString) - 1 examples
      - Example: `$(LOCAL_LIBRARY_DIR)/Frameworks`
    - **IPHONEOS_DEPLOYMENT_TARGET** (__NSCFString) - 2 examples
      - Example: `latest_iphoneos`
    - **LD_RUNPATH_SEARCH_PATHS** (__NSCFString) - 3 examples
      - Example: `$(inherited) @executable_path/Frameworks`
    - **LD_RUNPATH_SEARCH_PATHS[sdk=macosx*]** (__NSCFString) - 3 examples
      - Example: `@executable_path/../Frameworks`
    - **MACOSX_DEPLOYMENT_TARGET** (__NSCFString) - 2 examples
      - Example: `___BESTMACOSVERSION___`
    - **MARKETING_VERSION** (NSTaggedPointerString) - 1 examples
      - Example: `1.0`
    - **MODULE_VERIFIER_SUPPORTED_LANGUAGES** (__NSCFString) - 1 examples
      - Example: `objective-c objective-c++`
    - **MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS** (__NSCFString) - 1 examples
      - Example: `gnu17 gnu++20`
    - **OTHER_CFLAGS** (__NSCFConstantString) - 1 examples
      - Example: ``
    - **OTHER_LDFLAGS** (__NSCFConstantString) - 3 examples
      - Example: ``
    - **OTHER_LDFLAGS** (__NSCFString) - 3 examples
      - Example: ``
    - **PRODUCT_BUNDLE_IDENTIFIER** (__NSCFString) - 3 examples
      - Example: `___VARIABLE_bundleIdentifierPrefix:bundleIdentifier___.___VARIABLE_productName:RFC1034Identifier___`
    - **PRODUCT_NAME** (__NSCFString) - 3 examples
      - Example: `$(TARGET_NAME)`
    - **REGISTER_APP_GROUPS** (NSTaggedPointerString) - 3 examples
      - Example: `YES`
    - **RUN_CLANG_STATIC_ANALYZER** (NSTaggedPointerString) - 1 examples
      - Example: `YES`
    - **SDKROOT** (NSTaggedPointerString) - 3 examples
      - Example: `appletvos`
    - **SKIP_INSTALL** (NSTaggedPointerString) - 2 examples
      - Example: `YES`
    - **STRING_CATALOG_GENERATE_SYMBOLS** (NSTaggedPointerString) - 3 examples
      - Example: `NO`
    - **SUPPORTED_PLATFORMS** (__NSCFString) - 2 examples
      - Example: `iphoneos iphonesimulator macosx appletvos appletvsimulator xros xrsimulator`
    - **SWIFT_EMIT_LOC_STRINGS** (NSTaggedPointerString) - 3 examples
      - Example: `NO`
    - **SWIFT_OBJC_BRIDGING_HEADER** (__NSCFString) - 1 examples
      - Example: `___PACKAGENAME___/Common/___PACKAGENAMEASIDENTIFIER___-Bridging-Header.h`
    - **SWIFT_OBJC_INTEROP_MODE** (NSTaggedPointerString) - 1 examples
      - Example: `objcxx`
    - **TARGETED_DEVICE_FAMILY** (NSTaggedPointerString) - 3 examples
      - Example: `1,2`
    - **TVOS_DEPLOYMENT_TARGET** (__NSCFString) - 2 examples
      - Example: `latest_appletvos`
    - **VERSIONING_SYSTEM** (__NSCFConstantString) - 1 examples
      - Example: ``
    - **XROS_DEPLOYMENT_TARGET** (__NSCFString) - 1 examples
      - Example: `latest_xros`
  - **TargetIdentifier** (__NSCFString) - 3 examples
    - Example: `com.apple.dt.cocoaLegacyTarget`
  - **TargetIdentifierToBeTested** (__NSCFString) - 3 examples
    - Example: `com.apple.dt.iosApplicationTarget`
  - **TargetType** (NSTaggedPointerString) - 2 examples
    - Example: `Legacy`

### Title

- **Title** (__NSCFString) - 3 examples
  - Example: `macOS Window Template`

## Statistics

- Total field paths: 652
- Top-level fields: 37
- Templates scanned: 100

## Field Types Distribution
- __NSCFString: 198 fields
- NSTaggedPointerString: 163 fields
- __NSDictionaryM: 136 fields
- __NSArrayM: 68 fields
- __NSCFConstantString: 24 fields
- __NSCFNumber: 23 fields
- __NSCFBoolean: 22 fields
- __NSArray0: 10 fields
- __NSDictionaryI: 8 fields
