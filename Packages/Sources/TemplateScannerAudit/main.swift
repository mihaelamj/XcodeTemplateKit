import Foundation
import TemplateParser

let outputPath = "documents/TemplateInventory.json"
print("🔍 Scanning Xcode templates…")
let scanner = TemplateScanner()
let inventory = scanner.scanAllTemplates()
print("✅ Found \(inventory.templates.count) templates")

let encoder = JSONEncoder()
encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

do {
    let data = try encoder.encode(inventory)
    let url = URL(fileURLWithPath: outputPath)
    try data.write(to: url, options: .atomic)
    print("💾 Wrote inventory to \(outputPath)")
} catch {
    fputs("❌ Failed to write inventory: \(error)\n", stderr)
    exit(1)
}
