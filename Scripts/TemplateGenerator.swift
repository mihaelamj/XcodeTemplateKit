#!/usr/bin/env swift

import Foundation

// MARK: - Template Models

struct TemplateInfo: Codable {
    let kind: String?
    let identifier: String?
    let description: String?
    let mainTemplateFile: String?
    let defaultCompletionName: String?
    let ancestors: [String]?
    let concrete: Bool?
    let platforms: [String]?

    enum CodingKeys: String, CodingKey {
        case kind = "Kind"
        case identifier = "Identifier"
        case description = "Description"
        case mainTemplateFile = "MainTemplateFile"
        case defaultCompletionName = "DefaultCompletionName"
        case ancestors = "Ancestors"
        case concrete = "Concrete"
        case platforms = "Platforms"
    }
}

struct TemplateMetadata {
    let path: String
    let name: String
    let type: TemplateType
    let info: TemplateInfo?
    let category: String
}

enum TemplateType: String {
    case file = "File"
    case project = "Project"
    case unknown = "Unknown"

    var displayName: String { rawValue }
}

// MARK: - Template Scanner

class TemplateScanner {
    private let xcodeTemplatesPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates"
    private let fileManager = FileManager.default

    func scanAllTemplates() -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        let fileTemplatesPath = "\(xcodeTemplatesPath)/File Templates"
        let projectTemplatesPath = "\(xcodeTemplatesPath)/Project Templates"

        templates.append(contentsOf: scanTemplates(at: fileTemplatesPath, type: .file))
        templates.append(contentsOf: scanTemplates(at: projectTemplatesPath, type: .project))

        return templates
    }

    private func scanTemplates(at path: String, type: TemplateType) -> [TemplateMetadata] {
        var templates: [TemplateMetadata] = []

        guard let enumerator = fileManager.enumerator(atPath: path) else {
            return templates
        }

        for case let file as String in enumerator {
            if file.hasSuffix(".xctemplate"), !file.contains("/") {
                let fullPath = "\(path)/\(file)"
                if let metadata = parseTemplate(at: fullPath, type: type) {
                    templates.append(metadata)
                }
            } else if file.hasSuffix(".xctemplate") {
                // Nested template
                let fullPath = "\(path)/\(file)"
                if let metadata = parseTemplate(at: fullPath, type: type) {
                    templates.append(metadata)
                }
            }
        }

        return templates
    }

    private func parseTemplate(at path: String, type: TemplateType) -> TemplateMetadata? {
        let plistPath = "\(path)/TemplateInfo.plist"

        guard fileManager.fileExists(atPath: plistPath) else {
            return nil
        }

        let name = URL(fileURLWithPath: path).deletingPathExtension().lastPathComponent
        let category = extractCategory(from: path)

        var info: TemplateInfo?
        if let data = try? Data(contentsOf: URL(fileURLWithPath: plistPath)) {
            let decoder = PropertyListDecoder()
            info = try? decoder.decode(TemplateInfo.self, from: data)
        }

        return TemplateMetadata(
            path: path,
            name: name,
            type: type,
            info: info,
            category: category
        )
    }

    private func extractCategory(from path: String) -> String {
        let components = path.components(separatedBy: "/")
        if let templatesIndex = components.lastIndex(where: { $0.contains("Templates") }) {
            let categoryComponents = components[(templatesIndex + 1)...]
                .filter { !$0.hasSuffix(".xctemplate") }
            let category = categoryComponents.joined(separator: " > ")
            return sanitizePathComponent(category)
        }
        return "Unknown"
    }

    /// Sanitize path components to be safe across all platforms and APIs
    private func sanitizePathComponent(_ component: String) -> String {
        var sanitized = component

        // Replace problematic characters with hyphens
        let problematicChars = [
            ">": "-", // URL encoding, sandboxing issues
            "<": "-", // URL encoding issues
            ":": "-", // macOS legacy, URL issues
            "\"": "", // Quote issues
            "|": "-", // Pipe issues
            "?": "", // Glob wildcard
            "*": "", // Glob wildcard
            "/": "-", // Path separator
            "\\": "-", // Windows path separator
            "%": "", // URL encoding character
            "#": "", // URL fragment
            "&": "-", // URL query separator
        ]

        for (char, replacement) in problematicChars {
            sanitized = sanitized.replacingOccurrences(of: char, with: replacement)
        }

        // Clean up multiple consecutive hyphens
        while sanitized.contains("--") {
            sanitized = sanitized.replacingOccurrences(of: "--", with: "-")
        }

        // Trim leading/trailing hyphens and spaces
        sanitized = sanitized.trimmingCharacters(in: CharacterSet(charactersIn: "- "))

        return sanitized
    }
}

