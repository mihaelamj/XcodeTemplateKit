# RequiredOptionsForValues - Complete Context

**Template**: Storage Type Document.xctemplate
**Field Path**: `Options[].RequiredOptionsForValues`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Identifier</key>
	<string>com.apple.dt.unit.storageType.document-app</string>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Options</key>
	<array>
		<dict>
			<key>Default</key>
			<string>None</string>
			<key>Description</key>
			<string>The mechanism to use for your application’s document storage.</string>
			<key>Identifier</key>
			<string>storageTypeDocument</string>
			<key>Name</key>
			<string>Storage:</string>
			<key>RequiredOptionsForValues</key>
			<dict>
				<key>SwiftData</key>
				<dict>
					<key>appLifecycle</key>
					<string>SwiftUI</string>
				</dict>
			</dict>
			<key>SortOrder</key>
			<integer>200</integer>
			<key>Type</key>
			<string>popup</string>
			<key>Values</key>
			<array>
				<string>None</string>
				<string>SwiftData</string>
			</array>
		</dict>
	</array>
</dict>
</plist>
```
