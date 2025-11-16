// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "UITestingBundle",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "UITestingBundle", targets: ["UITestingBundle"]),
    ],
    targets: [
        .target(
            name: "UITestingBundle",
            dependencies: []
        ),
        .testTarget(
            name: "UITestingBundleTests",
            dependencies: ["UITestingBundle"]
        ),
    ]
)