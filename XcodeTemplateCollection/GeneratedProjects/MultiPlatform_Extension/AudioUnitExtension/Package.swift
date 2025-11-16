// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AudioUnitExtension",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "AudioUnitExtension", targets: ["AudioUnitExtension"]),
    ],
    targets: [
        .target(
            name: "AudioUnitExtension",
            dependencies: []
        ),
        .testTarget(
            name: "AudioUnitExtensionTests",
            dependencies: ["AudioUnitExtension"]
        ),
    ]
)