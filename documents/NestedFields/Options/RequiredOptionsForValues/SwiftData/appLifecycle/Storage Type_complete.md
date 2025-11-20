# appLifecycle - Complete Context

**Template**: Storage Type.xctemplate
**Field Path**: `Options[].RequiredOptionsForValues.SwiftData.appLifecycle`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Identifier</key>
	<string>com.apple.dt.unit.storageType</string>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Options</key>
	<array>
		<dict>
			<key>Default</key>
			<string>None</string>
			<key>Description</key>
			<string>The mechanism to use for your application’s persistent storage.</string>
			<key>Identifier</key>
			<string>storageType</string>
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
				<string>Core Data</string>
			</array>
		</dict>
		<dict>
			<key>Default</key>
			<string>false</string>
			<key>Description</key>
			<string>Whether to host your application’s persistent data in CloudKit.</string>
			<key>Identifier</key>
			<string>hostInCloudKit</string>
			<key>Name</key>
			<string>Host in CloudKit</string>
			<key>RequiredOptions</key>
			<dict>
				<key>storageType</key>
				<array>
					<string>Core Data</string>
					<string>SwiftData</string>
				</array>
			</dict>
			<key>SortOrder</key>
			<integer>201</integer>
			<key>Type</key>
			<string>checkbox</string>
			<key>Values</key>
			<array>
				<string>false</string>
				<string>true</string>
			</array>
			<key>Variables</key>
			<dict>
				<key>false</key>
				<dict>
					<key>persistentContainerClass</key>
					<string>NSPersistentContainer</string>
					<key>usedWithCloudKitModelAttribute</key>
					<string>false</string>
				</dict>
				<key>true</key>
				<dict>
					<key>persistentContainerClass</key>
					<string>NSPersistentCloudKitContainer</string>
					<key>usedWithCloudKitModelAttribute</key>
					<string>true</string>
				</dict>
			</dict>
		</dict>
	</array>
</dict>
</plist>
```
