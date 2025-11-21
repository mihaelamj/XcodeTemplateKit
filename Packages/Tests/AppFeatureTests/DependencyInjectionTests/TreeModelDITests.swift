import Foundation
import Testing
import Models
@testable import AppFeature

/// Tests for TreeModel dependency injection functionality.
///
/// These tests demonstrate that TreeModel can use SilentLogger for
/// testing without console spam, and that logging behavior is controllable.
@Suite("TreeModel Dependency Injection Tests")
struct TreeModelDITests {

    // MARK: - Test Data

    private func createMockInventory() -> Models.Template.Model.Inventory {
        Models.Template.Model.Inventory(
            generatedAt: "2025-01-01T00:00:00Z",
            templates: [],
            totalTemplates: 0,
            totalCombinations: 0
        )
    }

    private func createInventoryWithTemplates() -> Models.Template.Model.Inventory {
        let kind = Models.Template.Model.Kind(rawValue: "Xcode.IDEFoundation.TextSubstitutionFileTemplateKind")

        let template1 = Models.Template.Model.Metadata(
            name: "Swift File",
            path: "/path/to/swift",
            kind: kind,
            ancestors: nil,
            options: [],
            totalCombinations: 1,
            fileStructure: nil,
            description: nil,
            associatedTargetSpecification: nil,
            buildableType: nil,
            defaultCompletionName: nil,
            hiddenFromChooser: nil,
            hiddenFromLibrary: nil,
            icon: nil,
            image: nil,
            mainTemplateFile: nil,
            templateName: nil,
            nameOfInitialFileForEditor: nil,
            packageType: nil,
            project: nil,
            summary: nil,
            concrete: nil,
            localizedByDefault: nil,
            projectOnly: nil,
            supportsSwiftPackage: nil,
            suppressTopLevelGroup: nil,
            targetOnly: nil,
            sortOrder: nil,
            allowedTypes: nil,
            nodes: nil,
            platforms: nil,
            title: nil,
            components: nil,
            targets: nil,
            definitions: nil,
            optionConstraints: nil,
            rawContent: nil,
            rawContentType: nil
        )

        return Models.Template.Model.Inventory(
            generatedAt: "2025-01-01T00:00:00Z",
            templates: [template1],
            totalTemplates: 1,
            totalCombinations: 1
        )
    }

    // MARK: - Silent Logging Tests

    @Test("TreeModel can be created with SilentLogger")
    @MainActor
    func treeModelCanBeCreatedWithSilentLogger() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createMockInventory()

        // Act: Create model with silent logger
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Assert: Model should be created successfully
        #expect(model.rootNodes.isEmpty)
    }

    @Test("TreeModel flattenedNodes works with SilentLogger")
    @MainActor
    func treeModelFlattenedNodesWorksWithSilentLogger() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Act: This calls logger.beginInterval and logger.endInterval
        let nodes = model.flattenedNodes(
            roots: model.rootNodes,
            expandedIDs: [],
            autoExpandAll: false
        )

        // Assert: Should complete without errors
        #expect(!nodes.isEmpty)
    }

    @Test("TreeModel filteredNodes works with SilentLogger")
    @MainActor
    func treeModelFilteredNodesWorksWithSilentLogger() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Act: This calls logger.emitEvent
        let filtered = model.filteredNodes(matching: "Swift")

        // Assert: Should complete without errors
        #expect(!filtered.isEmpty)
    }

    // MARK: - Default Logger Tests

    @Test("TreeModel uses default logger when not specified")
    @MainActor
    func treeModelUsesDefaultLoggerWhenNotSpecified() {
        // Arrange
        let inventory = createMockInventory()

        // Act: Create without specifying logger (uses OSActivityLogger)
        let model = TemplateTreeModel(inventory: inventory)

        // Assert: Should be created successfully
        #expect(model.rootNodes.isEmpty)
    }

    // MARK: - Tree Building Tests

    @Test("TreeModel builds tree structure correctly")
    @MainActor
    func treeModelBuildsTreeStructureCorrectly() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()

        // Act
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Assert: Should have root nodes for categories
        #expect(!model.rootNodes.isEmpty)
    }

    @Test("TreeModel handles empty inventory")
    @MainActor
    func treeModelHandlesEmptyInventory() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createMockInventory()

        // Act
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Assert: Should handle gracefully
        #expect(model.rootNodes.isEmpty)
    }

    // MARK: - Expansion Tests

    @Test("TreeModel expandAll works correctly")
    @MainActor
    func treeModelExpandAllWorksCorrectly() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Act
        model.expandAll()

        // Assert: Should have expanded nodes
        #expect(!model.expandedNodes.isEmpty)
    }

    @Test("TreeModel collapseAll works correctly")
    @MainActor
    func treeModelCollapseAllWorksCorrectly() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Act
        model.expandAll()
        #expect(!model.expandedNodes.isEmpty)
        model.collapseAll()

        // Assert: Should have no expanded nodes
        #expect(model.expandedNodes.isEmpty)
    }

    @Test("TreeModel toggleExpansion works correctly")
    @MainActor
    func treeModelToggleExpansionWorksCorrectly() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)
        let nodeID = "test-node"

        // Act & Assert: Toggle on
        #expect(!model.isExpanded(nodeID))
        model.toggleExpansion(for: nodeID)
        #expect(model.isExpanded(nodeID))

        // Toggle off
        model.toggleExpansion(for: nodeID)
        #expect(!model.isExpanded(nodeID))
    }

    // MARK: - Node Lookup Tests

    @Test("TreeModel node lookup returns nil for invalid ID")
    @MainActor
    func treeModelNodeLookupReturnsNilForInvalidID() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createMockInventory()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Act
        let node = model.node(withID: "nonexistent-id")

        // Assert
        #expect(node == nil)
    }

    // MARK: - Performance Tests

    @Test("TreeModel flattenedNodes performs efficiently with silent logger")
    @MainActor
    func treeModelFlattenedNodesPerformsEfficientlyWithSilentLogger() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Act: Perform operation multiple times
        let start = Date()
        for _ in 0..<100 {
            _ = model.flattenedNodes(
                roots: model.rootNodes,
                expandedIDs: [],
                autoExpandAll: false
            )
        }
        let duration = Date().timeIntervalSince(start)

        // Assert: Should complete quickly (< 1 second for 100 iterations)
        #expect(duration < 1.0)
    }

    @Test("TreeModel filtering performs efficiently with silent logger")
    @MainActor
    func treeModelFilteringPerformsEfficientlyWithSilentLogger() {
        // Arrange
        let logger = SilentLogger()
        let inventory = createInventoryWithTemplates()
        let model = TemplateTreeModel(inventory: inventory, logger: logger)

        // Act: Perform filtering multiple times
        let start = Date()
        for _ in 0..<100 {
            _ = model.filteredNodes(matching: "Swift")
        }
        let duration = Date().timeIntervalSince(start)

        // Assert: Should use caching and complete quickly
        #expect(duration < 0.1)
    }
}
