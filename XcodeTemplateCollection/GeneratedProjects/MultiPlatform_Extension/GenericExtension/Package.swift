// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "GenericExtension",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: "GenericExtension", targets: ["GenericExtension"]),
    ],
    targets: [
        .target(
            name: "GenericExtension",
            dependencies: []
        ),
        .testTarget(
            name: "GenericExtensionTests",
            dependencies: ["GenericExtension"]
        ),
    ]
)