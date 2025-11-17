#!/usr/bin/env swift

import Foundation

/*
 Xcode Project Generator

 This script generates actual Xcode projects from project templates.

 Approach:
 1. Try to use Xcode's private frameworks (DVTFoundation, IDEFoundation)
 2. Fallback to CLI approach with xcodebuild
 3. Fallback to AppleScript UI automation

 Note: This requires Xcode to be installed and may need to run
 from within Xcode's framework context.
 */

// MARK: - Models

struct ProjectTemplateInfo {
    let path: String
    let name: String
    let identifier: String?
    let category: String
    let concrete: Bool
    let description: String?
}

// MARK: - Template Scanner

class ProjectTemplateScanner {
    private let templatesPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates"
    private let fileManager = FileManager.default

    func scanConcreteTemplates() -> [ProjectTemplateInfo] {
        var templates: [ProjectTemplateInfo] = []

        guard let enumerator = fileManager.enumerator(atPath: templatesPath) else {
            return templates
        }

        for case let file as String in enumerator {
            if file.hasSuffix(".xctemplate") {
                let fullPath = "\(templatesPath)/\(file)"
                let plistPath = "\(fullPath)/TemplateInfo.plist"

                guard fileManager.fileExists(atPath: plistPath),
                      let plistData = try? Data(contentsOf: URL(fileURLWithPath: plistPath)),
                      let plist = try? PropertyListSerialization.propertyList(
                          from: plistData,
                          format: nil
                      ) as? [String: Any] else {
                    continue
                }

                // Only process concrete templates (ones users can actually select)
                let concrete = plist["Concrete"] as? Bool ?? false
                guard concrete else { continue }

                let name = URL(fileURLWithPath: fullPath).deletingPathExtension().lastPathComponent
                let identifier = plist["Identifier"] as? String
                let description = plist["Description"] as? String
                let category = extractCategory(from: fullPath)

                templates.append(ProjectTemplateInfo(
                    path: fullPath,
                    name: name,
                    identifier: identifier,
                    category: category,
                    concrete: concrete,
                    description: description
                ))
            }
        }

        return templates.sorted { $0.category < $1.category }
    }

    private func extractCategory(from path: String) -> String {
        let components = path.components(separatedBy: "/")
        if let templatesIndex = components.lastIndex(where: { $0 == "Project Templates" }) {
            let categoryComponents = components[(templatesIndex + 1)...]
                .filter { !$0.hasSuffix(".xctemplate") }
            return categoryComponents.joined(separator: " > ")
        }
        return "Unknown"
    }
}

// MARK: - Project Generator

class XcodeProjectGenerator {
    private let outputBasePath: String
    private let fileManager = FileManager.default

    init(outputPath: String) {
        outputBasePath = outputPath
    }

    func generateProject(from template: ProjectTemplateInfo, projectName: String) -> Result<String, Error> {
        let projectPath = "\(outputBasePath)/\(template.category.replacingOccurrences(of: " > ", with: "_"))/\(projectName)"

        // Create output directory
        do {
            try fileManager.createDirectory(atPath: projectPath, withIntermediateDirectories: true)
        } catch {
            return .failure(GeneratorError.directoryCreationFailed(error.localizedDescription))
        }

        // Use AppleScript to automate Xcode
        let result = generateViaAppleScript(
            template: template,
            projectName: projectName,
            outputPath: projectPath
        )

        return result
    }

    private func generateViaAppleScript(
        template: ProjectTemplateInfo,
        projectName: String,
        outputPath: String
    ) -> Result<String, Error> {
        guard let identifier = template.identifier else {
            return .failure(GeneratorError.missingIdentifier)
        }

        // Create AppleScript
        let script = """
        tell application "Xcode"
            activate
        end tell

        delay 1

        tell application "System Events"
            tell process "Xcode"
                -- Open New Project dialog
                keystroke "n" using {command down, shift down}
                delay 2

                -- This is where we'd navigate to the specific template
                -- The actual implementation would need to:
                -- 1. Search or navigate to the template by identifier
                -- 2. Fill in project name
                -- 3. Select output location
                -- 4. Click Create

                -- For now, return error since full UI automation is complex
            end tell
        end tell
        """

        // Note: Full AppleScript implementation would be very complex
        // and brittle across Xcode versions

        return .failure(GeneratorError.appleScriptNotImplemented)
    }

    enum GeneratorError: Error {
        case directoryCreationFailed(String)
        case missingIdentifier
        case appleScriptNotImplemented
        case xcodeNotResponding

        var localizedDescription: String {
            switch self {
            case .directoryCreationFailed(let msg):
                return "Failed to create directory: \(msg)"
            case .missingIdentifier:
                return "Template missing identifier"
            case .appleScriptNotImplemented:
                return "AppleScript automation not fully implemented"
            case .xcodeNotResponding:
                return "Xcode not responding"
            }
        }
    }
}

// MARK: - CLI Wrapper Approach

class CLIProjectGenerator {
    /*
     Alternative approach: Use command-line tools

     Unfortunately, xcodebuild doesn't support creating projects from templates.
     We'd need to use Xcode's internal tools or frameworks.
     */

    func generateUsingCLI(template: ProjectTemplateInfo, projectName: String, outputPath: String) -> Result<String, Error> {
        // Check if there's an xcrun command we can use
        // Spoiler: there isn't a public one for template instantiation

        .failure(NSError(
            domain: "CLIProjectGenerator",
            code: -1,
            userInfo: [NSLocalizedDescriptionKey: "No CLI tool available for project generation"]
        ))
    }
}

// MARK: - Main

func printUsage() {
    print("""
    Xcode Project Generator

    Usage:
        swift XcodeProjectGenerator.swift [command] [options]

    Commands:
        list                    List all concrete project templates
        generate <name>         Generate a specific project from template
        generate-all            Generate projects from all templates

    Options:
        -o <path>              Output directory (default: ~/Documents/GeneratedXcodeProjects)
        -n <name>              Project name (default: template name + "Sample")

    Examples:
        swift XcodeProjectGenerator.swift list
        swift XcodeProjectGenerator.swift generate-all -o ~/Desktop/Projects
    """)
}

func main() {
    let args = CommandLine.arguments

    guard args.count > 1 else {
        printUsage()
        return
    }

    let command = args[1]
    let defaultOutputPath = FileManager.default.homeDirectoryForCurrentUser
        .appendingPathComponent("Documents/GeneratedXcodeProjects")
        .path

    let scanner = ProjectTemplateScanner()

    switch command {
    case "list":
        print("🔍 Scanning for concrete project templates...\n")
        let templates = scanner.scanConcreteTemplates()

        print("Found \(templates.count) concrete project templates:\n")

        var lastCategory = ""
        for template in templates {
            if template.category != lastCategory {
                print("\n📁 \(template.category)")
                lastCategory = template.category
            }
            print("  • \(template.name)")
            if let id = template.identifier {
                print("    ID: \(id)")
            }
            if let desc = template.description {
                print("    \(desc)")
            }
        }

    case "generate-all":
        print("⚠️  Full project generation requires Xcode UI automation")
        print("This is not yet fully implemented due to complexity.\n")

        print("What IS implemented:")
        print("  ✅ Template scanning and metadata extraction")
        print("  ✅ File template generation")
        print("\nWhat is NOT implemented:")
        print("  ❌ Automated Xcode UI driving")
        print("  ❌ Direct project file creation (requires private APIs)")
        print("\nWorkaround:")
        print("  Use Xcode manually: File → New → Project")
        print("  Or use the template metadata in XcodeTemplateArtifacts/")

    default:
        printUsage()
    }
}

main()
