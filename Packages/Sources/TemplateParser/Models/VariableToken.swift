import Foundation

/// Represents different types of template variables
public enum VariableToken: Equatable, Sendable {
    /// Simple variable: ___FILEBASENAME___
    case simple(String)

    /// Variable with transformations: ___FILEBASENAME:identifier___
    case transformed(String, [Transformation])

    /// Option reference: ___VARIABLE_productName:identifier___
    case option(String, [Transformation])

    /// UUID generation: ___UUID:key___
    case uuid(String)

    /// Macro expansion: ___FILEHEADER___
    case macro(String)
}

extension VariableToken: CustomStringConvertible {
    public var description: String {
        switch self {
        case .simple(let name):
            return "simple(\(name))"
        case .transformed(let name, let transforms):
            return "transformed(\(name), \(transforms))"
        case .option(let name, let transforms):
            return "option(\(name), \(transforms))"
        case .uuid(let key):
            return "uuid(\(key))"
        case .macro(let name):
            return "macro(\(name))"
        }
    }
}
