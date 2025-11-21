import Foundation
import Testing
import Models
@testable import Parser

/// Tests for UnifiedProcessor dependency injection functionality.
///
/// These tests demonstrate that UnifiedProcessor creates contexts with
/// deterministic date and user information when using MockEnvironment.
@Suite("UnifiedProcessor Dependency Injection Tests")
struct UnifiedProcessorDITests {

    // MARK: - Context Creation Tests

    @Test("UnifiedProcessor creates context with deterministic date")
    func unifiedProcessorCreatesContextWithDeterministicDate() {
        // Arrange: Year 2000
        let y2k = Date(timeIntervalSince1970: 946_684_800)
        let env = MockEnvironment(date: y2k)
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act
        let context = processor.createContext(from: [:])

        // Assert: Year should be 2000
        #expect(context.year == "2000")
    }

    @Test("UnifiedProcessor creates context with injected user info")
    func unifiedProcessorCreatesContextWithInjectedUserInfo() {
        // Arrange
        let env = MockEnvironment(
            userName: "alice",
            fullUserName: "Alice Wonderland"
        )
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act
        let context = processor.createContext(from: [:])

        // Assert
        #expect(context.userName == "alice")
        #expect(context.fullUserName == "Alice Wonderland")
    }

    @Test("UnifiedProcessor creates context with all environment values")
    func unifiedProcessorCreatesContextWithAllEnvironmentValues() {
        // Arrange: Complete environment
        let specificDate = Date(timeIntervalSince1970: 1_609_459_200) // 2021-01-01
        let specificUUID = UUID(uuidString: "AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE")!

        let env = MockEnvironment(
            date: specificDate,
            uuid: specificUUID,
            userName: "bob",
            fullUserName: "Bob Builder"
        )
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act
        let context = processor.createContext(
            from: [:],
            fileName: "MyFile.swift",
            projectName: "MyProject"
        )

        // Assert: All values should come from environment
        #expect(context.userName == "bob")
        #expect(context.fullUserName == "Bob Builder")
        #expect(context.year == "2021")
        #expect(context.fileName == "MyFile.swift")
        #expect(context.projectName == "MyProject")
    }

    // MARK: - Metadata Extraction Tests

    @Test("UnifiedProcessor extracts options from metadata")
    func unifiedProcessorExtractsOptionsFromMetadata() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        let metadata: [String: Any] = [
            "Options": [
                [
                    "Identifier": "testOption",
                    "Name": "Test Option",
                    "Default": "defaultValue",
                ],
            ],
        ]

        // Act
        let context = processor.createContext(from: metadata)

