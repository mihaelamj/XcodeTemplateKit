import Foundation
import Testing
import Models
@testable import Parser

/// Tests for Scanner dependency injection functionality.
///
/// These tests demonstrate that Scanner can be tested deterministically
/// by injecting controlled dependencies instead of using real system APIs.
@Suite("Scanner Dependency Injection Tests")
struct ScannerDITests {

    // MARK: - Deterministic Timestamp Tests

    @Test("Scanner generates deterministic timestamp with MockEnvironment")
    func scannerGeneratesDeterministicTimestamp() {
        // Arrange: Unix epoch (1970-01-01 00:00:00 UTC)
        let env = MockEnvironment(date: Date(timeIntervalSince1970: 0))
        let scanner = Template.Parser.Scanning.Scanner(environment: env)

        // Act: Scan templates (will fail but we can check the timestamp generation)
        let inventory = scanner.scanAllTemplates()

        // Assert: Timestamp should be deterministic
        #expect(inventory.generatedAt.starts(with: "1970-01-01"))
    }

    @Test("Scanner timestamp is consistent across multiple calls")
    func scannerTimestampConsistentAcrossMultipleCalls() {
        // Arrange: Fixed date
        let fixedDate = Date(timeIntervalSince1970: 1_640_000_000) // 2021-12-20
        let env = MockEnvironment(date: fixedDate)
        let scanner = Template.Parser.Scanning.Scanner(environment: env)

        // Act: Call twice
        let inventory1 = scanner.scanAllTemplates()
        let inventory2 = scanner.scanAllTemplates()

        // Assert: Same timestamp both times
        #expect(inventory1.generatedAt == inventory2.generatedAt)
    }

    @Test("Scanner with different environments generates different timestamps")
    func scannerWithDifferentEnvironmentsGeneratesDifferentTimestamps() {
        // Arrange: Two different dates
        let env1 = MockEnvironment(date: Date(timeIntervalSince1970: 0))
        let env2 = MockEnvironment(date: Date(timeIntervalSince1970: 1_000_000_000))

        let scanner1 = Template.Parser.Scanning.Scanner(environment: env1)
        let scanner2 = Template.Parser.Scanning.Scanner(environment: env2)

        // Act
        let inventory1 = scanner1.scanAllTemplates()
        let inventory2 = scanner2.scanAllTemplates()

        // Assert: Different timestamps
        #expect(inventory1.generatedAt != inventory2.generatedAt)
    }

    // MARK: - Default Behavior Tests

    @Test("Scanner with default environment uses real system time")
    func scannerWithDefaultEnvironmentUsesRealSystemTime() {
        // Arrange: No mock, uses SystemEnvironment by default
        let scanner = Template.Parser.Scanning.Scanner()

        // Act
        let before = Date()
        let inventory = scanner.scanAllTemplates()
        let after = Date()

        // Assert: Timestamp should be recent (within reasonable time window)
        let formatter = ISO8601DateFormatter()
        if let inventoryDate = formatter.date(from: inventory.generatedAt) {
            // Check timestamp is not before the test started (with 1 second tolerance)
            #expect(inventoryDate.timeIntervalSince(before) >= -1.0)
            // Check timestamp is not after the test ended (with 1 second tolerance)
            #expect(after.timeIntervalSince(inventoryDate) >= -1.0)
        }
    }

    // MARK: - Edge Cases

    @Test("Scanner handles far future dates correctly")
    func scannerHandlesFarFutureDatesCorrectly() {
        // Arrange: Year 2100
        let futureDate = Date(timeIntervalSince1970: 4_102_444_800) // 2100-01-01
        let env = MockEnvironment(date: futureDate)
        let scanner = Template.Parser.Scanning.Scanner(environment: env)

        // Act
        let inventory = scanner.scanAllTemplates()

        // Assert: Should contain 2100
        #expect(inventory.generatedAt.contains("2100"))
    }

    @Test("Scanner handles past dates correctly")
    func scannerHandlesPastDatesCorrectly() {
        // Arrange: Year 1990
        let pastDate = Date(timeIntervalSince1970: 631_152_000) // 1990-01-01
        let env = MockEnvironment(date: pastDate)
        let scanner = Template.Parser.Scanning.Scanner(environment: env)

        // Act
        let inventory = scanner.scanAllTemplates()

        // Assert: Should contain 1990
        #expect(inventory.generatedAt.contains("1990"))
    }
}
