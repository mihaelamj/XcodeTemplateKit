@testable import TemplateParser
import Testing

@Suite("Variable Parser Tests")
struct VariableParserTests {
    let parser = VariableParser()

    @Test("Parse simple variable")
    func simpleVariable() throws {
        let input = "___FILEBASENAME___"
        let result = try parser.parse(input[...])
        #expect(result == .simple("FILEBASENAME"))
    }

    @Test("Parse transformed variable")
    func transformedVariable() throws {
        let input = "___FILEBASENAME:identifier___"
        let result = try parser.parse(input[...])
        #expect(result == .transformed("FILEBASENAME", [.identifier]))
    }

    @Test("Parse variable with multiple transformations")
    func multipleTransformations() throws {
        let input = "___FILEBASENAME:identifier:RFC1034Identifier___"
        let result = try parser.parse(input[...])
        #expect(result == .transformed("FILEBASENAME", [.identifier, .rfc1034Identifier]))
    }

    @Test("Parse option variable")
    func optionVariable() throws {
        let input = "___VARIABLE_productName___"
        let result = try parser.parse(input[...])
        #expect(result == .option("productName", []))
    }

    @Test("Parse option variable with transformation")
    func optionVariableWithTransform() throws {
        let input = "___VARIABLE_productName:bundleIdentifier___"
        let result = try parser.parse(input[...])
        #expect(result == .option("productName", [.bundleIdentifier]))
    }

    @Test("Parse UUID variable")
    func uuidVariable() throws {
        let input = "___UUID:myServiceID___"
        let result = try parser.parse(input[...])
        #expect(result == .uuid("myServiceID"))
    }

    @Test("Parse macro variable")
    func macroVariable() throws {
        let input = "___FILEHEADER___"
        let result = try parser.parse(input[...])
        #expect(result == .macro("FILEHEADER"))
    }
}
