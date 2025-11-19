@testable import AppFeature
import Foundation
import TemplateModels
import TemplateParser
import Testing

@MainActor
struct TemplateTreeModelTests {
    @Test("expandAll synchronizes with cached IDs")
    func expandAllMatchesCachedIDs() {
        let model = makeModel()
        model.expandAll()
        #expect(model.expandedNodes == model.allExpandableNodeIDs())
    }

    @Test("auto-expand returns same nodes as manual expansion")
    func flattenedNodesMatchManualExpansion() {
        let model = makeModel()
        let autoExpanded = model.flattenedNodes(
            roots: model.rootNodes,
            expandedIDs: [],
            autoExpandAll: true
        )
        let manual = model.flattenedNodes(
            roots: model.rootNodes,
            expandedIDs: model.allExpandableNodeIDs(),
            autoExpandAll: false
        )
        #expect(autoExpanded.map(\.id) == manual.map(\.id))
    }

    @Test("filtered nodes normalize whitespace and case")
    func filteredNodesNormalizeSearchText() {
        let model = makeModel()
        let trimmed = model.filteredNodes(matching: "  sample app")
        let uppercase = model.filteredNodes(matching: "SAMPLE APP")
        #expect(!trimmed.isEmpty)
        #expect(trimmed.map(\.id) == uppercase.map(\.id))
    }

    @Test("node lookup returns cached node")
    func nodeLookupReturnsTreeNode() {
        let model = makeModel()
        guard let firstCategory = model.rootNodes.first,
              let firstTemplate = firstCategory.children.first else {
            Issue.record("Missing expected template node")
            return
        }

        let lookup = model.node(withID: firstTemplate.id)
        #expect(lookup?.id == firstTemplate.id)
        #expect(lookup?.children.count == firstTemplate.children.count)
    }

    @Test("invalid node lookup returns nil")
    func invalidNodeLookupReturnsNil() {
        let model = makeModel()
        #expect(model.node(withID: "missing") == nil)
    }
}

private extension TemplateTreeModelTests {
    func makeModel() -> TemplateTreeModel {
        TemplateTreeModel(inventory: sampleInventory())
    }

    func sampleInventory() -> TemplateInventory {
        let projectTemplate = TemplateMetadata(
            name: "Sample App",
            path: "/tmp/SampleApp.xctemplate",
            kind: .app,
            ancestors: [.applicationBase],
            options: [],
            totalCombinations: 2,
            fileStructure: nil
        )

        let fileTemplate = TemplateMetadata(
            name: "Sample View",
            path: "/tmp/SampleView.xctemplate",
            kind: .fileTemplateSwiftUIView,
            ancestors: [.swiftUIAppBase],
            options: [],
            totalCombinations: 1,
            fileStructure: nil
        )

        let templates = [projectTemplate, fileTemplate]
        return TemplateInventory(
            generatedAt: "now",
            templates: templates,
            totalTemplates: templates.count,
            totalCombinations: templates.reduce(0) { $0 + $1.totalCombinations }
        )
    }
}
