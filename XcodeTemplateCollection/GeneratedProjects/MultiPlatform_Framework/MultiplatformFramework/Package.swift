// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MultiplatformFramework",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "MultiplatformFramework", targets: ["MultiplatformFramework"]),
    ],
    targets: [
        .target(
            name: "MultiplatformFramework",
            dependencies: []
        ),
        .testTarget(
            name: "MultiplatformFrameworkTests",
            dependencies: ["MultiplatformFramework"]
        ),
    ]
)