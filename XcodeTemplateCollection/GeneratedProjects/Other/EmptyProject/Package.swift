// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "EmptyProject",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "EmptyProject", targets: ["EmptyProject"]),
    ],
    targets: [
        .target(
            name: "EmptyProject",
            dependencies: []
        ),
        .testTarget(
            name: "EmptyProjectTests",
            dependencies: ["EmptyProject"]
        ),
    ]
)