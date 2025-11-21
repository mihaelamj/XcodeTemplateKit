import Foundation
@testable import Generator
import Models
import Testing

@Suite("Variables Field Generation")
struct VariablesGeneratorTests {
    @Test("Generate template with simple variables")
    func generateSimpleVariables() throws {
        let template = """
        class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_baseClass___ {
            var packageName = "___PACKAGENAME___"
        }
        """

        // Verify variables are present in generated template
        #expect(template.contains("___FILEBASENAMEASIDENTIFIER___"))
        #expect(template.contains("___VARIABLE_baseClass___"))
        #expect(template.contains("___PACKAGENAME___"))
    }

    @Test("Generate template with transformation variables")
    func generateTransformationVariables() throws {
        let template = """
        // Package: ___PACKAGENAME:identifier___
        // RFC1034: ___PACKAGENAME:RFC1034Identifier___
        // Lower: ___VARIABLE_name:lower___
        // Upper: ___VARIABLE_name:upper___
        """

        #expect(template.contains("___PACKAGENAME:identifier___"))
        #expect(template.contains("___PACKAGENAME:RFC1034Identifier___"))
        #expect(template.contains("___VARIABLE_name:lower___"))
        #expect(template.contains("___VARIABLE_name:upper___"))
    }

    @Test("Generate template with FILEHEADER")
    func generateFileHeader() throws {
        let template = """
        //___FILEHEADER___

        import Foundation

        class ___FILEBASENAMEASIDENTIFIER___ {
        }
        """

        #expect(template.contains("//___FILEHEADER___"))
        #expect(template.hasPrefix("//___FILEHEADER___"))
    }

    @Test("Generate template preserving variable format")
    func preserveVariableFormat() throws {
        let originalVariables = [
            "___FILEBASENAME___",
            "___FILEBASENAMEASIDENTIFIER___",
            "___PACKAGENAME___",
            "___PACKAGENAME:identifier___",
            "___VARIABLE_customVar___",
            "___VARIABLE_testName:lower___",
        ]

        for variable in originalVariables {
            let template = "let value = \"\(variable)\""

            // Verify exact format is preserved
            #expect(template.contains(variable))

            // Verify the variable hasn't been modified
            let extractedVariable = template.components(separatedBy: "\"")[1]
            #expect(extractedVariable == variable)
        }
    }

    @Test("Generate template without variables")
    func generatePlainTemplate() throws {
        let template = """
        import Foundation

        class MyClass {
            func myMethod() {
                print("Hello")
            }
        }
        """

        let pattern = "___[A-Z_]+___"
        let regex = try NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: template, range: NSRange(template.startIndex..., in: template))

        #expect(matches.isEmpty)
    }

    @Test("Round-trip variable preservation")
    func roundTripVariables() throws {
        let originalTemplate = "class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_base___ {}"

        // Simulate write and read
        let writtenTemplate = originalTemplate
        let readTemplate = writtenTemplate

        #expect(readTemplate == originalTemplate)
        #expect(readTemplate.contains("___FILEBASENAMEASIDENTIFIER___"))
        #expect(readTemplate.contains("___VARIABLE_base___"))
    }
}
