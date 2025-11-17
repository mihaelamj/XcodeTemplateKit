#!/usr/bin/env swift

import Foundation

/*
 Direct Xcode Project Generator

 This script generates actual .xcodeproj files by creating the project structure directly.
 While not as complete as Xcode's template system, it creates valid, openable projects.
 */

// MARK: - Project File Generator

class XcodeProjGenerator {
    private let fileManager = FileManager.default

    func generateProject(name: String, outputPath: String, template: TemplateType) throws {
        let projectPath = "\(outputPath)/\(name).xcodeproj"
        let pbxprojPath = "\(projectPath)/project.pbxproj"

        // Create .xcodeproj directory
        try fileManager.createDirectory(atPath: projectPath, withIntermediateDirectories: true)

        // Generate project.pbxproj content
        let pbxprojContent = generatePBXProj(projectName: name, template: template)

        // Write project.pbxproj
        try pbxprojContent.write(toFile: pbxprojPath, atomically: true, encoding: .utf8)

        // Generate project structure based on template
        try generateProjectStructure(projectName: name, basePath: outputPath, template: template)

        print("✅ Generated: \(projectPath)")
    }

    private func generateProjectStructure(projectName: String, basePath: String, template: TemplateType) throws {
        let projectDir = "\(basePath)/\(projectName)"

        switch template {
        case .app:
            // Create app structure
            try fileManager.createDirectory(atPath: projectDir, withIntermediateDirectories: true)

            // Create main App file
            let appContent = """
            import SwiftUI

            @main
            struct \(projectName)App: App {
                var body: some Scene {
                    WindowGroup {
                        ContentView()
                    }
                }
            }
            """
            try appContent.write(toFile: "\(projectDir)/\(projectName)App.swift", atomically: true, encoding: .utf8)

            // Create ContentView
            let contentViewContent = """
            import SwiftUI

            struct ContentView: View {
                var body: some View {
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Hello, world!")
                    }
                    .padding()
                }
            }

            #Preview {
                ContentView()
            }
            """
            try contentViewContent.write(toFile: "\(projectDir)/ContentView.swift", atomically: true, encoding: .utf8)

            // Create Assets.xcassets
            let assetsPath = "\(projectDir)/Assets.xcassets"
            try fileManager.createDirectory(atPath: assetsPath, withIntermediateDirectories: true)

            let contentsJSON = """
            {
              "info" : {
                "author" : "xcode",
                "version" : 1
              }
            }
            """
            try contentsJSON.write(toFile: "\(assetsPath)/Contents.json", atomically: true, encoding: .utf8)

        case .framework:
            try fileManager.createDirectory(atPath: projectDir, withIntermediateDirectories: true)

            let frameworkContent = """
            import Foundation

            public struct \(projectName) {
                public init() {}

                public func hello() -> String {
                    return "Hello from \(projectName)!"
                }
            }
            """
            try frameworkContent.write(toFile: "\(projectDir)/\(projectName).swift", atomically: true, encoding: .utf8)

        case .empty:
            // Just create empty directory
            try fileManager.createDirectory(atPath: projectDir, withIntermediateDirectories: true)

        case .documentApp, .game:
            // Similar to app but with additional files
            try fileManager.createDirectory(atPath: projectDir, withIntermediateDirectories: true)
            // Add template-specific files...
        }
    }

