import Foundation
import TemplateModels
@testable import TemplateParser
import Testing

/// Tests for decoding Metadata from JSON.
///
/// Verifies that template metadata can be correctly decoded from
/// extracted JSON files with proper field mapping.
struct TemplateMetadataDecodingTests {
    /// Test decoding a single template with all fields.
    @Test("Decode template with all fields")
    func decodeFullTemplate() throws {
        let json = """
        {
          "type": "Project",
          "identifier": "com.apple.dt.unit.applicationBase",
          "ancestors": [
            "com.apple.dt.unit.bundleBase"
          ],
          "file_structure": [
            {
              "name": "App.swift",
              "path": "App.swift",
              "absolutePath": "/Applications/Xcode.app/.../App Base.xctemplate/App.swift",
              "isDirectory": false
            }
          ],
          "source_path": "/Applications/Xcode.app/.../App Base.xctemplate",
          "description": "Base application template",
          "category": "Base",
          "name": "App Base",
          "kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
          "concrete": false,
          "options": [
            {
              "Name": "Interface",
              "Type": "popup",
              "Identifier": "interfaceChoice",
              "Default": "SwiftUI",
              "Values": ["SwiftUI", "UIKit"]
            }
          ],
          "totalCombinations": 2
        }
        """

        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        let template = try decoder.decode(Metadata.self, from: data)

        // Verify basic fields
        #expect(template.name == "App Base")
        #expect(template.path == "/Applications/Xcode.app/.../App Base.xctemplate")

        // Verify kind is decoded from "identifier" field
        #expect(template.kind == .applicationBase)
        #expect(template.identifier == "com.apple.dt.unit.applicationBase")

        // Verify ancestors
        #expect(template.ancestors?.count == 1)
        #expect(template.ancestors?.first == .bundleBase)

        // Verify file structure
        #expect(template.fileStructure?.count == 1)
        #expect(template.fileStructure?.first?.name == "App.swift")

        // Verify options
        #expect(template.options.count == 1)
        #expect(template.options.first?.name == "Interface")

        // Verify total combinations
        #expect(template.totalCombinations == 2)
    }

    /// Test decoding template with minimal fields (no options, no file structure).
    @Test("Decode template with minimal fields")
    func decodeMinimalTemplate() throws {
        let json = """
        {
          "identifier": "com.apple.dt.unit.emptyProject",
          "source_path": "/path/to/Empty.xctemplate",
          "name": "Empty",
          "kind": "Xcode.Xcode3.ProjectTemplateUnitKind"
        }
        """

        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        let template = try decoder.decode(Metadata.self, from: data)

        #expect(template.name == "Empty")
        #expect(template.kind == .emptyProject)
        #expect(template.options.isEmpty) // Should default to empty array
        #expect(template.totalCombinations == 1) // Should default to 1
        #expect(template.fileStructure == nil)
        #expect(template.ancestors == nil)
    }

    /// Test decoding template with "path" field instead of "source_path".
    @Test("Decode template with path field")
    func decodeTemplateWithPathField() throws {
        let json = """
        {
          "identifier": "com.apple.dt.unit.multiPlatform.app",
          "path": "/custom/path/App.xctemplate",
          "name": "App",
          "kind": "Xcode.Xcode3.ProjectTemplateUnitKind"
        }
        """

        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        let template = try decoder.decode(Metadata.self, from: data)

        #expect(template.path == "/custom/path/App.xctemplate")
        #expect(template.name == "App")
    }

    /// Test decoding Inventory with multiple templates.
    @Test("Decode template inventory")
    func decodeInventory() throws {
        let json = """
        {
          "generatedAt": "2025-11-17T18:00:00Z",
          "totalTemplates": 2,
          "totalCombinations": 3,
          "templates": [
            {
              "identifier": "com.apple.dt.unit.multiPlatform.app",
              "source_path": "/path/App.xctemplate",
              "name": "App",
              "kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
              "totalCombinations": 2
            },
            {
              "identifier": "com.apple.dt.unit.multiPlatform.framework",
              "source_path": "/path/Framework.xctemplate",
              "name": "Framework",
              "kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
              "totalCombinations": 1
            }
          ]
        }
        """

        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        let inventory = try decoder.decode(Inventory.self, from: data)

        #expect(inventory.totalTemplates == 2)
        #expect(inventory.totalCombinations == 3)
        #expect(inventory.templates.count == 2)
        #expect(inventory.templates[0].name == "App")
        #expect(inventory.templates[1].name == "Framework")
    }
}
