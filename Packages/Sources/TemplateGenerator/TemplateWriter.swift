//
//  TemplateWriter.swift
//  TemplateGenerator
//
//  Created on November 19, 2025.
//

// swiftlint:disable function_body_length cyclomatic_complexity

import Foundation
import TemplateModels

/// Writes Xcode template metadata to property list format.
///
/// This is the inverse of `TemplateScanner` - it takes `TemplateMetadata` and serializes it
/// to a `.plist` file that Xcode can read.
///
/// ## Usage
///
/// ```swift
/// let metadata = TemplateMetadata(
///     kind: .projectTemplateUnitKind,
///     identifier: "com.example.MyTemplate",
///     name: "My Template",
///     description: "A custom template"
/// )
///
/// let writer = TemplateWriter()
/// try writer.write(metadata, to: URL(fileURLWithPath: "TemplateInfo.plist"))
/// ```
///
/// ## Format Requirements
///
/// Different fields require different serialization formats:
///
/// - **Objective-C booleans**: `HiddenFromChooser`, `HiddenFromLibrary` must serialize as "YES"/"NO" strings
/// - **Swift booleans**: `Concrete`, `LocalizedByDefault`, etc. must serialize as `<true/>`/`<false/>` XML
/// - **Complex fields**: `Components`, `Targets`, `Definitions`, `OptionConstraints` are stored as binary Data
///
/// See `BooleanPropertyFormats.md` for complete documentation.
public struct TemplateWriter {
    public init() {}

    /// Write template metadata to a property list file.
    ///
    /// - Parameters:
    ///   - metadata: The template metadata to write
    ///   - url: The destination file URL
    ///   - format: The property list format (default: `.xml`)
    /// - Throws: Serialization or file system errors
    public func write(
        _ metadata: TemplateMetadata,
        to url: URL,
        format: PropertyListSerialization.PropertyListFormat = .xml
    ) throws {
        let plist = try createPlist(from: metadata)
        let data = try PropertyListSerialization.data(fromPropertyList: plist, format: format, options: 0)
        try data.write(to: url)
    }

