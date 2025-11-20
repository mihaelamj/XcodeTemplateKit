# TargetOnly - Complete Context

**Template**: Aggregate.xctemplate
**Field Path**: `TargetOnly`

## Complete TemplateInfo.plist

```xml<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Concrete</key>
	<true/>
	<key>Description</key>
	<string>This target is used to aggregate other targets together.</string>
	<key>Identifier</key>
	<string>com.apple.dt.unit.aggregate</string>
	<key>Image</key>
	<dict>
		<key>SystemSymbolName</key>
		<string>target</string>
	</dict>
	<key>Kind</key>
	<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>
	<key>Options</key>
	<array>
		<dict>
			<key>Description</key>
			<string>Your new product's name</string>
			<key>EmptyReplacement</key>
			<string>ProductName</string>
			<key>Identifier</key>
			<string>productName</string>
			<key>Name</key>
			<string>Product Name:</string>
			<key>NotPersisted</key>
			<true/>
			<key>Required</key>
			<true/>
			<key>Type</key>
			<string>text</string>
		</dict>
	</array>
	<key>TargetOnly</key>
	<true/>
	<key>Targets</key>
	<array>
		<dict>
			<key>Name</key>
			<string>___PACKAGENAME___</string>
			<key>SharedSettings</key>
			<dict>
				<key>PRODUCT_NAME</key>
				<string>$(TARGET_NAME)</string>
			</dict>
			<key>TargetIdentifier</key>
			<string>com.apple.dt.aggregateTarget</string>
			<key>TargetType</key>
			<string>Aggregate</string>
		</dict>
	</array>
</dict>
</plist>
```
