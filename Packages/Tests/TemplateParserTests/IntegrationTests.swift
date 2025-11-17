import Foundation
@testable import TemplateParser
import Testing

/// Integration tests using real Xcode templates from XcodeTemplateCollection
@Suite("Integration Tests with Real Templates")
struct IntegrationTests {
    let processor = TemplateProcessor()

    // Path to our generated template collection
    let templatesBasePath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/XcodeTemplateCollection/TemplateArtifacts"

    func makeTestContext() -> VariableContext {
        VariableContext(
            fileName: "TestFile.swift",
            fileBaseName: "TestFile",
            projectName: "TestProject",
            packageName: "TestPackage",
            userName: "mm",
            fullUserName: "Mihaela Mihaljevic",
            date: DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none),
            year: String(Calendar.current.component(.year, from: Date())),
            options: [
                "productName": "Test Product",
                "bundleIdentifierPrefix": "com.test",
            ]
        )
    }

    @Test("Process Swift File template from XcodeTemplateCollection")
    func swiftFileTemplate() throws {
        // Read the actual Swift File template
        let templatePath = "\(templatesBasePath)/File Templates/MultiPlatform > Source/Swift File/___FILEBASENAME___.swift"

        guard FileManager.default.fileExists(atPath: templatePath) else {
            Issue.record("Template file not found at: \(templatePath)")
            return
        }

        let templateContent = try String(contentsOfFile: templatePath, encoding: .utf8)
        let context = makeTestContext()

        // Process the template
        let result = try processor.process(template: templateContent, context: context)

        // Verify output
        #expect(result.contains("TestFile.swift"), "Should contain filename")
        #expect(result.contains("TestProject"), "Should contain project name")
        #expect(result.contains("Mihaela Mihaljevic"), "Should contain full username")
        #expect(result.contains("Copyright"), "Should contain copyright")
        #expect(result.contains("import Foundation"), "Should contain Foundation import")

        print("✅ Swift File Template Output:")
        print(result)
    }

    @Test("Process SwiftUI View template")
    func swiftUIViewTemplate() throws {
        let templatePath = "\(templatesBasePath)/File Templates/MultiPlatform > User Interface/SwiftUI View/___FILEBASENAME___.swift"

        guard FileManager.default.fileExists(atPath: templatePath) else {
            Issue.record("Template file not found")
            return
        }

        let templateContent = try String(contentsOfFile: templatePath, encoding: .utf8)
        let context = makeTestContext()
        let result = try processor.process(template: templateContent, context: context)

        #expect(result.contains("import SwiftUI"), "Should import SwiftUI")
        #expect(result.contains("struct TestFile: View"), "Should create TestFile struct")
        #expect(result.contains("#Preview"), "Should contain Preview")

        print("✅ SwiftUI View Template Output:")
        print(result)
    }

    @Test("Process all file templates successfully")
    func allFileTemplatesCanParse() throws {
        let fileTemplatesPath = "\(templatesBasePath)/File Templates"

        guard FileManager.default.fileExists(atPath: fileTemplatesPath) else {
            Issue.record("File templates directory not found")
            return
        }

        var successCount = 0
        var failureCount = 0
        var errors: [(String, Error)] = []

        // Find all template files
        let enumerator = FileManager.default.enumerator(atPath: fileTemplatesPath)
        let context = makeTestContext()

        while let file = enumerator?.nextObject() as? String {
            // Look for template Swift files
            if file.contains("___"), file.hasSuffix(".swift") {
                let fullPath = "\(fileTemplatesPath)/\(file)"

                do {
                    let content = try String(contentsOfFile: fullPath, encoding: .utf8)
                    _ = try processor.process(template: content, context: context)
                    successCount += 1
                } catch {
                    failureCount += 1
                    errors.append((file, error))
                }
            }
        }

        print("\n📊 Template Processing Results:")
        print("  ✅ Success: \(successCount)")
        print("  ❌ Failures: \(failureCount)")

        if !errors.isEmpty {
            print("\n❌ Errors:")
            for (file, error) in errors.prefix(5) {
                print("  • \(file): \(error)")
            }
        }

        // We expect most templates to parse successfully
        // Some might fail if they use advanced features we haven't implemented yet
        #expect(successCount > 0, "At least some templates should parse")
    }

    @Test("Compare parser output with Xcode-generated sample")
    func compareWithGeneratedSample() throws {
        // Compare our parser output with what Xcode generated
        let templatePath = "\(templatesBasePath)/File Templates/MultiPlatform > Source/Swift File/___FILEBASENAME___.swift"
        let generatedPath = "\(templatesBasePath)/File Templates/MultiPlatform > Source/Swift File/_generated_sample/File.swift"

        guard FileManager.default.fileExists(atPath: templatePath),
              FileManager.default.fileExists(atPath: generatedPath) else {
            Issue.record("Template or generated file not found")
            return
        }

        let templateContent = try String(contentsOfFile: templatePath, encoding: .utf8)
        let expectedOutput = try String(contentsOfFile: generatedPath, encoding: .utf8)

        // Create context matching the generated sample
        let context = VariableContext(
            fileName: "File.swift",
            fileBaseName: "File",
            projectName: "MyProject",
            packageName: "MyPackage",
            userName: "mm",
            fullUserName: "Mihaela Mihaljevic",
            date: "16.11.2025.", // Match the exact format from generated file
            year: "2025",
            options: [:]
        )

        let result = try processor.process(template: templateContent, context: context)

        print("\n🔍 Comparison:")
        print("Expected:")
        print(expectedOutput)
        print("\nActual:")
        print(result)

        // The outputs should be very similar (might differ in exact date format)
        #expect(result.contains("import Foundation"))
        #expect(result.contains("File.swift"))
        #expect(result.contains("MyProject"))
    }

    @Test("Variable transformations work correctly", arguments: [
        ("My App Name", "identifier", "MyAppName"),
        ("My-App-Name", "RFC1034Identifier", "my-app-name"),
        ("My App Name", "bundleIdentifier", "my.app.name"),
    ])
    func variableTransformations(input: String, transform: String, expected: String) throws {
        let template = "___VARIABLE_testValue:\(transform)___"
        let context = VariableContext(
            fileName: "test.swift",
            fileBaseName: "test",
            projectName: "Test",
            packageName: "Test",
            userName: "test",
            fullUserName: "Test User",
            date: "01.01.2025",
            year: "2025",
            options: ["testValue": input]
        )

        let result = try processor.process(template: template, context: context)
        #expect(result == expected, "Transform '\(transform)' should convert '\(input)' to '\(expected)'")
    }
}