    /// Create a property list dictionary from template metadata.
    ///
    /// - Parameter metadata: The template metadata
    /// - Returns: Dictionary suitable for `PropertyListSerialization`
    /// - Throws: Serialization errors
    public func createPlist(from metadata: TemplateMetadata) throws -> [String: Any] {
        var plist: [String: Any] = [:]

        // Required fields
        plist["Kind"] = metadata.kind.rawValue
        plist["Identifier"] = metadata.id
        plist["Name"] = metadata.name

        // Optional string fields
        if let description = metadata.description {
            plist["Description"] = description
        }
        if let summary = metadata.summary {
            plist["Summary"] = summary
        }
        if let associatedTargetSpecification = metadata.associatedTargetSpecification {
            plist["AssociatedTargetSpecification"] = associatedTargetSpecification
        }
        if let defaultCompletionName = metadata.defaultCompletionName {
            plist["DefaultCompletionName"] = defaultCompletionName
        }
        if let icon = metadata.icon {
            plist["Icon"] = icon
        }
        if let mainTemplateFile = metadata.mainTemplateFile {
            plist["MainTemplateFile"] = mainTemplateFile
        }
        if let nameOfInitialFileForEditor = metadata.nameOfInitialFileForEditor {
            plist["NameOfInitialFileForEditor"] = nameOfInitialFileForEditor
        }

        // Optional array fields
        if let ancestors = metadata.ancestors {
            plist["Ancestors"] = ancestors
        }
        if let allowedTypes = metadata.allowedTypes {
            plist["AllowedTypes"] = allowedTypes
        }
        if let nodes = metadata.nodes {
            plist["Nodes"] = nodes
        }
        if let platforms = metadata.platforms {
            plist["Platforms"] = platforms
        }

        // Optional integer fields
        if let sortOrder = metadata.sortOrder {
            plist["SortOrder"] = sortOrder
        }

        // Enum fields
        if let buildableType = metadata.buildableType {
            plist["BuildableType"] = buildableType.rawValue
        }
        if let packageType = metadata.packageType {
            plist["PackageType"] = packageType.rawValue
        }
        if let image = metadata.image {
            plist["Image"] = image.rawValue
        }
        if let project = metadata.project {
            plist["Project"] = project.rawValue
        }

        // Objective-C boolean fields (YES/NO strings)
        if let hiddenFromChooser = metadata.hiddenFromChooser {
            let format = TemplateBooleanFormat.objectiveCBoolean(hiddenFromChooser)
            plist["HiddenFromChooser"] = format.toPropertyListValue()
        }
        if let hiddenFromLibrary = metadata.hiddenFromLibrary {
            let format = TemplateBooleanFormat.objectiveCBoolean(hiddenFromLibrary)
            plist["HiddenFromLibrary"] = format.toPropertyListValue()
        }

        // Swift boolean fields (<true/>/<false/>)
        if let concrete = metadata.concrete {
            let format = TemplateBooleanFormat.swiftBoolean(concrete)
            plist["Concrete"] = format.toPropertyListValue()
        }
        if let localizedByDefault = metadata.localizedByDefault {
            let format = TemplateBooleanFormat.swiftBoolean(localizedByDefault)
            plist["LocalizedByDefault"] = format.toPropertyListValue()
        }
        if let projectOnly = metadata.projectOnly {
            let format = TemplateBooleanFormat.swiftBoolean(projectOnly)
            plist["ProjectOnly"] = format.toPropertyListValue()
        }
        if let supportsSwiftPackage = metadata.supportsSwiftPackage {
            let format = TemplateBooleanFormat.swiftBoolean(supportsSwiftPackage)
            plist["SupportsSwiftPackage"] = format.toPropertyListValue()
        }
        if let suppressTopLevelGroup = metadata.suppressTopLevelGroup {
            let format = TemplateBooleanFormat.swiftBoolean(suppressTopLevelGroup)
            plist["SuppressTopLevelGroup"] = format.toPropertyListValue()
        }
        if let targetOnly = metadata.targetOnly {
            let format = TemplateBooleanFormat.swiftBoolean(targetOnly)
            plist["TargetOnly"] = format.toPropertyListValue()
        }

        // Complex fields stored as Data (deserialize back to dictionaries)
        if let componentsData = metadata.components {
            let components = try PropertyListSerialization.propertyList(from: componentsData, format: nil)
            plist["Components"] = components
        }
        if let targetsData = metadata.targets {
            let targets = try PropertyListSerialization.propertyList(from: targetsData, format: nil)
            plist["Targets"] = targets
        }
        if let definitions = metadata.definitions {
            plist["Definitions"] = try serializeDefinitions(definitions)
        }
        if let optionConstraintsData = metadata.optionConstraints {
            let optionConstraints = try PropertyListSerialization.propertyList(from: optionConstraintsData, format: nil)
            plist["OptionConstraints"] = optionConstraints
        }

        // Options field (array of dictionaries)
        if !metadata.options.isEmpty {
            plist["Options"] = try metadata.options.map { try createOptionPlist(from: $0) }
        }

        return plist
    }

    /// Serialize TemplateDefinitions to plist dictionary format.
    ///
    /// - Parameter definitions: The template definitions
    /// - Returns: Dictionary mapping file identifiers to their definitions
    /// - Throws: Serialization errors
    private func serializeDefinitions(_ definitions: TemplateDefinitions) throws -> [String: Any] {
        var result: [String: Any] = [:]

        for (key, value) in definitions.definitions {
            switch value {
            case .string(let string):
                result[key] = string
            case .file(let fileDefinition):
                result[key] = try serializeFileDefinition(fileDefinition)
            }
        }

        return result
    }

