// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DocumentApp",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .executable(name: "DocumentApp", targets: ["DocumentApp"]),
    ],
    targets: [
        .executableTarget(
            name: "DocumentApp",
            dependencies: []
        ),
    ]
)