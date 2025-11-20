@testable import TemplateParser
import Testing

@Suite("Template Processor Tests")
struct TemplateProcessorTests {
    let processor = TemplateProcessor()

    func makeTestContext() -> VariableContext {
        VariableContext(
            fileName: "ContentView.swift",
            fileBaseName: "ContentView",
            projectName: "MyApp",
            packageName: "MyApp",
            userName: "mm",
            fullUserName: "Mihaela Mihaljevic",
            date: "16.11.2025",
            year: "2025",
            options: [
                "productName": "My Product",
                "bundleIdentifierPrefix": "com.example",
            ]
        )
    }

    @Test("Simple variable substitution")
    func simpleVariableSubstitution() throws {
        let template = "File name: ___FILENAME___"
        let context = makeTestContext()

        let result = try processor.process(template: template, context: context)

        #expect(result == "File name: ContentView.swift")
    }

    @Test("File header macro expansion")
    func fileHeaderMacro() throws {
        let template = "___FILEHEADER___import Foundation"
        let context = makeTestContext()

        let result = try processor.process(template: template, context: context)

        #expect(result.contains("ContentView.swift"))
        #expect(result.contains("MyApp"))
        #expect(result.contains("Mihaela Mihaljevic"))
        #expect(result.contains("2025"))
        #expect(result.contains("import Foundation"))
    }

    @Test("Variable with transformation")
    func transformedVariable() throws {
        let template = "struct ___FILEBASENAME:identifier___"
        let context = makeTestContext()

        let result = try processor.process(template: template, context: context)

        #expect(result == "struct ContentView")
    }

    @Test("Option variable substitution")
    func optionVariable() throws {
        let template = "Product: ___VARIABLE_productName___"
        let context = makeTestContext()

        let result = try processor.process(template: template, context: context)

        #expect(result == "Product: My Product")
    }

    @Test("Complete SwiftUI template processing")
    func completeSwiftUITemplate() throws {
        let template = """
        ___FILEHEADER___
        import SwiftUI

        struct ___FILEBASENAMEASIDENTIFIER___: View {
            var body: some View {
                Text("Hello from ___VARIABLE_productName___!")
            }
        }

        #Preview {
            ___FILEBASENAMEASIDENTIFIER___()
        }
        """

        let context = makeTestContext()
        let result = try processor.process(template: template, context: context)

        #expect(result.contains("import SwiftUI"))
        #expect(result.contains("struct ContentView: View"))
        #expect(result.contains("Hello from My Product!"))
        #expect(result.contains("ContentView()"))
    }
}