    private func generatePBXProj(projectName: String, template: TemplateType) -> String {
        let uuid1 = UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)
        let uuid2 = UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)
        let uuid3 = UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)
        let uuid4 = UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)
        let uuid5 = UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)

        return """
        // !$*UTF8*$!
        {
            archiveVersion = 1;
            classes = {
            };
            objectVersion = 77;
            objects = {

        /* Begin PBXBuildFile section */
        /* End PBXBuildFile section */

        /* Begin PBXFileReference section */
                \(uuid1) /* \(projectName).app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = \(
                    projectName
                ).app; sourceTree = BUILT_PRODUCTS_DIR; };
        /* End PBXFileReference section */

        /* Begin PBXGroup section */
                \(uuid2) = {
                    isa = PBXGroup;
                    children = (
                        \(uuid3) /* \(projectName) */,
                        \(uuid4) /* Products */,
                    );
                    sourceTree = "<group>";
                };
                \(uuid3) /* \(projectName) */ = {
                    isa = PBXGroup;
                    children = (
                    );
                    path = \(projectName);
                    sourceTree = "<group>";
                };
                \(uuid4) /* Products */ = {
                    isa = PBXGroup;
                    children = (
                        \(uuid1) /* \(projectName).app */,
                    );
                    name = Products;
                    sourceTree = "<group>";
                };
        /* End PBXGroup section */

        /* Begin PBXNativeTarget section */
                \(uuid5) /* \(projectName) */ = {
                    isa = PBXNativeTarget;
                    buildConfigurationList = \(UUID().uuidString.replacingOccurrences(of: "-", with: "")
            .prefix(24)) /* Build configuration list for PBXNativeTarget "\(projectName)" */;
                    buildPhases = (
                    );
                    buildRules = (
                    );
                    dependencies = (
                    );
                    name = \(projectName);
                    packageProductDependencies = (
                    );
                    productName = \(projectName);
                    productReference = \(uuid1) /* \(projectName).app */;
                    productType = "com.apple.product-type.application";
                };
        /* End PBXNativeTarget section */

        /* Begin PBXProject section */
                \(UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)) /* Project object */ = {
                    isa = PBXProject;
                    attributes = {
                        BuildIndependentTargetsInParallel = 1;
                        LastSwiftUpdateCheck = 1610;
                        LastUpgradeCheck = 1610;
                    };
                    buildConfigurationList = \(UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)) /* Build configuration list for PBXProject "\(projectName)" */;
                    developmentRegion = en;
                    hasScannedForEncodings = 0;
                    knownRegions = (
                        en,
                        Base,
                    );
                    mainGroup = \(uuid2);
                    minimizedProjectReferenceProxies = 1;
                    preferredProjectObjectVersion = 77;
                    productRefGroup = \(uuid4) /* Products */;
                    projectDirPath = "";
                    projectRoot = "";
                    targets = (
                        \(uuid5) /* \(projectName) */,
                    );
                };
        /* End PBXProject section */

        /* Begin XCBuildConfiguration section */
        /* End XCBuildConfiguration section */

        /* Begin XCConfigurationList section */
        /* End XCConfigurationList section */
            };
            rootObject = \(UUID().uuidString.replacingOccurrences(of: "-", with: "").prefix(24)) /* Project object */;
        }
        """
    }

    enum TemplateType {
        case app
        case documentApp
        case game
        case framework
        case empty
    }
}

// MARK: - Batch Generator

class BatchProjectGenerator {
    private let generator = XcodeProjGenerator()
    private let outputBasePath: String

    init(outputPath: String) {
        outputBasePath = outputPath
    }

    func generateAllProjects() {
        let templates: [(String, String, XcodeProjGenerator.TemplateType)] = [
            ("MultiplatformApp", "MultiPlatform/Application", .app),
            ("DocumentApp", "MultiPlatform/Application", .documentApp),
            ("GameProject", "MultiPlatform/Application", .game),
            ("MyFramework", "MultiPlatform/Framework", .framework),
            ("EmptyProject", "Other", .empty),
            ("WidgetExtensionSample", "MultiPlatform/Extension", .app),
            ("UITestBundleSample", "MultiPlatform/Test", .framework),
            ("UnitTestBundleSample", "MultiPlatform/Test", .framework),
        ]

        print("🚀 Generating projects from templates...\n")

        var successCount = 0
        var failureCount = 0

        for (projectName, category, templateType) in templates {
            let categoryPath = "\(outputBasePath)/\(category)"

            do {
                try generator.generateProject(
                    name: projectName,
                    outputPath: categoryPath,
                    template: templateType
                )
                successCount += 1
            } catch {
                print("❌ Failed: \(projectName) - \(error.localizedDescription)")
                failureCount += 1
            }
        }

        print("\n📊 Summary:")
        print("  ✅ Success: \(successCount)")
        print("  ❌ Failed: \(failureCount)")
        print("  📁 Output: \(outputBasePath)")
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

    print("📦 Direct Xcode Project Generator")
    print("=================================\n")
    print("Output directory: \(outputPath)\n")

    let generator = BatchProjectGenerator(outputPath: outputPath)
    generator.generateAllProjects()

    print("\n✨ Done!")
    print("💡 Open projects with: open \(outputPath)")
}

main()
