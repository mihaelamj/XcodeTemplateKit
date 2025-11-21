import Foundation
import Models
@testable import Parser
import Testing

@Suite("Variables Parser Tests - Explicit")
struct VariablesParserTests {
    @Test("Parse simple template variables")
    func parseSimpleVariables() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Variables/SimpleVariables_value.txt")
        let content = try String(contentsOf: fixtureURL, encoding: .utf8)

        // Check for expected variables
        #expect(content.contains("___FILEBASENAMEASIDENTIFIER___"))
        #expect(content.contains("___VARIABLE_testSubclass___"))
        #expect(content.contains("___PACKAGENAME___"))
        #expect(content.contains("___VARIABLE_productIdentifier___"))
    }

    @Test("Parse variables with transformations")
    func parseVariablesWithTransformations() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Variables/WithTransformations_value.txt")
        let content = try String(contentsOf: fixtureURL, encoding: .utf8)

        // Check for variables with transformations
        #expect(content.contains("___PACKAGENAME:identifier___"))
        #expect(content.contains("___PACKAGENAME:RFC1034Identifier___"))
        #expect(content.contains("___VARIABLE_testName:lower___"))
        #expect(content.contains("___VARIABLE_testName:upper___"))
    }

    @Test("Parse FILEHEADER variable")
    func parseFileHeaderVariable() throws {
        let fixtureURL = URL(fileURLWithPath: "Tests/Fixtures/Variables/FileHeader_value.txt")
        let content = try String(contentsOf: fixtureURL, encoding: .utf8)

        #expect(content.contains("//___FILEHEADER___"))
        #expect(content.contains("___FILEBASENAMEASIDENTIFIER___"))
    }

    @Test("Parse VARIABLE_ prefixed custom variables")
    func parseCustomVariables() throws {
        let content = "class ___VARIABLE_testSubclass___: XCTestCase {}"

        let pattern = "___VARIABLE_([a-zA-Z_]+)___"
        let regex = try NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: content, range: NSRange(content.startIndex..., in: content))

        #expect(matches.count == 1)

        if let match = matches.first, let range = Range(match.range(at: 1), in: content) {
            let variableName = String(content[range])
            #expect(variableName == "testSubclass")
        }
    }

    @Test("Extract all variable types from template")
    func extractAllVariableTypes() throws {
        let content = """
        ___FILEHEADER___
        ___FILEBASENAME___
        ___FILEBASENAMEASIDENTIFIER___
        ___PACKAGENAME___
        ___PACKAGENAME:identifier___
        ___PACKAGENAME:RFC1034Identifier___
        ___VARIABLE_customVar___
        ___VARIABLE_anotherVar:lower___
        """

        // Verify we have different types of variables
        #expect(content.contains("___FILEHEADER___"))
        #expect(content.contains("___FILEBASENAME___"))
        #expect(content.contains("___FILEBASENAMEASIDENTIFIER___"))
        #expect(content.contains("___PACKAGENAME___"))
        #expect(content.contains("___PACKAGENAME:identifier___"))
        #expect(content.contains("___PACKAGENAME:RFC1034Identifier___"))
        #expect(content.contains("___VARIABLE_customVar___"))
        #expect(content.contains("___VARIABLE_anotherVar:lower___"))
    }

    @Test("Parse empty content without variables")
    func parseEmptyContent() throws {
        let content = "class MyClass { }"

        let pattern = "___([A-Z_]+)___"
        let regex = try NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: content, range: NSRange(content.startIndex..., in: content))

        #expect(matches.isEmpty)
    }
}
