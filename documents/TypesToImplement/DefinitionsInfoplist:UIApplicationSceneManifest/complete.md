# DefinitionsInfoplist:UIApplicationSceneManifest - Complete Type Specification

## Type Name
`DefinitionsInfoplist:UIApplicationSceneManifest`

## Field Count
3 fields

## Swift Type Definition (Proposed)

```swift
extension Template.Model {
    public struct DefinitionsInfoplist:UIApplicationSceneManifest: Codable, Hashable, Sendable {
            public let beginning: String?
            public let end: String?
            public let indent: Int?
    }
}
```

## Example Values
From template: **iOS Safari Extension App.xctemplate**

### Beginning
```

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

```

### End
```

                        </dict>
                    </array>
                </dict>
            </dict>

```

### Indent
```
2
```

