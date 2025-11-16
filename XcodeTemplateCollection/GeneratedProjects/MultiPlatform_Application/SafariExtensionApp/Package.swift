// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SafariExtensionApp",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .executable(name: "SafariExtensionApp", targets: ["SafariExtensionApp"]),
    ],
    targets: [
        .executableTarget(
            name: "SafariExtensionApp",
            dependencies: []
        ),
    ]
)