    /// Serialize FileDefinition to plist dictionary format.
    ///
    /// - Parameter definition: The file definition
    /// - Returns: Dictionary representation
    /// - Throws: Serialization errors
    private func serializeFileDefinition(_ definition: FileDefinition) throws -> [String: Any] {
        var dict: [String: Any] = [:]

        if let path = definition.path {
            dict["Path"] = path
        }
        if let group = definition.group {
            switch group {
            case .single(let name):
                dict["Group"] = name
            case .path(let components):
                dict["Group"] = components
            }
        }
        if let targetIndices = definition.targetIndices {
            dict["TargetIndices"] = targetIndices
        }
        if let beginning = definition.beginning {
            dict["Beginning"] = beginning
        }
        if let end = definition.end {
            dict["End"] = end
        }
        if let sortOrder = definition.sortOrder {
            dict["SortOrder"] = sortOrder
        }
        if let indent = definition.indent {
            dict["Indent"] = indent
        }
        if let assetGeneration = definition.assetGeneration {
            dict["AssetGeneration"] = try assetGeneration.map { try serializeAssetGeneration($0) }
        }

        return dict
    }

    /// Serialize AssetGenerationConfig to plist dictionary format.
    ///
    /// - Parameter config: The asset generation configuration
    /// - Returns: Dictionary representation
    /// - Throws: Serialization errors
    private func serializeAssetGeneration(_ config: AssetGenerationConfig) throws -> [String: Any] {
        var dict: [String: Any] = [:]

        if let name = config.name {
            dict["Name"] = name
        }
        if let type = config.type {
            dict["Type"] = type
        }
        if let platforms = config.platforms {
            dict["Platforms"] = platforms
        }

        return dict
    }

    /// Create a property list dictionary for a template option.
    ///
    /// - Parameter option: The template option
    /// - Returns: Dictionary representation
    /// - Throws: Serialization errors
    private func createOptionPlist(from option: TemplateOptionJSON) throws -> [String: Any] {
        var optionPlist: [String: Any] = [:]

        // Required fields
        optionPlist["Identifier"] = option.identifier
        optionPlist["Name"] = option.name
        optionPlist["Type"] = option.type

        // Optional fields
        optionPlist["Default"] = option.defaultValue
        if let description = option.description {
            optionPlist["Description"] = description
        }
        if let override = option.override {
            optionPlist["Override"] = override
        }
        if let notPersisted = option.notPersisted {
            optionPlist["NotPersisted"] = notPersisted
        }
        if let required = option.required {
            optionPlist["Required"] = required
        }
        if let emptyReplacement = option.emptyReplacement {
            optionPlist["EmptyReplacement"] = emptyReplacement
        }
        if let sortOrder = option.sortOrder {
            optionPlist["SortOrder"] = sortOrder
        }
        if let values = option.values {
            optionPlist["Values"] = values
        }
        if let valueTitles = option.valueTitles {
            optionPlist["ValueTitles"] = valueTitles
        }
        if let requiredOptionsForValues = option.requiredOptionsForValues {
            optionPlist["RequiredOptionsForValues"] = requiredOptionsForValues
        }
        if let units = option.units {
            var unitsDict: [String: Any] = [:]
            for (key, unit) in units {
                unitsDict[key] = try createUnitPlist(from: unit)
            }
            optionPlist["Units"] = unitsDict
        }

        return optionPlist
    }

    /// Create a property list dictionary for a template option unit.
    ///
    /// - Parameter unit: The template option unit
    /// - Returns: Dictionary representation
    /// - Throws: Serialization errors
    private func createUnitPlist(from unit: TemplateOptionUnit) throws -> [String: Any] {
        var unitPlist: [String: Any] = [:]

        if let components = unit.components {
            unitPlist["Components"] = components.map { component in
                var componentPlist: [String: Any] = [:]
                componentPlist["Identifier"] = component.identifier
                componentPlist["Name"] = component.name
                return componentPlist
            }
        }

        return unitPlist
    }
}
