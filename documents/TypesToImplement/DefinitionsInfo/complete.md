# DefinitionsInfo - Complete Type Specification

## Type Name
`DefinitionsInfo`

## Field Count
6 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsInfo: Codable, Hashable, Sendable {
            public let plist:EXAppExtensionAttributes: String?
            public let plist:NSExtension: String
            public let plist:UIApplicationSceneManifest:UISceneStoryboardFile: String?
            public let plist:XPCService: String
            public let plist: DefinitionsInfoplist?
            public let plist:UIApplicationSceneManifest: DefinitionsInfoplist:UIApplicationSceneManifest?
    }
}
```

## Example Values
From template: **Widget Extension.xctemplate**

### plist
```
{
    Beginning = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n";
    End = "</dict>\n</plist>";
    Indent = 1;
    SortOrder = 200;
    SubstituteMacros = 1;
    TargetIdentifiers =     (
    );
}
```

### plist:EXAppExtensionAttributes
```
<key>EXAppExtensionAttributes</key>
    <dict>
        <key>EXExtensionPointIdentifier</key>
        <string>com.example.example-extension</string>
    </dict>

```

### plist:NSExtension
```
<key>NSExtension</key>
<dict>
    <key>NSExtensionPointIdentifier</key>
    <string>com.apple.widgetkit-extension</string>
</dict>

```

### plist:UIApplicationSceneManifest
```
{
    Beginning = "\n            <key>UIApplicationSceneManifest</key>\n            <dict>\n                <key>UIApplicationSupportsMultipleScenes</key>\n                <false/>\n                <key>UISceneConfigurations</key>\n                <dict>\n                    <key>UIWindowSceneSessionRoleApplication</key>\n                    <array>\n                        <dict>\n                            <key>UISceneConfigurationName</key>\n                            <string>Default Configuration</string>\n                            <key>UISceneDelegateClassName</key>\n                            <string>___VARIABLE_moduleNamePrefixForClasses:XML___SceneDelegate</string>\n";
    End = "\n                        </dict>\n                    </array>\n                </dict>\n            </dict>\n";
    Indent = 2;
}
```

### plist:UIApplicationSceneManifest:UISceneStoryboardFile
```

<key>UISceneStoryboardFile</key>
<string>Main</string>

```

### plist:XPCService
```

```

