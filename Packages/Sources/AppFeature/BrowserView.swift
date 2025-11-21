import Models
import Parser
import SwiftUI

/// Template browser with automatic data loading and error handling.
///
/// Loads template inventory from JSON and displays in a NavigationSplitView
/// with sidebar tree and detail pane.
///
/// ## Example
/// ```swift
/// TemplateBrowserView()
/// ```
struct TemplateBrowserView: View {
    @State private var templateInventory: Models.Template.Model.Inventory?
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var treeModel: TemplateTreeModel?
    @State private var selectedNodeID: String?

    private let logger: ActivityLogger

    init(logger: ActivityLogger = OSActivityLogger(subsystem: "com.xcodetemplate.app", category: "TemplateBrowser")) {
        self.logger = logger
    }

    var body: some View {
        NavigationSplitView {
            sidebarContent
                .animation(.easeInOut(duration: 0.3), value: isLoading)
                .animation(.easeInOut(duration: 0.3), value: templateInventory != nil)
        } detail: {
            detailContent
        }
        .task {
            await loadTemplates()
        }
    }

    @ViewBuilder
    private var sidebarContent: some View {
        if isLoading {
            CylonLoadingView("Scanning Xcode templates...")
                .transition(.opacity)
        } else if let error = errorMessage {
            ContentUnavailableView {
                Label("Error Loading Templates", systemImage: "exclamationmark.triangle")
            } description: {
                Text(error)
            }
            .transition(.opacity)
        } else if let treeModel {
            ExpandableTemplateTreeView(treeModel: treeModel, selectedNodeID: $selectedNodeID)
                .transition(.opacity.combined(with: .move(edge: .leading)))
        } else {
            ContentUnavailableView {
                Label("No Templates", systemImage: "doc.text")
            } description: {
                Text("No template data available")
            }
            .transition(.opacity)
        }
    }

    @ViewBuilder
    private var detailContent: some View {
        if let treeModel,
           let nodeID = selectedNodeID,
           let selectedNode = treeModel.node(withID: nodeID) {
            TreeNodeDetailView(node: selectedNode)
        } else {
            ContentUnavailableView {
                Label("Select an Item", systemImage: "doc.text.magnifyingglass")
            } description: {
                Text("Choose an item from the tree to view details")
            }
        }
    }

    private enum TemplateLoadingError: Error {
        case failedToScan
    }

    private func loadTemplates() async {
        isLoading = true
        defer { isLoading = false }

        do {
            logger.log("Scanning Xcode templates...")

            // Scan templates directly from Xcode installation
            let inventory = try await withThrowingTaskGroup(
                of: Models.Template.Model.Inventory.self,
                returning: Models.Template.Model.Inventory.self
            ) { group in
                group.addTask(priority: .userInitiated) {
                    Template.Parser.Scanning.Scanner().scanAllTemplates()
                }

                guard let inventory = try await group.next() else {
                    throw TemplateLoadingError.failedToScan
                }
                group.cancelAll()
                return inventory
            }

            logger.log("Successfully scanned \(inventory.totalTemplates) templates with \(inventory.totalCombinations) combinations")

            // Update state on main thread to avoid "publishing changes from within view updates"
            await MainActor.run {
                templateInventory = inventory
                treeModel = TemplateTreeModel(inventory: inventory)
            }
        } catch {
            let message = "Failed to load templates: \(error.localizedDescription)"
            logger.log("\(message)")
            logger.log("Error details: \(String(describing: error))")
            errorMessage = message
        }
    }
}
