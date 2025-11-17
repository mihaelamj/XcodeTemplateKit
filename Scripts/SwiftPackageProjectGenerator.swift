#!/usr/bin/env swift

import Foundation

/*
 Swift Package-Based Project Generator

 Generates projects using Swift Package Manager, which is simpler and more reliable
 than trying to create .xcodeproj files directly.
 */

class SwiftPackageGenerator {
    private let fileManager = FileManager.default

    struct ProjectConfig {
        let name: String
        let category: String
        let type: PackageType
        let description: String

        enum PackageType {
            case executable // App-like
            case library // Framework-like
            case plugin // Build tool plugin
            case macro // Swift macro
        }
    }

    func generatePackage(config: ProjectConfig, outputPath: String) throws {
        let packagePath = "\(outputPath)/\(config.category.replacingOccurrences(of: " > ", with: "_"))/\(config.name)"

        // Create package directory
        try fileManager.createDirectory(atPath: packagePath, withIntermediateDirectories: true)

        // Generate Package.swift
        let packageManifest = generatePackageManifest(config: config)
        try packageManifest.write(
            toFile: "\(packagePath)/Package.swift",
            atomically: true,
            encoding: .utf8
        )

        // Create Sources directory structure
        let sourcesPath = "\(packagePath)/Sources"
        try fileManager.createDirectory(atPath: sourcesPath, withIntermediateDirectories: true)

        // Generate source files based on type
        try generateSourceFiles(config: config, sourcesPath: sourcesPath)

        // Create Tests directory for libraries
        if config.type == .library {
            let testsPath = "\(packagePath)/Tests/\(config.name)Tests"
            try fileManager.createDirectory(atPath: testsPath, withIntermediateDirectories: true)

            let testContent = """
            import XCTest
            @testable import \(config.name)

            final class \(config.name)Tests: XCTestCase {
                func testExample() {
                    XCTAssertTrue(true)
                }
            }
            """
            try testContent.write(
                toFile: "\(testsPath)/\(config.name)Tests.swift",
                atomically: true,
                encoding: .utf8
            )
        }

        // Create README
        let readme = """
        # \(config.name)

        \(config.description)

        ## Generated From Xcode Template

        This project was auto-generated from the Xcode template system.

        - Category: \(config.category)
        - Type: \(config.type)

        ## Usage

        ```bash
        # Build
        swift build

        # Run (for executables)
        swift run

        # Test (for libraries)
        swift test

        # Generate Xcode project
        swift package generate-xcodeproj
        ```
        """
        try readme.write(toFile: "\(packagePath)/README.md", atomically: true, encoding: .utf8)

        print("✅ Generated: \(packagePath)")
    }

    private func generatePackageManifest(config: ProjectConfig) -> String {
        let swiftVersion = "6.0"

        switch config.type {
        case .executable:
            return """
            // swift-tools-version: \(swiftVersion)
            import PackageDescription

            let package = Package(
                name: "\(config.name)",
                platforms: [
                    .macOS(.v14),
                    .iOS(.v17)
                ],
                products: [
                    .executable(name: "\(config.name)", targets: ["\(config.name)"]),
                ],
                targets: [
                    .executableTarget(
                        name: "\(config.name)",
                        dependencies: []
                    ),
                ]
            )
            """

        case .library:
            return """
            // swift-tools-version: \(swiftVersion)
            import PackageDescription

            let package = Package(
                name: "\(config.name)",
                platforms: [
                    .macOS(.v14),
                    .iOS(.v17)
                ],
                products: [
                    .library(name: "\(config.name)", targets: ["\(config.name)"]),
                ],
                targets: [
                    .target(
                        name: "\(config.name)",
                        dependencies: []
                    ),
                    .testTarget(
                        name: "\(config.name)Tests",
                        dependencies: ["\(config.name)"]
                    ),
                ]
            )
            """

        case .plugin:
            return """
            // swift-tools-version: \(swiftVersion)
            import PackageDescription

            let package = Package(
                name: "\(config.name)",
                platforms: [
                    .macOS(.v14)
                ],
                products: [
                    .plugin(name: "\(config.name)", targets: ["\(config.name)"]),
                ],
                targets: [
                    .plugin(
                        name: "\(config.name)",
                        capability: .buildTool()
                    ),
                ]
            )
            """

        case .macro:
            return """
            // swift-tools-version: \(swiftVersion)
            import PackageDescription
            import CompilerPluginSupport

            let package = Package(
                name: "\(config.name)",
                platforms: [
                    .macOS(.v14),
                    .iOS(.v17)
                ],
                products: [
                    .library(name: "\(config.name)", targets: ["\(config.name)"]),
                ],
                dependencies: [
                    .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0"),
                ],
                targets: [
                    .macro(
                        name: "\(config.name)Macros",
                        dependencies: [
                            .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                            .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
                        ]
                    ),
                    .target(
                        name: "\(config.name)",
                        dependencies: ["\(config.name)Macros"]
                    ),
                    .testTarget(
                        name: "\(config.name)Tests",
                        dependencies: ["\(config.name)"]
                    ),
                ]
            )
            """
        }
    }

