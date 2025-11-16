import Foundation

/// Project template metadata from TemplateInfo.plist
public struct ProjectTemplateInfo: Codable, Sendable {
    public let kind: String
    public let identifier: String?
    public let description: String?
    public let ancestors: [String]?
    public let concrete: Bool?
    public let platforms: [String]?
    public let options: [TemplateOption]?
    public let nodes: [String]?
    public let nameOfInitialFileForEditor: String?

    enum CodingKeys: String, CodingKey {
        case kind = "Kind"
        case identifier = "Identifier"
        case description = "Description"
        case ancestors = "Ancestors"
        case concrete = "Concrete"
        case platforms = "Platforms"
        case options = "Options"
        case nodes = "Nodes"
        case nameOfInitialFileForEditor = "NameOfInitialFileForEditor"
    }
}

/// Template option from Options array
public struct TemplateOption: Codable, Sendable {
    public let identifier: String?
    public let name: String?
    public let description: String?
    public let type: String?
    public let `default`: String?
    public let override: String?
    public let values: [String]?
    public let required: Bool?
    public let notPersisted: Bool?
    public let units: [String: OptionUnit]?

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
        case description = "Description"
        case type = "Type"
        case `default` = "Default"
        case override = "Override"
        case values = "Values"
        case required = "Required"
        case notPersisted = "NotPersisted"
        case units = "Units"
    }
}

/// Unit within an option (for conditional generation)
public struct OptionUnit: Codable, Sendable {
    public let components: [Component]?
    public let nodes: [String]?

    enum CodingKeys: String, CodingKey {
        case components = "Components"
        case nodes = "Nodes"
    }
}

/// Component within a unit
public struct Component: Codable, Sendable {
    public let identifier: String?
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "Identifier"
        case name = "Name"
    }
}
