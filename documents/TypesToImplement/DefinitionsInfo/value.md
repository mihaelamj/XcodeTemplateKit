# DefinitionsInfo - Field Values

## Fields

### Leaf Fields (Primitive Types)

- **plist:EXAppExtensionAttributes** (`String`)
  - Example: `<key>EXAppExtensionAttributes</key>
    <dict>
        <key>EXExtensionPointIdentifier</key>
        <string>com.example.example-extension</string>
    </dict>
`
  - From: Generic Extension.xctemplate

- **plist:NSExtension** (`String`)
  - Example: `<key>NSExtension</key>
<dict>
    <key>NSExtensionPointIdentifier</key>
    <string>com.apple.widgetkit-extension</string>
</dict>
`
  - From: Widget Extension.xctemplate

- **plist:UIApplicationSceneManifest:UISceneStoryboardFile** (`String`)
  - Example: `
<key>UISceneStoryboardFile</key>
<string>Main</string>
`
  - From: iOS Safari Extension App.xctemplate

- **plist:XPCService** (`String`)
  - Example: ``
  - From: ExtensionKit Extension Base.xctemplate


### Complex Fields (Nested Types)

- **plist** (`Dictionary`)
  - Nested type required

- **plist:UIApplicationSceneManifest** (`Dictionary`)
  - Nested type required

