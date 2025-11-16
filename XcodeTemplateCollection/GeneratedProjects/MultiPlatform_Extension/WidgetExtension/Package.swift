// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "WidgetExtension",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "WidgetExtension", targets: ["WidgetExtension"]),
    ],
    targets: [
        .target(
            name: "WidgetExtension",
            dependencies: []
        ),
        .testTarget(
            name: "WidgetExtensionTests",
            dependencies: ["WidgetExtension"]
        ),
    ]
)