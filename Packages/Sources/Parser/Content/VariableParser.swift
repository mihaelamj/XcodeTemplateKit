import Foundation
import Models
import Parsing

extension Template.Parser.Content {
    /// Parses template variables like ___FILEBASENAME___ or ___NAME:transform___
    public struct VariableParser: Parser {
        public init() {}

        public var body: some Parser<Substring, Template.Parser.Model.VariableToken> {
            Parse {
                "___"

                OneOf {
                    // UUID: ___UUID:key___
                    Parse(Template.Parser.Model.VariableToken.uuid) {
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
                        Template.Parser.Model.VariableToken.option(name, transforms ?? [])
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
                            return Template.Parser.Model.VariableToken.transformed(name, transforms)
                        } else {
                            // Check if it's a known macro
                            if Self.knownMacros.contains(name) {
                                return Template.Parser.Model.VariableToken.macro(name)
                            }
                            return Template.Parser.Model.VariableToken.simple(name)
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
}
