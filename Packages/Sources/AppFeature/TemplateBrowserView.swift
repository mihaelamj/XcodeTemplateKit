import OSLog
import SwiftUI
import TemplateParser

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
    @State private var templateInventory: TemplateInventory?
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var treeModel: TemplateTreeModel?
    @State private var selectedNodeID: String?

    private let logger = Logger(subsystem: "com.xcodetemplate.app", category: "TemplateBrowser")

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
           let selectedNode = findNode(withID: nodeID, in: treeModel.rootNodes) {
            TreeNodeDetailView(node: selectedNode)
        } else {
            ContentUnavailableView {
                Label("Select an Item", systemImage: "doc.text.magnifyingglass")
            } description: {
                Text("Choose an item from the tree to view details")
            }
        }
    }

    private func findNode(withID id: String, in nodes: [TreeNode]) -> TreeNode? {
        for node in nodes {
            if node.id == id {
                return node
            }
            if let found = findNode(withID: id, in: node.children) {
                return found
            }
        }
        return nil
    }

    private func loadTemplates() async {
        isLoading = true
        defer { isLoading = false }

        do {
            logger.info("Scanning Xcode templates...")

            // Scan templates directly from Xcode installation
            let scanner = TemplateScanner()
            let inventory = await Task.detached(priority: .userInitiated) {
                scanner.scanAllTemplates()
            }.value

            logger.info("Successfully scanned \(inventory.totalTemplates) templates with \(inventory.totalCombinations) combinations")

            // Update state on main thread to avoid "publishing changes from within view updates"
            await MainActor.run {
                templateInventory = inventory
                treeModel = TemplateTreeModel(inventory: inventory)
            }
        } catch let decodingError as DecodingError {
            let message: String
            switch decodingError {
            case .typeMismatch(let type, let context):
                message = "Type mismatch for \(type) at \(context.codingPath.map(\.stringValue).joined(separator: ".")): \(context.debugDescription)"
            case .valueNotFound(let type, let context):
                message = "Value not found for \(type) at \(context.codingPath.map(\.stringValue).joined(separator: ".")): \(context.debugDescription)"
            case .keyNotFound(let key, let context):
                message = "Key '\(key.stringValue)' not found at \(context.codingPath.map(\.stringValue).joined(separator: ".")): \(context.debugDescription)"
            case .dataCorrupted(let context):
                message = "Data corrupted at \(context.codingPath.map(\.stringValue).joined(separator: ".")): \(context.debugDescription)"
            @unknown default:
                message = "Decoding error: \(decodingError.localizedDescription)"
            }
            logger.error("Decoding error: \(message)")
            errorMessage = "Failed to decode templates: \(message)"
        } catch {
            let message = "Failed to load templates: \(error.localizedDescription)"
            logger.error("\(message)")
            logger.error("Error details: \(String(describing: error))")
            errorMessage = message
        }
    }
}
