//
//  UnitsParser.swift
//  Parser
//
//  Created on November 20, 2025.
//

import Foundation
import Models

extension Template.Parser.Content {
    /// Parses Options[].Units field which contains heterogeneous unit items.
    ///
    /// Each unit (Swift, Objective-C, Metal, etc.) can have different optional properties:
    /// - Definitions
    /// - Nodes
    /// - Project
    /// - RequiredOptions
    /// - Targets
    /// - Components
    ///
    /// This parser handles the heterogeneous nature of unit items that PropertyListDecoder
    /// cannot handle well due to varying property sets.
    public struct UnitsParser {
        public init() {}

        /// Parse Units dictionary from plist value
        public func parse(_ value: Any?) -> [String: Template.Model.OptionUnit]? {
            guard let unitsDict = value as? [String: Any], !unitsDict.isEmpty else {
                return nil
            }

            var result: [String: Template.Model.OptionUnit] = [:]

            for (unitName, unitValue) in unitsDict {
                guard let unitDict = unitValue as? [String: Any] else {
                    continue
                }

                if let unit = parseUnitItem(unitDict) {
                    result[unitName] = unit
                }
            }

            return result.isEmpty ? nil : result
        }

        /// Parse a single unit item with optional properties
        private func parseUnitItem(_ dict: [String: Any]) -> Template.Model.OptionUnit? {
            // Parse each optional field
            let definitions = parseDefinitions(dict["Definitions"])
            let nodes = dict["Nodes"] as? [String]
            let project = parseProject(dict["Project"])
            let requiredOptions = dict["RequiredOptions"] as? [String: String]
            let targets = parseTargets(dict["Targets"])
            let components = parseComponents(dict["Components"])

            // Return nil if completely empty (shouldn't happen but defensive)
            if definitions == nil, nodes == nil, project == nil,
               requiredOptions == nil, targets == nil, components == nil {
                return nil
            }

            return Template.Model.OptionUnit(
                definitions: definitions,
                nodes: nodes,
                project: project,
                requiredOptions: requiredOptions,
                targets: targets,
                components: components
            )
        }

        // MARK: - Field Parsers

        /// Parse Definitions field (reuse existing parser logic from Scanner)
        private func parseDefinitions(_ value: Any?) -> Template.Model.Definitions? {
            guard let definitionsDict = value as? [String: Any], !definitionsDict.isEmpty else {
                return nil
            }

            var definitions: [String: Template.Model.DefinitionValue] = [:]

            for (key, value) in definitionsDict {
                // Check if it's a string (code snippet) or dictionary (file definition)
                if let stringValue = value as? String {
                    definitions[key] = .string(stringValue)
                } else if let dictValue = value as? [String: Any] {
                    // Convert to proper format for FileDefinition decoding
                    if let data = try? PropertyListSerialization.data(fromPropertyList: dictValue, format: .binary, options: 0),
                       let fileDefinition = try? PropertyListDecoder().decode(Template.Model.FileDefinition.self, from: data) {
                        definitions[key] = .file(fileDefinition)
                    }
                }
            }

            return definitions.isEmpty ? nil : Template.Model.Definitions(definitions: definitions)
        }

        /// Parse Project field
        private func parseProject(_ value: Any?) -> Template.Model.ProjectConfiguration? {
            guard let string = value as? String else { return nil }
            return Template.Model.ProjectConfiguration(rawValue: string)
        }

        /// Parse Targets field (reuse existing parser logic from Scanner)
        private func parseTargets(_ value: Any?) -> Template.Model.Targets? {
            guard let targetsArray = value as? [[String: Any]], !targetsArray.isEmpty else {
                return nil
            }

            // Convert to proper format for Targets decoding
            guard let data = try? PropertyListSerialization.data(fromPropertyList: targetsArray, format: .binary, options: 0),
                  let targets = try? PropertyListDecoder().decode(Template.Model.Targets.self, from: data) else {
                return nil
            }

            return targets
        }

        /// Parse Components field
        private func parseComponents(_ value: Any?) -> [Template.Model.OptionComponent]? {
            guard let componentsArray = value as? [[String: Any]], !componentsArray.isEmpty else {
                return nil
            }

            var components: [Template.Model.OptionComponent] = []

            for componentDict in componentsArray {
                guard let identifier = componentDict["Identifier"] as? String,
                      let name = componentDict["Name"] as? String else {
                    continue
                }

                components.append(Template.Model.OptionComponent(
                    identifier: identifier,
                    name: name
                ))
            }

            return components.isEmpty ? nil : components
        }
    }
}
