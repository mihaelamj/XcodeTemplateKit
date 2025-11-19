import Foundation
@testable import TemplateParser
import Testing

/// Comprehensive bidirectional tests for TemplateBooleanFormat enum.
///
/// Tests both parsing (plist → Swift) and serialization (Swift → plist) to ensure
/// correct round-trip behavior for both Objective-C and Swift boolean formats.
@Suite("TemplateBooleanFormat Bidirectional Tests")
struct TemplateBooleanFormatTests {
    // MARK: - Objective-C Boolean Format Tests

    @Test("Parse Objective-C YES string")
    func parseObjectiveCYES() {
        let format = TemplateBooleanFormat.fromObjectiveCString("YES")

        #expect(format != nil, "Should parse YES string")
        #expect(format?.boolValue == true, "YES should be true")

        if case .objectiveCBoolean(let value) = format {
            #expect(value == true, "Should be objectiveCBoolean(true)")
        } else {
            Issue.record("Expected .objectiveCBoolean case")
        }
    }

    @Test("Parse Objective-C NO string")
    func parseObjectiveCNO() {
        let format = TemplateBooleanFormat.fromObjectiveCString("NO")

        #expect(format != nil, "Should parse NO string")
        #expect(format?.boolValue == false, "NO should be false")

        if case .objectiveCBoolean(let value) = format {
            #expect(value == false, "Should be objectiveCBoolean(false)")
        } else {
            Issue.record("Expected .objectiveCBoolean case")
        }
    }

    @Test("Reject invalid Objective-C boolean string")
    func parseObjectiveCInvalid() {
        let invalidInputs = ["yes", "no", "Yes", "No", "TRUE", "FALSE", "true", "false", "1", "0", ""]

        for input in invalidInputs {
            let format = TemplateBooleanFormat.fromObjectiveCString(input)
            #expect(format == nil, "Should reject invalid input: \(input)")
        }
    }

    @Test("Serialize Objective-C boolean to string")
    func serializeObjectiveCToString() {
        let trueFormat = TemplateBooleanFormat.objectiveCBoolean(true)
        #expect(trueFormat.toObjectiveCString() == "YES", "true should serialize to YES")

        let falseFormat = TemplateBooleanFormat.objectiveCBoolean(false)
        #expect(falseFormat.toObjectiveCString() == "NO", "false should serialize to NO")
    }

    @Test("Serialize Objective-C boolean to property list value")
    func serializeObjectiveCToPropertyList() {
        let trueFormat = TemplateBooleanFormat.objectiveCBoolean(true)
        let trueValue = trueFormat.toPropertyListValue()
        #expect(trueValue as? String == "YES", "Should serialize to YES string")

        let falseFormat = TemplateBooleanFormat.objectiveCBoolean(false)
        let falseValue = falseFormat.toPropertyListValue()
        #expect(falseValue as? String == "NO", "Should serialize to NO string")
    }

    @Test("Round-trip Objective-C boolean through string")
    func roundTripObjectiveCThroughString() {
        // true → YES → true
        let originalTrue = TemplateBooleanFormat.objectiveCBoolean(true)
        let yesString = originalTrue.toObjectiveCString()
        let parsedTrue = TemplateBooleanFormat.fromObjectiveCString(yesString!)
        #expect(parsedTrue?.boolValue == true, "Round-trip true should preserve value")

        // false → NO → false
        let originalFalse = TemplateBooleanFormat.objectiveCBoolean(false)
        let noString = originalFalse.toObjectiveCString()
        let parsedFalse = TemplateBooleanFormat.fromObjectiveCString(noString!)
        #expect(parsedFalse?.boolValue == false, "Round-trip false should preserve value")
    }

    @Test("Round-trip Objective-C boolean through property list")
    func roundTripObjectiveCThroughPropertyList() throws {
        // Create plist with Objective-C booleans
        var plist: [String: Any] = [:]
        plist["HiddenFromChooser"] = TemplateBooleanFormat.objectiveCBoolean(true).toPropertyListValue()
        plist["HiddenFromLibrary"] = TemplateBooleanFormat.objectiveCBoolean(false).toPropertyListValue()

        // Serialize to Data
        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)

