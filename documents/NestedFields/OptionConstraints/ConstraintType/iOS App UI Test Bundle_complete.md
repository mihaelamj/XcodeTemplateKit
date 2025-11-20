# ConstraintType - Complete Context

**Template**: iOS App UI Test Bundle.xctemplate
**Field Path**: `OptionConstraints[].ConstraintType`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Ancestors</key>
	<array>
		<string>com.apple.dt.unit.iosUITestBundleBase</string>
	</array>
	<key>Identifier</key>
	<string>com.apple.dt.unit.multiPlatform.app.iOS.tests.ui</string>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>OptionConstraints</key>
	<array>
		<dict>
			<key>ConstraintType</key>
			<string>DefaultIfAssociatedTarget</string>
			<key>Identifier</key>
			<string>productName</string>
			<key>Value</key>
			<string>___ASSOCIATEDTARGET_bundleName___UITests</string>
		</dict>
	</array>
	<key>Targets</key>
	<array>
		<dict>
			<key>TargetIdentifier</key>
			<string>com.apple.dt.unit.multiPlatform.app.iOS.tests.ui</string>
			<key>TargetIdentifierToBeTested</key>
			<string>com.apple.dt.iosApplicationTarget</string>
		</dict>
	</array>
</dict>
</plist>
```
