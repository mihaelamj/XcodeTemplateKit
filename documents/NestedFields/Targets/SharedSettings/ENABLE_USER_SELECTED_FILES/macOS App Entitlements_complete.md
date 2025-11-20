# ENABLE_USER_SELECTED_FILES - Complete Context

**Template**: macOS App Entitlements.xctemplate
**Field Path**: `Targets[].SharedSettings.ENABLE_USER_SELECTED_FILES`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Identifier</key>
	<string>com.apple.dt.unit.crossPlatformAppEntitlements_OSX</string>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Platforms</key>
	<array>
		<string>com.apple.platform.macosx</string>
	</array>
	<key>Targets</key>
	<array>
		<dict>
			<key>SharedSettings</key>
			<dict>
				<key>ENABLE_APP_SANDBOX</key>
				<string>YES</string>
				<key>ENABLE_USER_SELECTED_FILES</key>
				<string>readonly</string>
			</dict>
			<key>TargetIdentifier</key>
			<string>com.apple.dt.osxApplicationTarget</string>
		</dict>
	</array>
</dict>
</plist>
```
