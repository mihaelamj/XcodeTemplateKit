// swift-tools-version: 6.2

import PackageDescription

// -------------------------------------------------------------

// MARK: Products

// -------------------------------------------------------------

let baseProducts: [Product] = [
    .singleTargetLibrary("SharedModels"),
    .executable(name: "TemplateScannerAudit", targets: ["TemplateScannerAudit"]),
]

let templateProducts: [Product] = [
    .singleTargetLibrary("TemplateParser"),
]

#if os(iOS) || os(macOS)
let appleOnlyProducts: [Product] = [
    .singleTargetLibrary("SharedViews"),
    .singleTargetLibrary("AppFeature"),
]
#else
let appleOnlyProducts: [Product] = []
#endif

// Always expose PlaybookFeature so Xcode shows the scheme
let allProducts = baseProducts + templateProducts + appleOnlyProducts

// -------------------------------------------------------------

// MARK: Dependencies (updated versions)

// -------------------------------------------------------------

let deps: [Package.Dependency] = [
    .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.13.0"),
]

// -------------------------------------------------------------

// MARK: Targets

// -------------------------------------------------------------

let targets: [Target] = {
    // ---------- Shared Models ----------
    let sharedModelsTarget = Target.target(
        name: "SharedModels",
        dependencies: []
    )
    let sharedModelsTestsTarget = Target.testTarget(
        name: "SharedModelsTests",
        dependencies: ["SharedModels"]
    )

    let modelTargets = [
        sharedModelsTarget,
        sharedModelsTestsTarget,
    ]

    // ---------- Templates ----------
    let templateParserTarget = Target.target(
        name: "TemplateParser",
        dependencies: [
            .product(name: "Parsing", package: "swift-parsing"),
        ],
        exclude: ["README.md"]
    )

    let templateParserTestsTarget = Target.testTarget(
        name: "TemplateParserTests",
        dependencies: [
            "TemplateParser",
        ]
    )

    let templateTargets = [
        templateParserTarget,
        templateParserTestsTarget,
        Target.executableTarget(
            name: "TemplateScannerAudit",
            dependencies: [
                "TemplateParser",
            ]
        ),
    ]

    // ---------- Apple-only UI / Components ----------
    #if os(iOS) || os(macOS)
    let sharedViewsTarget = Target.target(
        name: "SharedViews",
        dependencies: []
    )

    let sharedViewsTestsTarget = Target.testTarget(
        name: "SharedViewsTests",
        dependencies: [
            "SharedViews",
        ]
    )

    let appFeatureTarget = Target.target(
        name: "AppFeature",
        dependencies: [
            "SharedModels",
            "TemplateParser",
            "SharedViews",
        ],
        exclude: [
            "DESIGN_RULES.md",
            "SWIFTUI_FINDINGS.md",
        ],
        resources: [
            .process("Resources"),
        ]
    )

    let appFeatureTestsTarget = Target.testTarget(
        name: "AppFeatureTests",
        dependencies: [
            "AppFeature",
            "TemplateParser",
        ]
    )
    #endif

    // Collect UI/component targets
    #if os(iOS) || os(macOS)

    let uiTargets: [Target] = [
        sharedViewsTarget,
        sharedViewsTestsTarget,
        appFeatureTarget,
        appFeatureTestsTarget,
    ]
    #else
    let componentTargets: [Target] = []
    let uiTargets: [Target] = []
    #endif

    return modelTargets + templateTargets + uiTargets
}()

// -------------------------------------------------------------

// MARK: Package

// -------------------------------------------------------------

let package = Package(
    name: "Main",
    platforms: [
        .iOS(.v18),
        .macOS(.v14), // Required for ContentUnavailableView
    ],
    products: allProducts,
    dependencies: deps,
    targets: targets
)

// -------------------------------------------------------------

// MARK: Helper

// -------------------------------------------------------------

extension Product {
    static func singleTargetLibrary(_ name: String) -> Product {
        .library(name: name, targets: [name])
    }
}
