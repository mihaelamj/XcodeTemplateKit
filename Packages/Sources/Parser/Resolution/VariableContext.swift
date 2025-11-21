import Foundation
import Models

extension Template.Parser.Resolution {
    /// Context for resolving template variables
    public struct VariableContext: Sendable {
        // File information
        public let fileName: String
        public let fileBaseName: String

        // Project information
        public let projectName: String
        public let packageName: String

        // User information
        public let userName: String
        public let fullUserName: String

        // Date/time
        public let date: String
        public let year: String

        // Template options
        public let options: [String: String]

        // Environment for UUID generation
        private let environment: TemplateEnvironment

        // UUID cache (not thread-safe, use with caution)
        private var uuidCache: [String: String]

        /// Creates a variable context with the specified values.
        ///
        /// - Parameters:
        ///   - fileName: The file name including extension.
        ///   - fileBaseName: The file name without extension.
        ///   - projectName: The project name.
        ///   - packageName: The package name.
        ///   - userName: The user's short name.
        ///   - fullUserName: The user's full name.
        ///   - date: The formatted date string.
        ///   - year: The year string.
        ///   - options: Template options dictionary.
        ///   - environment: Environment for system dependencies. Defaults to `SystemEnvironment()`.
        public init(
            fileName: String,
            fileBaseName: String,
            projectName: String,
            packageName: String,
            userName: String,
            fullUserName: String,
            date: String,
            year: String,
            options: [String: String] = [:],
            environment: TemplateEnvironment = SystemEnvironment()
        ) {
            self.fileName = fileName
            self.fileBaseName = fileBaseName
            self.projectName = projectName
            self.packageName = packageName
            self.userName = userName
            self.fullUserName = fullUserName
            self.date = date
            self.year = year
            self.options = options
            self.environment = environment
            uuidCache = [:]
        }

        /// Resolve a variable token to its string value
        public mutating func resolveVariable(_ token: Template.Parser.Model.VariableToken) -> String {
            switch token {
            case .simple(let name):
                return resolveSimple(name)

            case .transformed(let name, let transforms):
                let value = resolveSimple(name)
                return apply(transforms, to: value)

            case .option(let name, let transforms):
                let value = options[name] ?? ""
                return apply(transforms, to: value)

            case .uuid(let key):
                if let cached = uuidCache[key] {
                    return cached
                }
                let uuid = environment.generateUUID().uuidString
                uuidCache[key] = uuid
                return uuid

            case .macro(let name):
                return resolveMacro(name)
            }
        }

        private func resolveSimple(_ name: String) -> String {
            switch name {
            case "FILEBASENAME":
                return fileBaseName
            case "FILENAME":
                return fileName
            case "FILEBASENAMEASIDENTIFIER":
                return apply([.identifier], to: fileBaseName)
            case "PROJECTNAME":
                return projectName
            case "PACKAGENAME":
                return packageName
            case "PACKAGENAMEASIDENTIFIER":
                return apply([.identifier], to: packageName)
            case "USERNAME":
                return userName
            case "FULLUSERNAME":
                return fullUserName
            case "DATE":
                return date
            case "YEAR":
                return year
            default:
                return ""
            }
        }

        private func resolveMacro(_ name: String) -> String {
            switch name {
            case "FILEHEADER":
                return """
                //
                //  \(fileName)
                //  \(projectName)
                //
                //  Created by \(fullUserName) on \(date).
                //  Copyright © \(year) \(fullUserName). All rights reserved.
                //
                """
            case "COPYRIGHT":
                return "Copyright © \(year) \(fullUserName). All rights reserved."
            default:
                return ""
            }
        }

        private func apply(_ transforms: [Template.Parser.Model.Transformation], to value: String) -> String {
            transforms.reduce(value) { currentValue, transform in
                transform.apply(to: currentValue)
            }
        }
    }
}
