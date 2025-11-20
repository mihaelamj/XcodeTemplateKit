# PRODUCT_NAME - Complete Context

**Template**: Cross-Platform Base.xctemplate
**Field Path**: `Targets[].SharedSettings.PRODUCT_NAME`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Definitions</key>
	<dict/>
	<key>Identifier</key>
	<string>com.apple.dt.unit.crossPlatformBase</string>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Targets</key>
	<array>
		<dict>
			<key>Concrete</key>
			<false/>
			<key>SharedSettings</key>
			<dict>
				<key>PRODUCT_BUNDLE_IDENTIFIER</key>
				<string>___VARIABLE_bundleIdentifierPrefix:bundleIdentifier___.___VARIABLE_productName:RFC1034Identifier___</string>
				<key>PRODUCT_NAME</key>
				<string>___VARIABLE_productName___</string>
			</dict>
		</dict>
	</array>
</dict>
</plist>
```
