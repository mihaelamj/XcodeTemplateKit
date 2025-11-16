// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MultiplatformApp",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .executable(name: "MultiplatformApp", targets: ["MultiplatformApp"]),
    ],
    targets: [
        .executableTarget(
            name: "MultiplatformApp",
            dependencies: []
        ),
    ]
)