        // Deserialize back
        let deserialized = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        // Parse back to TemplateBooleanFormat
        let hidden = (deserialized["HiddenFromChooser"] as? String)
            .flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }
        let library = (deserialized["HiddenFromLibrary"] as? String)
            .flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }

        #expect(hidden?.boolValue == true, "HiddenFromChooser should round-trip as true")
        #expect(library?.boolValue == false, "HiddenFromLibrary should round-trip as false")
    }

    // MARK: - Swift Boolean Format Tests

    @Test("Create Swift boolean from Bool")
    func createSwiftBoolean() {
        let trueFormat = TemplateBooleanFormat.fromSwiftBool(true)
        #expect(trueFormat.boolValue == true, "Should wrap true")

        if case .swiftBoolean(let value) = trueFormat {
            #expect(value == true, "Should be swiftBoolean(true)")
        } else {
            Issue.record("Expected .swiftBoolean case")
        }

        let falseFormat = TemplateBooleanFormat.fromSwiftBool(false)
        #expect(falseFormat.boolValue == false, "Should wrap false")

        if case .swiftBoolean(let value) = falseFormat {
            #expect(value == false, "Should be swiftBoolean(false)")
        } else {
            Issue.record("Expected .swiftBoolean case")
        }
    }

    @Test("Swift boolean cannot serialize to Objective-C string")
    func swiftBooleanRejectsObjectiveCString() {
        let trueFormat = TemplateBooleanFormat.swiftBoolean(true)
        #expect(trueFormat.toObjectiveCString() == nil, "Swift boolean should not serialize to YES/NO")

        let falseFormat = TemplateBooleanFormat.swiftBoolean(false)
        #expect(falseFormat.toObjectiveCString() == nil, "Swift boolean should not serialize to YES/NO")
    }

    @Test("Serialize Swift boolean to property list value")
    func serializeSwiftToPropertyList() {
        let trueFormat = TemplateBooleanFormat.swiftBoolean(true)
        let trueValue = trueFormat.toPropertyListValue()
        #expect(trueValue as? Bool == true, "Should serialize to true Bool")

        let falseFormat = TemplateBooleanFormat.swiftBoolean(false)
        let falseValue = falseFormat.toPropertyListValue()
        #expect(falseValue as? Bool == false, "Should serialize to false Bool")
    }

    @Test("Round-trip Swift boolean through property list")
    func roundTripSwiftThroughPropertyList() throws {
        // Create plist with Swift booleans
        var plist: [String: Any] = [:]
        plist["Concrete"] = TemplateBooleanFormat.swiftBoolean(true).toPropertyListValue()
        plist["LocalizedByDefault"] = TemplateBooleanFormat.swiftBoolean(false).toPropertyListValue()
        plist["ProjectOnly"] = TemplateBooleanFormat.swiftBoolean(true).toPropertyListValue()

        // Serialize to Data (XML format to verify <true/>/<false/> encoding)
        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)

        // Verify XML contains <true/> and <false/> tags
        let xmlString = String(data: data, encoding: .utf8)!
        #expect(xmlString.contains("<true/>"), "XML should contain <true/> tag")
        #expect(xmlString.contains("<false/>"), "XML should contain <false/> tag")

        // Deserialize back
        let deserialized = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        // Parse back to TemplateBooleanFormat
        let concrete = (deserialized["Concrete"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }
        let localized = (deserialized["LocalizedByDefault"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }
        let projectOnly = (deserialized["ProjectOnly"] as? Bool).map { TemplateBooleanFormat.fromSwiftBool($0) }

        #expect(concrete?.boolValue == true, "Concrete should round-trip as true")
        #expect(localized?.boolValue == false, "LocalizedByDefault should round-trip as false")
        #expect(projectOnly?.boolValue == true, "ProjectOnly should round-trip as true")
    }

    // MARK: - Mixed Format Tests

    @Test("Mixed Objective-C and Swift booleans in same plist")
    func mixedFormatsInSamePlist() throws {
        var plist: [String: Any] = [:]

        // Add Objective-C booleans (HiddenFromChooser, HiddenFromLibrary)
        plist["HiddenFromChooser"] = TemplateBooleanFormat.objectiveCBoolean(true).toPropertyListValue()
        plist["HiddenFromLibrary"] = TemplateBooleanFormat.objectiveCBoolean(false).toPropertyListValue()

        // Add Swift booleans (Concrete, LocalizedByDefault)
        plist["Concrete"] = TemplateBooleanFormat.swiftBoolean(true).toPropertyListValue()
        plist["LocalizedByDefault"] = TemplateBooleanFormat.swiftBoolean(false).toPropertyListValue()

        // Serialize and deserialize
        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
        let deserialized = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]

        // Verify Objective-C booleans
        #expect(deserialized["HiddenFromChooser"] as? String == "YES")
        #expect(deserialized["HiddenFromLibrary"] as? String == "NO")

        // Verify Swift booleans
        #expect(deserialized["Concrete"] as? Bool == true)
        #expect(deserialized["LocalizedByDefault"] as? Bool == false)
    }

    // MARK: - Type Safety Tests

    @Test("Objective-C and Swift booleans are distinct types")
    func distinctTypes() {
        let objcTrue = TemplateBooleanFormat.objectiveCBoolean(true)
        let swiftTrue = TemplateBooleanFormat.swiftBoolean(true)

        // Both have same boolean value
        #expect(objcTrue.boolValue == swiftTrue.boolValue)

        // But they are NOT equal (different cases)
        #expect(objcTrue != swiftTrue, "Different format types should not be equal")
    }

    @Test("boolValue extracts underlying value from both formats")
    func boolValueExtraction() {
        let formats: [TemplateBooleanFormat] = [
            .objectiveCBoolean(true),
            .objectiveCBoolean(false),
            .swiftBoolean(true),
            .swiftBoolean(false),
        ]

        let expectedValues = [true, false, true, false]

        for (format, expected) in zip(formats, expectedValues) {
            #expect(format.boolValue == expected, "boolValue should extract \(expected)")
        }
    }

    // MARK: - Real-World Template Scenario

    @Test("Simulate real template parsing and writing")
    func realWorldTemplateScenario() throws {
        // STEP 1: Parse a template plist (simulating what TemplateScanner does)
        let templatePlist: [String: Any] = [
            "Kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
            "Name": "Test Template",
            "HiddenFromChooser": "YES", // Objective-C format
            "HiddenFromLibrary": "NO", // Objective-C format
            "Concrete": true, // Swift format
            "LocalizedByDefault": false, // Swift format
        ]

        // Parse booleans
        let hiddenFromChooser = (templatePlist["HiddenFromChooser"] as? String)
            .flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }
        let hiddenFromLibrary = (templatePlist["HiddenFromLibrary"] as? String)
            .flatMap { TemplateBooleanFormat.fromObjectiveCString($0) }
        let concrete = (templatePlist["Concrete"] as? Bool)
            .map { TemplateBooleanFormat.fromSwiftBool($0) }
        let localized = (templatePlist["LocalizedByDefault"] as? Bool)
            .map { TemplateBooleanFormat.fromSwiftBool($0) }

        // Verify parsing
        #expect(hiddenFromChooser?.boolValue == true)
        #expect(hiddenFromLibrary?.boolValue == false)
        #expect(concrete?.boolValue == true)
        #expect(localized?.boolValue == false)

        // STEP 2: Modify and write back (simulating template creation)
        var outputPlist: [String: Any] = [:]
        outputPlist["Kind"] = "Xcode.Xcode3.ProjectTemplateUnitKind"
        outputPlist["Name"] = "Modified Template"

        // Write booleans back in correct format
        if let hidden = hiddenFromChooser {
            outputPlist["HiddenFromChooser"] = hidden.toPropertyListValue()
        }
        if let library = hiddenFromLibrary {
            outputPlist["HiddenFromLibrary"] = library.toPropertyListValue()
        }
        if let concreteValue = concrete {
            outputPlist["Concrete"] = concreteValue.toPropertyListValue()
        }
        if let localizedValue = localized {
            outputPlist["LocalizedByDefault"] = localizedValue.toPropertyListValue()
        }

        // STEP 3: Serialize to XML and verify format
        let data = try PropertyListSerialization.data(fromPropertyList: outputPlist, format: .xml, options: 0)
        let xml = String(data: data, encoding: .utf8)!

        // Verify Objective-C format (strings)
        #expect(xml.contains("<key>HiddenFromChooser</key>"), "Should have HiddenFromChooser key")
        #expect(xml.contains("<string>YES</string>"), "Should have YES string")
        #expect(xml.contains("<string>NO</string>"), "Should have NO string")

        // Verify Swift format (XML booleans)
        #expect(xml.contains("<key>Concrete</key>"), "Should have Concrete key")
        #expect(xml.contains("<true/>"), "Should have <true/> tag")
        #expect(xml.contains("<false/>"), "Should have <false/> tag")
    }
}