// MARK: - Template Generator

class TemplateGenerator {
    private let outputBasePath: String
    private let fileManager = FileManager.default

    init(outputPath: String) {
        outputBasePath = outputPath
    }

    func generateAll(templates: [TemplateMetadata]) {
        print("📦 Generating artifacts for \(templates.count) templates...")
        print("📍 Output directory: \(outputBasePath)\n")

        // Create output directory
        try? fileManager.createDirectory(atPath: outputBasePath, withIntermediateDirectories: true)

        var successCount = 0
        var failureCount = 0

        for (index, template) in templates.enumerated() {
            let progress = String(format: "[%d/%d]", index + 1, templates.count)
            print("\(progress) Processing: \(template.name) (\(template.type.displayName))")

            do {
                try generate(template: template)
                successCount += 1
                print("  ✅ Success")
            } catch {
                failureCount += 1
                print("  ❌ Failed: \(error.localizedDescription)")
            }
            print()
        }

        print("\n📊 Summary:")
        print("  ✅ Successful: \(successCount)")
        print("  ❌ Failed: \(failureCount)")
        print("  📁 Total: \(templates.count)")
    }

    private func generate(template: TemplateMetadata) throws {
        switch template.type {
        case .file:
            try generateFileTemplate(template)
        case .project:
            try generateProjectTemplate(template)
        case .unknown:
            throw GeneratorError.unsupportedTemplateType
        }
    }

    private func generateFileTemplate(_ template: TemplateMetadata) throws {
        let outputDir = "\(outputBasePath)/File Templates/\(template.category)/\(template.name)"
        try fileManager.createDirectory(atPath: outputDir, withIntermediateDirectories: true)

        // Copy metadata
        let metadataPath = "\(outputDir)/_template_metadata.json"
        let metadata: [String: Any] = [
            "name": template.name,
            "type": template.type.rawValue,
            "category": template.category,
            "source_path": template.path,
            "kind": template.info?.kind ?? "unknown",
            "description": template.info?.description ?? "",
        ]

        if let jsonData = try? JSONSerialization.data(withJSONObject: metadata, options: .prettyPrinted) {
            try jsonData.write(to: URL(fileURLWithPath: metadataPath))
        }

        // Copy template files
        let templateFiles = try fileManager.contentsOfDirectory(atPath: template.path)
        for file in templateFiles where !file.starts(with: ".") {
            let srcPath = "\(template.path)/\(file)"
            let dstPath = "\(outputDir)/\(file)"
            try? fileManager.copyItem(atPath: srcPath, toPath: dstPath)
        }

        // Generate sample instantiation (process template variables)
        if let mainFile = template.info?.mainTemplateFile {
            let sampleDir = "\(outputDir)/_generated_sample"
            try fileManager.createDirectory(atPath: sampleDir, withIntermediateDirectories: true)

            try processFileTemplate(
                sourcePath: template.path,
                mainFile: mainFile,
                outputPath: sampleDir,
                fileName: template.info?.defaultCompletionName ?? "Sample"
            )
        }
    }

    private func processFileTemplate(sourcePath: String, mainFile: String, outputPath: String, fileName: String) throws {
        let templateFilePath = "\(sourcePath)/\(mainFile)"

        guard fileManager.fileExists(atPath: templateFilePath),
              let content = try? String(contentsOfFile: templateFilePath, encoding: .utf8) else {
            return
        }

        // Basic variable substitution
        var processedContent = content
        let replacements: [String: String] = [
            "___FILEBASENAME___": fileName,
            "___FILEBASENAMEASIDENTIFIER___": fileName.replacingOccurrences(of: " ", with: ""),
            "___FILENAME___": "\(fileName).swift",
            "___PACKAGENAME___": "MyPackage",
            "___PACKAGENAMEASIDENTIFIER___": "MyPackage",
            "___PROJECTNAME___": "MyProject",
            "___DATE___": DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none),
            "___YEAR___": String(Calendar.current.component(.year, from: Date())),
            "___USERNAME___": NSUserName(),
            "___FULLUSERNAME___": NSFullUserName(),
            "___COPYRIGHT___": "Copyright © \(Calendar.current.component(.year, from: Date())) \(NSFullUserName()). All rights reserved.",
        ]

