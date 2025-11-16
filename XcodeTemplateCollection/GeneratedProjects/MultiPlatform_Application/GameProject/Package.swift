// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "GameProject",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .executable(name: "GameProject", targets: ["GameProject"]),
    ],
    targets: [
        .executableTarget(
            name: "GameProject",
            dependencies: []
        ),
    ]
)