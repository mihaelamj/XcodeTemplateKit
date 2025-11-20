# MACOSX_DEPLOYMENT_TARGET - Complete Context

**Template**: Multiplatform Base.xctemplate
**Field Path**: `Targets[].SharedSettings.MACOSX_DEPLOYMENT_TARGET`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Identifier</key>
	<string>com.apple.dt.unit.multiPlatform.base</string>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Targets</key>
	<array>
		<dict>
			<key>SharedSettings</key>
			<dict>
				<key>IPHONEOS_DEPLOYMENT_TARGET</key>
				<string>latest_iphoneos</string>
				<key>MACOSX_DEPLOYMENT_TARGET</key>
				<string>___BESTMACOSVERSION___</string>
				<key>SDKROOT</key>
				<string>auto</string>
				<key>SUPPORTED_PLATFORMS</key>
				<string>iphoneos iphonesimulator macosx xros xrsimulator</string>
				<key>TARGETED_DEVICE_FAMILY</key>
				<string>1,2,7</string>
				<key>XROS_DEPLOYMENT_TARGET</key>
				<string>latest_xros</string>
			</dict>
		</dict>
	</array>
</dict>
</plist>
```
