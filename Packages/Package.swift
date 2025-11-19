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

    // ---------- Field-specific test targets ----------
    let fieldTestTargets: [Target] = [
        Target.testTarget(name: "AllowedTypesTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "AncestorsTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "AssociatedTargetSpecificationTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "BuildableTypeTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "ComponentsTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "ConcreteTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "DefaultCompletionNameTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "DefinitionsTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "DescriptionTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "HiddenFromChooserTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "HiddenFromLibraryTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "IconTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "IdentifierTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "ImageTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "KindTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "LocalizedByDefaultTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "MainTemplateFileTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "NameOfInitialFileForEditorTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "NameTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "NodesTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "OptionConstraintsTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "OptionsTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "PackageTypeTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "PlatformsTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "ProjectOnlyTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "ProjectTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "SortOrderTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "SummaryTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "SupportsSwiftPackageTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "SuppressTopLevelGroupTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "TargetOnlyTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "TargetsTests", dependencies: ["TemplateParser"]),
        Target.testTarget(name: "TitleTests", dependencies: ["TemplateParser"]),
    ]

    let templateTargets = [
        templateParserTarget,
        templateParserTestsTarget,
        Target.executableTarget(
            name: "TemplateScannerAudit",
            dependencies: [
                "TemplateParser",
            ]
        ),
    ] + fieldTestTargets

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
