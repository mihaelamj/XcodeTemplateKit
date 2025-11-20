# Override - Complete Context

**Template**: visionOS App.xctemplate
**Field Path**: `Options[].Override`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Ancestors</key>
	<array/>
	<key>Identifier</key>
	<string>com.apple.dt.unit.crossPlatform.visionOS.base</string>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Options</key>
	<array>
		<dict>
			<key>Identifier</key>
			<string>languageChoice</string>
			<key>Override</key>
			<string>Swift</string>
		</dict>
		<dict>
			<key>Identifier</key>
			<string>appLifecycle</string>
			<key>Override</key>
			<string>SwiftUI</string>
		</dict>
		<dict>
			<key>Identifier</key>
			<string>storageType</string>
			<key>Override</key>
			<string>None</string>
		</dict>
		<dict>
			<key>Identifier</key>
			<string>hostInCloudKit</string>
			<key>Override</key>
			<string>false</string>
		</dict>
		<dict>
			<key>Description</key>
			<string>The type of user interface.</string>
			<key>Identifier</key>
			<string>userInterface</string>
			<key>Override</key>
			<string>SwiftUI</string>
		</dict>
	</array>
</dict>
</plist>
```
