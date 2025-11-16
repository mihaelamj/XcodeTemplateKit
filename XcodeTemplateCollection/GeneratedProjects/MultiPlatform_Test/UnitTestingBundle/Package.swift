// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "UnitTestingBundle",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "UnitTestingBundle", targets: ["UnitTestingBundle"]),
    ],
    targets: [
        .target(
            name: "UnitTestingBundle",
            dependencies: []
        ),
        .testTarget(
            name: "UnitTestingBundleTests",
            dependencies: ["UnitTestingBundle"]
        ),
    ]
)