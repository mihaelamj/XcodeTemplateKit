import Foundation
import Parsing

/// Parses template variables like ___FILEBASENAME___ or ___NAME:transform___
public struct VariableParser: Parser {
    public init() {}

    public var body: some Parser<Substring, VariableToken> {
        Parse {
            "___"

            OneOf {
                // UUID: ___UUID:key___
                Parse(VariableToken.uuid) {
                    "UUID:"
                    Prefix { $0 != "_" }.map(String.init)
                }

                // Option variable: ___VARIABLE_name:transform___
                Parse {
                    "VARIABLE_"
                    Prefix { $0 != ":" && $0 != "_" }.map(String.init)
                    Optionally {
                        ":"
                        TransformationParser()
                    }
                }
                .map { name, transforms in
                    VariableToken.option(name, transforms ?? [])
                }

                // Simple or transformed: ___NAME:transform___
                Parse {
                    Prefix { $0 != ":" && $0 != "_" }.map(String.init)
                    Optionally {
                        ":"
                        TransformationParser()
                    }
                }
                .map { name, transforms in
                    if let transforms, !transforms.isEmpty {
                        return VariableToken.transformed(name, transforms)
                    } else {
                        // Check if it's a known macro
                        if Self.knownMacros.contains(name) {
                            return VariableToken.macro(name)
                        }
                        return VariableToken.simple(name)
                    }
                }
            }

            "___"
        }
    }

    private static let knownMacros: Set<String> = [
        "FILEHEADER",
        "COPYRIGHT",
    ]
}