    private func generateSourceFiles(config: ProjectConfig, sourcesPath: String) throws {
        let targetPath = "\(sourcesPath)/\(config.name)"
        try fileManager.createDirectory(atPath: targetPath, withIntermediateDirectories: true)

        switch config.type {
        case .executable:
            let mainContent = """
            import Foundation

            @main
            struct \(config.name) {
                static func main() {
                    print("Hello from \(config.name)!")
                    print("Generated from Xcode template: \(config.category)")
                }
            }
            """
            try mainContent.write(
                toFile: "\(targetPath)/main.swift",
                atomically: true,
                encoding: .utf8
            )

        case .library:
            let libContent = """
            import Foundation

            /// \(config.description)
            public struct \(config.name) {
                public init() {}

                public func greet() -> String {
                    return "Hello from \(config.name)!"
                }
            }
            """
            try libContent.write(
                toFile: "\(targetPath)/\(config.name).swift",
                atomically: true,
                encoding: .utf8
            )

        case .plugin:
            let pluginContent = """
            import PackagePlugin
            import Foundation

            @main
            struct \(config.name): BuildToolPlugin {
                func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
                    return []
                }
            }
            """
            try pluginContent.write(
                toFile: "\(targetPath)/plugin.swift",
                atomically: true,
                encoding: .utf8
            )

        case .macro:
            let macroContent = """
            import SwiftSyntax
            import SwiftSyntaxMacros

            public struct \(config.name)Macro: ExpressionMacro {
                public static func expansion(
                    of node: some FreestandingMacroExpansionSyntax,
                    in context: some MacroExpansionContext
                ) -> ExprSyntax {
                    return "\"Hello from macro!\""
                }
            }
            """
            try macroContent.write(
                toFile: "\(sourcesPath)/\(config.name)Macros/\(config.name)Macro.swift",
                atomically: true,
                encoding: .utf8
            )
        }
    }
}

// MARK: - Batch Generator

class BatchPackageGenerator {
    private let generator = SwiftPackageGenerator()
    private let outputPath: String

    init(outputPath: String) {
        self.outputPath = outputPath
    }

    func generateAll() {
        let projects: [SwiftPackageGenerator.ProjectConfig] = [
            // MultiPlatform Applications
            .init(
                name: "MultiplatformApp",
                category: "MultiPlatform > Application",
                type: .executable,
                description: "Multi-platform SwiftUI application"
            ),
            .init(
                name: "DocumentApp",
                category: "MultiPlatform > Application",
                type: .executable,
                description: "Multi-platform document-based application"
            ),
            .init(
                name: "GameProject",
                category: "MultiPlatform > Application",
                type: .executable,
                description: "Cross-platform game"
            ),
            .init(
                name: "SafariExtensionApp",
                category: "MultiPlatform > Application",
                type: .executable,
                description: "Safari Extension application"
            ),
            .init(
                name: "AudioUnitExtensionApp",
                category: "MultiPlatform > Application",
                type: .executable,
                description: "Audio Unit Extension application"
            ),

            // Extensions
            .init(
                name: "GenericExtension",
                category: "MultiPlatform > Extension",
                type: .library,
                description: "Generic ExtensionKit extension"
            ),
            .init(
                name: "WidgetExtension",
                category: "MultiPlatform > Extension",
                type: .library,
                description: "Widget extension"
            ),
            .init(
                name: "AudioUnitExtension",
                category: "MultiPlatform > Extension",
                type: .library,
                description: "Audio Unit extension"
            ),

            // Framework & Library
            .init(
                name: "MultiplatformFramework",
                category: "MultiPlatform > Framework",
                type: .library,
                description: "Multi-platform framework"
            ),

            // Tests
            .init(
                name: "UITestingBundle",
                category: "MultiPlatform > Test",
                type: .library,
                description: "UI testing bundle"
            ),
            .init(
                name: "UnitTestingBundle",
                category: "MultiPlatform > Test",
                type: .library,
                description: "Unit testing bundle"
            ),

            // Other
            .init(
                name: "EmptyProject",
                category: "Other",
                type: .library,
                description: "Empty project"
            ),
            .init(
                name: "ExternalBuildSystem",
                category: "Other",
                type: .library,
                description: "External build system project"
            ),
            .init(
                name: "AggregateTarget",
                category: "Other",
                type: .library,
                description: "Aggregate target"
            ),
        ]

        print("🚀 Generating Swift Package projects from Xcode templates...\n")

        var successCount = 0
        var failureCount = 0

        for config in projects {
            do {
                try generator.generatePackage(config: config, outputPath: outputPath)
                successCount += 1
            } catch {
                print("❌ Failed: \(config.name) - \(error.localizedDescription)")
                failureCount += 1
            }
        }

        print("\n📊 Summary:")
        print("  ✅ Success: \(successCount)")
        print("  ❌ Failed: \(failureCount)")
        print("  📁 Output: \(outputPath)")
        print("\n💡 To generate Xcode projects:")
        print("  cd <package-directory>")
        print("  swift package generate-xcodeproj")
    }
}

// MARK: - Main

func main() {
    let outputPath: String
    if CommandLine.arguments.count > 1 {
        outputPath = CommandLine.arguments[1]
    } else {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        outputPath = documentsPath.appendingPathComponent("GeneratedXcodeProjects").path
    }

    print("📦 Swift Package Project Generator")
    print("==================================\n")
    print("Output directory: \(outputPath)\n")

    let generator = BatchPackageGenerator(outputPath: outputPath)
    generator.generateAll()

    print("\n✨ Done!")
}

main()
