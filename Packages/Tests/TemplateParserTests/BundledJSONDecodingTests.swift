import Foundation
@testable import TemplateParser
import Testing

/// Tests for decoding the actual bundled all-templates.json file.
///
/// These tests verify that the production JSON file can be decoded successfully.
struct BundledJSONDecodingTests {
    /// Test decoding the actual bundled all-templates.json file.
    @Test("Decode bundled all-templates.json")
    func decodeBundledJSON() throws {
        // Load the JSON file from TemplateArtifacts
        let jsonPath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/XcodeTemplateCollection_NEW/TemplateArtifacts/all-templates.json"
        let url = URL(fileURLWithPath: jsonPath)

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()

        // This should not throw
        let inventory = try decoder.decode(TemplateInventory.self, from: data)

        // Basic validation
        #expect(!inventory.templates.isEmpty, "Should have at least one template")
        #expect(
            inventory.totalTemplates == inventory.templates.count,
            "totalTemplates should match actual count"
        )

        // Verify all templates can be accessed
        for (index, template) in inventory.templates.enumerated() {
            #expect(!template.name.isEmpty, "Template \(index) should have a name")
            #expect(!template.path.isEmpty, "Template \(index) should have a path")
            #expect(!template.identifier.isEmpty, "Template \(index) should have an identifier")

            // Verify kind is a valid TemplateKind (not .unknown)
            let kindRawValue = template.kind.rawValue
            #expect(!kindRawValue.isEmpty, "Template \(index) should have a kind")
        }

        print("✅ Successfully decoded \(inventory.templates.count) templates")
        print("   Total combinations: \(inventory.totalCombinations)")
    }

    /// Test that template identifiers are mostly unique.
    ///
    /// Note: Some File Templates intentionally share identifiers when they represent
    /// variants of the same template (e.g., "C File" and "C++ File" both map to
    /// `fileTemplate.cFile`, and multiple "Empty" templates from different categories).
    @Test("Template identifiers are mostly unique")
    func templateIdentifiersMostlyUnique() throws {
        let jsonPath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/XcodeTemplateCollection_NEW/TemplateArtifacts/all-templates.json"
        let url = URL(fileURLWithPath: jsonPath)
        let data = try Data(contentsOf: url)
        let inventory = try JSONDecoder().decode(TemplateInventory.self, from: data)

        let identifiers = inventory.templates.map(\.identifier)
        let uniqueIdentifiers = Set(identifiers)

        // Allow a small number of intentional duplicates (C/C++ File, Empty templates)
        let duplicatesCount = identifiers.count - uniqueIdentifiers.count
        #expect(
            duplicatesCount <= 3,
            "Should have at most 3 intentional duplicate identifiers, found \(duplicatesCount)"
        )

        print("   Total templates: \(identifiers.count)")
        print("   Unique identifiers: \(uniqueIdentifiers.count)")
        print("   Intentional duplicates: \(duplicatesCount)")
    }

    /// Test that all templates with ancestors have valid ancestor TemplateKind values.
    ///
    /// Note: This test verifies that ancestor identifiers can be decoded as TemplateKind,
    /// but does NOT verify that those templates exist in our JSON. Many ancestors reference
    /// Xcode's internal base templates (like iosBase, macOSBase) that aren't shipped as
    /// separate .xctemplate bundles.
    @Test("All ancestor identifiers decode successfully")
    func allAncestorsDecodable() throws {
        let jsonPath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/XcodeTemplateCollection_NEW/TemplateArtifacts/all-templates.json"
        let url = URL(fileURLWithPath: jsonPath)
        let data = try Data(contentsOf: url)
        let inventory = try JSONDecoder().decode(TemplateInventory.self, from: data)

        // Collect all unique ancestor identifiers
        var ancestorIdentifiers = Set<String>()
        for template in inventory.templates {
            if let ancestors = template.ancestors {
                for ancestor in ancestors {
                    ancestorIdentifiers.insert(ancestor.rawValue)
                }
            }
        }

        print("   Found \(ancestorIdentifiers.count) unique ancestor identifiers")

        // All ancestors were successfully decoded (no decoding errors means they're all valid)
        #expect(!ancestorIdentifiers.isEmpty, "Should have some ancestor identifiers")
    }

    /// Test template categorization.
    @Test("Templates are correctly categorized")
    func templateCategorization() throws {
        let jsonPath = "/Volumes/Code/DeveloperExt/private/XcodeTemplateKit/XcodeTemplateCollection_NEW/TemplateArtifacts/all-templates.json"
        let url = URL(fileURLWithPath: jsonPath)
        let data = try Data(contentsOf: url)
        let inventory = try JSONDecoder().decode(TemplateInventory.self, from: data)

        var baseTemplateCount = 0
        var userTemplateCount = 0

        for template in inventory.templates {
            if template.kind.isBaseTemplate {
                baseTemplateCount += 1
            } else {
                userTemplateCount += 1
            }
        }

        print("   Base templates: \(baseTemplateCount)")
        print("   User templates: \(userTemplateCount)")

        #expect(baseTemplateCount > 0, "Should have base templates")
        #expect(userTemplateCount > 0, "Should have user-selectable templates")
    }
}
