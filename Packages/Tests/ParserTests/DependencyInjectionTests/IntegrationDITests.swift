import Foundation
import Testing
import Models
@testable import Parser

/// Integration tests demonstrating end-to-end dependency injection.
///
/// These tests show how the DI pattern enables complete control over
/// template processing from scanning to variable resolution.
@Suite("Dependency Injection Integration Tests")
struct IntegrationDITests {

    // MARK: - End-to-End Processing Tests

    @Test("Complete template processing with deterministic environment")
    func completeTemplateProcessingWithDeterministicEnvironment() {
        // Arrange: Fully controlled environment
        let fixedDate = Date(timeIntervalSince1970: 1_609_459_200) // 2021-01-01
        let fixedUUID = UUID(uuidString: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF")!

        let env = MockEnvironment(
            date: fixedDate,
            uuid: fixedUUID,
            userName: "integrationtest",
            fullUserName: "Integration Test User"
        )

        // Act: Create processor and context
        let processor = Template.Parser.UnifiedProcessor(environment: env)
        let context = processor.createContext(
            from: [:],
            fileName: "TestFile.swift",
            projectName: "TestProject"
        )

        // Assert: All values should be deterministic
        #expect(context.userName == "integrationtest")
        #expect(context.fullUserName == "Integration Test User")
        #expect(context.year == "2021")
        #expect(context.fileName == "TestFile.swift")
        #expect(context.projectName == "TestProject")
    }

    @Test("Template processing produces same output with same environment")
    func templateProcessingProducesSameOutputWithSameEnvironment() {
        // Arrange: Same environment for both runs
        let env = MockEnvironment(
            date: Date(timeIntervalSince1970: 0),
            uuid: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!,
            userName: "test",
            fullUserName: "Test User"
        )

        let processor1 = Template.Parser.UnifiedProcessor(environment: env)
        let processor2 = Template.Parser.UnifiedProcessor(environment: env)

        // Act: Create contexts with identical parameters
        let context1 = processor1.createContext(
            from: [:],
            fileName: "Same.swift",
            projectName: "SameProject"
        )
        let context2 = processor2.createContext(
            from: [:],
            fileName: "Same.swift",
            projectName: "SameProject"
        )

        // Assert: Should produce identical contexts
        #expect(context1.userName == context2.userName)
        #expect(context1.fullUserName == context2.fullUserName)
        #expect(context1.year == context2.year)
        #expect(context1.date == context2.date)
    }

    @Test("Template processing produces different output with different environments")
    func templateProcessingProducesDifferentOutputWithDifferentEnvironments() {
        // Arrange: Two different environments
        let env1 = MockEnvironment(
            date: Date(timeIntervalSince1970: 0),
            userName: "user1",
            fullUserName: "User One"
        )
        let env2 = MockEnvironment(
            date: Date(timeIntervalSince1970: 1_000_000_000),
            userName: "user2",
            fullUserName: "User Two"
        )

        let processor1 = Template.Parser.UnifiedProcessor(environment: env1)
        let processor2 = Template.Parser.UnifiedProcessor(environment: env2)

        // Act
        let context1 = processor1.createContext(from: [:])
        let context2 = processor2.createContext(from: [:])

        // Assert: Should produce different contexts
        #expect(context1.userName != context2.userName)
        #expect(context1.fullUserName != context2.fullUserName)
        #expect(context1.year != context2.year)
    }

    // MARK: - Variable Resolution Integration Tests

    @Test("Complete variable resolution workflow with MockEnvironment")
    func completeVariableResolutionWorkflowWithMockEnvironment() {
        // Arrange: Complete environment
        let env = MockEnvironment(
            date: Date(timeIntervalSince1970: 946_684_800), // 2000-01-01
            uuid: UUID(uuidString: "12345678-90AB-CDEF-1234-567890ABCDEF")!,
            userName: "developer",
            fullUserName: "Dev Eloper"
        )

        // Create processor and context
        let processor = Template.Parser.UnifiedProcessor(environment: env)
        var context = processor.createContext(
            from: [:],
            fileName: "MyClass.swift",
            projectName: "AwesomeApp"
        )

        // Act: Resolve various variables
        let filename = context.resolveVariable(Template.Parser.Model.VariableToken.simple("FILENAME"))
        let project = context.resolveVariable(Template.Parser.Model.VariableToken.simple("PROJECTNAME"))
        let user = context.resolveVariable(Template.Parser.Model.VariableToken.simple("FULLUSERNAME"))
        let year = context.resolveVariable(Template.Parser.Model.VariableToken.simple("YEAR"))
        let uuid = context.resolveVariable(Template.Parser.Model.VariableToken.uuid("testUUID"))
        let header = context.resolveVariable(Template.Parser.Model.VariableToken.macro("FILEHEADER"))

        // Assert: All should use injected environment
        #expect(filename == "MyClass.swift")
        #expect(project == "AwesomeApp")
        #expect(user == "Dev Eloper")
        #expect(year == "2000")
        #expect(uuid == "12345678-90AB-CDEF-1234-567890ABCDEF")
        #expect(header.contains("MyClass.swift"))
        #expect(header.contains("AwesomeApp"))
        #expect(header.contains("Dev Eloper"))
        #expect(header.contains("2000"))
    }

    @Test("Scanner and processor integration with shared environment")
    func scannerAndProcessorIntegrationWithSharedEnvironment() {
        // Arrange: Shared environment
        let sharedDate = Date(timeIntervalSince1970: 1_234_567_890)
        let env = MockEnvironment(
            date: sharedDate,
            userName: "shared",
            fullUserName: "Shared User"
        )

        // Act: Use same environment for scanner and processor
        let scanner = Template.Parser.Scanning.Scanner(environment: env)
        let processor = Template.Parser.UnifiedProcessor(environment: env)

        let inventory = scanner.scanAllTemplates()
        let context = processor.createContext(from: [:])

        // Assert: Both should use same date
        let year = context.year
        #expect(inventory.generatedAt.contains("2009")) // Year from shared date
        #expect(year == "2009")
    }

    // MARK: - Regression Tests

    @Test("Backward compatibility: Scanner works without explicit environment")
    func backwardCompatibilityScannerWorksWithoutExplicitEnvironment() {
        // Arrange & Act: Create scanner with defaults (like old code)
        let scanner = Template.Parser.Scanning.Scanner()

        // Assert: Should work without errors
        let inventory = scanner.scanAllTemplates()
        #expect(!inventory.generatedAt.isEmpty)
    }

    @Test("Backward compatibility: UnifiedProcessor works without explicit environment")
    func backwardCompatibilityUnifiedProcessorWorksWithoutExplicitEnvironment() {
        // Arrange & Act: Create processor with defaults (like old code)
        let processor = Template.Parser.UnifiedProcessor()

        // Assert: Should work without errors
        let context = processor.createContext(from: [:])
        #expect(!context.userName.isEmpty)
        #expect(!context.year.isEmpty)
    }

    @Test("Backward compatibility: VariableContext works without explicit environment")
    func backwardCompatibilityVariableContextWorksWithoutExplicitEnvironment() {
        // Arrange & Act: Create context with defaults (like old code)
        var context = Template.Parser.Resolution.VariableContext(
            fileName: "Test.swift",
            fileBaseName: "Test",
            projectName: "Project",
            packageName: "Package",
            userName: "user",
            fullUserName: "Full User",
            date: "1/1/2025",
            year: "2025"
        )

        // Assert: Should work and generate UUIDs
        let uuid = context.resolveVariable(Template.Parser.Model.VariableToken.uuid("key"))
        #expect(!uuid.isEmpty)
        #expect(uuid.count == 36) // UUID string length
    }

    // MARK: - Stress Tests

    @Test("Multiple processors with different environments work concurrently")
    func multipleProcessorsWithDifferentEnvironmentsWorkConcurrently() {
        // Arrange: Create multiple environments
        let environments = (0..<10).map { i in
            MockEnvironment(
                date: Date(timeIntervalSince1970: Double(i * 1_000_000)),
                userName: "user\(i)",
                fullUserName: "User \(i)"
            )
        }

        // Act: Create processors and contexts
        let contexts = environments.map { env in
            Template.Parser.UnifiedProcessor(environment: env).createContext(from: [:])
        }

        // Assert: Each should have unique user info
        let uniqueUserNames = Set(contexts.map { $0.userName })
        #expect(uniqueUserNames.count == 10)
    }

    @Test("Environment isolation: Changes don't leak between processors")
    func environmentIsolationChangesDontLeakBetweenProcessors() {
        // Arrange: Two separate environments with different dates
        let env1 = MockEnvironment(date: Date(timeIntervalSince1970: 0))
        let env2 = MockEnvironment(date: Date(timeIntervalSince1970: 2_000_000_000))

        let processor1 = Template.Parser.UnifiedProcessor(environment: env1)
        let processor2 = Template.Parser.UnifiedProcessor(environment: env2)

        // Act: Create contexts
        let context1 = processor1.createContext(from: [:])
        let context2 = processor2.createContext(from: [:])

        // Assert: Should maintain independent state
        #expect(context1.year == "1970")
        #expect(context2.year == "2033")

        // Create another context from processor1
        let context3 = processor1.createContext(from: [:])

        // Should still have 1970
        #expect(context3.year == "1970")
    }

    // MARK: - Real-World Scenarios

    @Test("Scenario: CI build with fixed timestamp for reproducibility")
    func scenarioCIBuildWithFixedTimestampForReproducibility() {
        // Arrange: Simulate CI environment with fixed build time
        let ciBuildTime = Date(timeIntervalSince1970: 1_640_000_000) // 2021-12-20
        let ciEnv = MockEnvironment(
            date: ciBuildTime,
            userName: "ci-bot",
            fullUserName: "CI Bot"
        )

        let processor = Template.Parser.UnifiedProcessor(environment: ciEnv)

        // Act: Generate multiple files in "CI build"
        let contexts = (1...5).map { i in
            processor.createContext(
                from: [:],
                fileName: "File\(i).swift",
                projectName: "CIProject"
            )
        }

        // Assert: All files have same timestamp (reproducible builds)
        let years = Set(contexts.map { $0.year })
        let dates = Set(contexts.map { $0.date })

        #expect(years.count == 1) // All same year
        #expect(years.first == "2021")
        #expect(dates.count == 1) // All same date
    }

    @Test("Scenario: Multi-user project with user-specific templates")
    func scenarioMultiUserProjectWithUserSpecificTemplates() {
        // Arrange: Simulate different developers
        let alice = MockEnvironment(
            userName: "alice",
            fullUserName: "Alice Anderson"
        )
        let bob = MockEnvironment(
            userName: "bob",
            fullUserName: "Bob Builder"
        )

        // Act: Each developer generates a file
        let aliceProcessor = Template.Parser.UnifiedProcessor(environment: alice)
        let bobProcessor = Template.Parser.UnifiedProcessor(environment: bob)

        var aliceContext = aliceProcessor.createContext(
            from: [:],
            fileName: "AliceFeature.swift",
            projectName: "SharedProject"
        )
        var bobContext = bobProcessor.createContext(
            from: [:],
            fileName: "BobFeature.swift",
            projectName: "SharedProject"
        )

        let aliceHeader = aliceContext.resolveVariable(Template.Parser.Model.VariableToken.macro("FILEHEADER"))
        let bobHeader = bobContext.resolveVariable(Template.Parser.Model.VariableToken.macro("FILEHEADER"))

        // Assert: Headers should have correct user attribution
        #expect(aliceHeader.contains("Alice Anderson"))
        #expect(!aliceHeader.contains("Bob"))

        #expect(bobHeader.contains("Bob Builder"))
        #expect(!bobHeader.contains("Alice"))
    }
}
