// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AudioUnitExtensionApp",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .executable(name: "AudioUnitExtensionApp", targets: ["AudioUnitExtensionApp"]),
    ],
    targets: [
        .executableTarget(
            name: "AudioUnitExtensionApp",
            dependencies: []
        ),
    ]
)