        for (key, value) in replacements {
            processedContent = processedContent.replacingOccurrences(of: key, with: value)
        }

        // Handle FILEHEADER
        if processedContent.contains("___FILEHEADER___") {
            let header = """
            //
            //  \(fileName).swift
            //  MyProject
            //
            //  Created by \(NSFullUserName()) on \(DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)).
            //  Copyright © \(Calendar.current.component(.year, from: Date())) \(NSFullUserName()). All rights reserved.
            //
            """
            processedContent = processedContent.replacingOccurrences(of: "___FILEHEADER___", with: header)
        }

        // Determine output filename
        let outputFileName = mainFile
            .replacingOccurrences(of: "___FILEBASENAME___", with: fileName)
            .replacingOccurrences(of: "___FILENAME___", with: "\(fileName).swift")

        let outputFilePath = "\(outputPath)/\(outputFileName)"
        try processedContent.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    }

    private func generateProjectTemplate(_ template: TemplateMetadata) throws {
        let outputDir = "\(outputBasePath)/Project Templates/\(template.category)/\(template.name)"
        try fileManager.createDirectory(atPath: outputDir, withIntermediateDirectories: true)

        // Copy metadata
        let metadataPath = "\(outputDir)/_template_metadata.json"
        let metadata: [String: Any] = [
            "name": template.name,
            "type": template.type.rawValue,
            "category": template.category,
            "source_path": template.path,
            "kind": template.info?.kind ?? "unknown",
            "identifier": template.info?.identifier ?? "",
            "description": template.info?.description ?? "",
            "ancestors": template.info?.ancestors ?? [],
            "concrete": template.info?.concrete ?? false,
        ]

        if let jsonData = try? JSONSerialization.data(withJSONObject: metadata, options: .prettyPrinted) {
            try jsonData.write(to: URL(fileURLWithPath: metadataPath))
        }

        // Copy entire template directory
        let templateFiles = try fileManager.contentsOfDirectory(atPath: template.path)
        for file in templateFiles where !file.starts(with: ".") {
            let srcPath = "\(template.path)/\(file)"
            let dstPath = "\(outputDir)/\(file)"

            if file == "TemplateInfo.plist" {
                try? fileManager.copyItem(atPath: srcPath, toPath: dstPath)
            } else {
                try? fileManager.copyItem(atPath: srcPath, toPath: dstPath)
            }
        }

        // For project templates, we'll create a note about using Xcode to generate
        let readmePath = "\(outputDir)/_README.txt"
        let readmeContent = """
        Project Template: \(template.name)
        Category: \(template.category)
        Identifier: \(template.info?.identifier ?? "N/A")

        This is a project template that requires Xcode to instantiate.

        To generate a project from this template:
        1. Open Xcode
        2. File > New > Project
        3. Navigate to the template category: \(template.category)
        4. Select "\(template.name)"

        Alternatively, use the AppleScript automation in generate_project.scpt
        """

        try readmeContent.write(toFile: readmePath, atomically: true, encoding: .utf8)
    }

    enum GeneratorError: Error {
        case unsupportedTemplateType
        case templateFileNotFound
        case processingFailed(String)
    }
}

// MARK: - Main

func main() {
    print("🎯 Xcode Template Generator")
    print("============================\n")

    // Determine output path
    let outputPath: String
    if CommandLine.arguments.count > 1 {
        outputPath = CommandLine.arguments[1]
    } else {
        // Default to user's Documents folder
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        outputPath = documentsPath.appendingPathComponent("XcodeTemplateArtifacts").path
    }

    print("🔍 Scanning Xcode templates...")
    let scanner = TemplateScanner()
    let templates = scanner.scanAllTemplates()

    print("✅ Found \(templates.count) templates\n")

    // Group by type
    let fileTemplates = templates.filter { $0.type == .file }
    let projectTemplates = templates.filter { $0.type == .project }

    print("📋 Breakdown:")
    print("  📄 File Templates: \(fileTemplates.count)")
    print("  📦 Project Templates: \(projectTemplates.count)")
    print()

    // Generate artifacts
    let generator = TemplateGenerator(outputPath: outputPath)
    generator.generateAll(templates: templates)

    print("\n✨ Done!")
    print("📁 Output location: \(outputPath)")
}

main()
