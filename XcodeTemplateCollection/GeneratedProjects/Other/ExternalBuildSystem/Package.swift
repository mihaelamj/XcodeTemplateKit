// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ExternalBuildSystem",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "ExternalBuildSystem", targets: ["ExternalBuildSystem"]),
    ],
    targets: [
        .target(
            name: "ExternalBuildSystem",
            dependencies: []
        ),
        .testTarget(
            name: "ExternalBuildSystemTests",
            dependencies: ["ExternalBuildSystem"]
        ),
    ]
)