        // Assert: Option should be in context
        #expect(context.options["testOption"] == "defaultValue")
    }

    @Test("UnifiedProcessor handles metadata without options")
    func unifiedProcessorHandlesMetadataWithoutOptions() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        let metadata: [String: Any] = [:]

        // Act
        let context = processor.createContext(from: metadata)

        // Assert: Options should be empty
        #expect(context.options.isEmpty)
    }

    @Test("UnifiedProcessor extracts multiple options from metadata")
    func unifiedProcessorExtractsMultipleOptionsFromMetadata() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        let metadata: [String: Any] = [
            "Options": [
                [
                    "Identifier": "option1",
                    "Name": "Option 1",
                    "Default": "value1",
                ],
                [
                    "Identifier": "option2",
                    "Name": "Option 2",
                    "Default": "value2",
                ],
                [
                    "Identifier": "option3",
                    "Name": "Option 3",
                    "Default": "value3",
                ],
            ],
        ]

        // Act
        let context = processor.createContext(from: metadata)

        // Assert: All options should be extracted
        #expect(context.options.count == 3)
        #expect(context.options["option1"] == "value1")
        #expect(context.options["option2"] == "value2")
        #expect(context.options["option3"] == "value3")
    }

    // MARK: - File Name Processing Tests

    @Test("UnifiedProcessor derives base file name correctly")
    func unifiedProcessorDerivesBaseFileNameCorrectly() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act: Various file names
        let context1 = processor.createContext(from: [:], fileName: "MyClass.swift")
        let context2 = processor.createContext(from: [:], fileName: "SomeView.m")
        let context3 = processor.createContext(from: [:], fileName: "README.md")

        // Assert: Base names without extensions
        #expect(context1.fileBaseName == "MyClass")
        #expect(context2.fileBaseName == "SomeView")
        #expect(context3.fileBaseName == "README")
    }

    @Test("UnifiedProcessor handles file names without extensions")
    func unifiedProcessorHandlesFileNamesWithoutExtensions() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act
        let context = processor.createContext(from: [:], fileName: "Makefile")

        // Assert
        #expect(context.fileBaseName == "Makefile")
        #expect(context.fileName == "Makefile")
    }

    // MARK: - Consistency Tests

    @Test("UnifiedProcessor creates consistent contexts with same environment")
    func unifiedProcessorCreatesConsistentContextsWithSameEnvironment() {
        // Arrange: Same environment
        let fixedDate = Date(timeIntervalSince1970: 1_000_000_000)
        let env = MockEnvironment(
            date: fixedDate,
            userName: "consistent",
            fullUserName: "Consistent User"
        )
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act: Create multiple contexts
        let context1 = processor.createContext(from: [:])
        let context2 = processor.createContext(from: [:])

        // Assert: User info should be identical
        #expect(context1.userName == context2.userName)
        #expect(context1.fullUserName == context2.fullUserName)
        #expect(context1.year == context2.year)
    }

    @Test("UnifiedProcessor creates different contexts with different environments")
    func unifiedProcessorCreatesDifferentContextsWithDifferentEnvironments() {
        // Arrange: Two different environments
        let env1 = MockEnvironment(
            date: Date(timeIntervalSince1970: 0),
            userName: "user1"
        )
        let env2 = MockEnvironment(
            date: Date(timeIntervalSince1970: 1_000_000_000),
            userName: "user2"
        )

        let processor1 = Template.Parser.UnifiedProcessor(environment: env1)
        let processor2 = Template.Parser.UnifiedProcessor(environment: env2)

        // Act
        let context1 = processor1.createContext(from: [:])
        let context2 = processor2.createContext(from: [:])

        // Assert: Should have different values
        #expect(context1.userName != context2.userName)
        #expect(context1.year != context2.year)
    }

    // MARK: - Default Parameters Tests

    @Test("UnifiedProcessor uses default file name when not specified")
    func unifiedProcessorUsesDefaultFileNameWhenNotSpecified() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act: Don't specify fileName
        let context = processor.createContext(from: [:])

        // Assert: Should use default
        #expect(context.fileName == "File.swift")
        #expect(context.fileBaseName == "File")
    }

    @Test("UnifiedProcessor uses default project name when not specified")
    func unifiedProcessorUsesDefaultProjectNameWhenNotSpecified() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act: Don't specify projectName
        let context = processor.createContext(from: [:])

        // Assert: Should use default
        #expect(context.projectName == "MyProject")
        #expect(context.packageName == "MyProject")
    }

    // MARK: - Edge Cases

    @Test("UnifiedProcessor handles empty metadata gracefully")
    func unifiedProcessorHandlesEmptyMetadataGracefully() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        // Act
        let context = processor.createContext(from: [:])

        // Assert: Should create valid context with defaults
        #expect(!context.fileName.isEmpty)
        #expect(!context.projectName.isEmpty)
        #expect(!context.userName.isEmpty)
    }

    @Test("UnifiedProcessor handles malformed options in metadata")
    func unifiedProcessorHandlesMalformedOptionsInMetadata() {
        // Arrange
        let env = MockEnvironment()
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        let metadata: [String: Any] = [
            "Options": [
                ["Identifier": "valid", "Name": "Valid", "Default": "value"],
                ["Name": "Missing Identifier"],  // Invalid
                ["Identifier": "missingDefault", "Name": "No Default"],  // Invalid
            ],
        ]

        // Act
        let context = processor.createContext(from: metadata)

        // Assert: Should only extract valid options
        #expect(context.options.count == 1)
        #expect(context.options["valid"] == "value")
    }
}
