// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AggregateTarget",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "AggregateTarget", targets: ["AggregateTarget"]),
    ],
    targets: [
        .target(
            name: "AggregateTarget",
            dependencies: []
        ),
        .testTarget(
            name: "AggregateTargetTests",
            dependencies: ["AggregateTarget"]
        ),
    ]
)