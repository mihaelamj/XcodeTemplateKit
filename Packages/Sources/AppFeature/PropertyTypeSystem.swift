import Foundation
import TemplateModels

/// Type system for property metadata - provides type annotations and possible values
enum PropertyType {
    case string
    case integer
    case boolean
    case templateKind
    case templateCategory
    case arrayOfTemplateKinds
    case arrayOfStrings
    case arrayOfOptions
    case fileStructure
    case unknown

    var displayName: String {
        switch self {
        case .string: return "String"
        case .integer: return "Integer"
        case .boolean: return "Boolean"
        case .templateKind: return "Kind"
        case .templateCategory: return "Category"
        case .arrayOfTemplateKinds: return "Array<Kind>"
        case .arrayOfStrings: return "Array<String>"
        case .arrayOfOptions: return "Array<TemplateOption>"
        case .fileStructure: return "Array<FileNode>"
        case .unknown: return "Any"
        }
    }

    var icon: String {
        switch self {
        case .string: return "textformat"
        case .integer: return "number"
        case .boolean: return "checkmark.circle"
        case .templateKind, .templateCategory: return "tag"
        case .arrayOfTemplateKinds, .arrayOfStrings, .arrayOfOptions: return "list.bullet"
        case .fileStructure: return "folder"
        case .unknown: return "questionmark.circle"
        }
    }

    /// Get possible values for this type
    var possibleValues: [String] {
        switch self {
        case .boolean:
            return ["true", "false"]

        case .templateCategory:
            return TemplateModels.Category.allCases.map(\.rawValue)

        case .templateKind:
            // Return a sample of template kinds - there are 158 total
            return [
                "Project Templates:",
                "  • Xcode.Xcode3.ProjectTemplateUnitKind",
                "  • com.apple.dt.unit.iosBase",
                "  • com.apple.dt.unit.macosBase",
                "  • com.apple.dt.unit.tvOSBase",
                "  • com.apple.dt.unit.watchOSBase",
                "",
                "File Templates:",
                "  • Xcode.IDEFoundation.TextSubstitutionFileTemplateKind",
                "  • Xcode.IDEKit.TextSubstitutionFileTemplateKind",
                "",
                "Package Templates:",
                "  • Xcode.IDESwiftPackageSupport.PackageTemplateKind",
                "",
                "Total: 158 template kinds available",
            ]

        case .string:
            return ["Any valid string"]

        case .integer:
            return ["Any positive integer (typically 1-999)"]

        case .arrayOfTemplateKinds:
            return ["Array containing any Kind values"]

        case .arrayOfStrings:
            return ["Array containing string values"]

        case .arrayOfOptions:
            return ["Array of template configuration options"]

        case .fileStructure:
            return ["Array of files and directories"]

        case .unknown:
            return ["Type-specific values"]
        }
    }

    /// Get description for this type
    var description: String {
        switch self {
        case .string:
            return "A text value representing names, paths, or identifiers."

        case .integer:
            return "A numeric value, typically representing counts or combinations."

        case .boolean:
            return "A true/false value indicating a binary state."

        case .templateKind:
            return "Identifies the specific template type. There are 158 different template kinds across project, file, and package templates."

        case .templateCategory:
            return "The broad category this template belongs to: Project Templates, File Templates, or Package Templates."

        case .arrayOfTemplateKinds:
            return "A list of template kinds that this template inherits from. Templates can inherit properties, options, and build settings from multiple ancestors."

        case .arrayOfStrings:
            return "A list of string values, such as available choices for an option."

        case .arrayOfOptions:
            return "Configuration options that appear when creating a new project/file from this template."

        case .fileStructure:
            return "The file and directory structure that will be created when instantiating this template."

        case .unknown:
            return "The type of this property depends on its context."
        }
    }
}

/// Determines the property type based on key and value
enum PropertyTypeResolver {
    static func resolve(key: String, value: String, node: TreeNode) -> PropertyType {
        let lowercaseKey = key.lowercased()

        // Check by key name
        switch lowercaseKey {
        case "name", "path", "identifier":
            return .string

        case "total combinations", "ancestor count", "option count", "root files/folders":
            return .integer

        case "is base template", "is utility template":
            return .boolean

        case "kind" where node.type.isTemplate:
            return .templateKind

        case "category":
            return .templateCategory

        case "ancestors":
            return .arrayOfTemplateKinds

        case "choices":
            return .arrayOfStrings

        case "options":
            return .arrayOfOptions

        case "file structure":
            return .fileStructure

        default:
            // Try to infer from value
            if value.lowercased() == "yes" || value.lowercased() == "no" {
                return .boolean
            }
            if Int(value) != nil {
                return .integer
            }
            return .string
        }
    }
}

extension NodeType {
    var isTemplate: Bool {
        switch self {
        case .template, .ancestorTemplate:
            return true
        default:
            return false
        }
    }
}
