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
    .singleTargetLibrary("TemplateModels"),
    .singleTargetLibrary("TemplateParser"),
    .singleTargetLibrary("TemplateGenerator"),
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
    let templateModelsTarget = Target.target(
        name: "TemplateModels",
        dependencies: []
    )

    let templateParserTarget = Target.target(
        name: "TemplateParser",
        dependencies: [
            "TemplateModels",
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

    let templateGeneratorTarget = Target.target(
        name: "TemplateGenerator",
        dependencies: [
            "TemplateModels",
        ]
    )

    let templateGeneratorTestsTarget = Target.testTarget(
        name: "TemplateGeneratorTests",
        dependencies: [
            "TemplateGenerator",
            "TemplateParser",
        ]
    )

    // ---------- Parser field test targets ----------
    let parserFieldTestTargets: [Target] = [
        Target.testTarget(name: "AllowedTypesTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/AllowedTypesTests"),
        Target.testTarget(name: "AncestorsTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/AncestorsTests"),
        Target.testTarget(name: "AssociatedTargetSpecificationTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/AssociatedTargetSpecificationTests"),
        Target.testTarget(name: "BuildableTypeTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/BuildableTypeTests"),
        Target.testTarget(name: "ComponentsTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/ComponentsTests"),
        Target.testTarget(name: "ConcreteTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/ConcreteTests"),
        Target.testTarget(name: "DefaultCompletionNameTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/DefaultCompletionNameTests"),
        Target.testTarget(name: "DefinitionsTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/DefinitionsTests"),
        Target.testTarget(name: "DescriptionTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/DescriptionTests"),
        Target.testTarget(name: "HiddenFromChooserTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/HiddenFromChooserTests"),
        Target.testTarget(name: "HiddenFromLibraryTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/HiddenFromLibraryTests"),
        Target.testTarget(name: "IconTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/IconTests"),
        Target.testTarget(name: "IdentifierTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/IdentifierTests"),
        Target.testTarget(name: "ImageTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/ImageTests"),
        Target.testTarget(name: "KindTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/KindTests"),
        Target.testTarget(name: "LocalizedByDefaultTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/LocalizedByDefaultTests"),
        Target.testTarget(name: "MainTemplateFileTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/MainTemplateFileTests"),
        Target.testTarget(name: "NameOfInitialFileForEditorTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/NameOfInitialFileForEditorTests"),
        Target.testTarget(name: "NameTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/NameTests"),
        Target.testTarget(name: "NodesTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/NodesTests"),
        Target.testTarget(name: "OptionConstraintsTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/OptionConstraintsTests"),
        Target.testTarget(name: "OptionsTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/OptionsTests"),
        Target.testTarget(name: "PackageTypeTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/PackageTypeTests"),
        Target.testTarget(name: "PlatformsTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/PlatformsTests"),
        Target.testTarget(name: "ProjectOnlyTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/ProjectOnlyTests"),
        Target.testTarget(name: "ProjectTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/ProjectTests"),
        Target.testTarget(name: "SortOrderTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/SortOrderTests"),
        Target.testTarget(name: "SummaryTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/SummaryTests"),
        Target.testTarget(name: "SupportsSwiftPackageTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/SupportsSwiftPackageTests"),
        Target.testTarget(name: "SuppressTopLevelGroupTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/SuppressTopLevelGroupTests"),
        Target.testTarget(name: "TargetOnlyTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/TargetOnlyTests"),
        Target.testTarget(name: "TargetsTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/TargetsTests"),
        Target.testTarget(name: "TitleTests", dependencies: ["TemplateModels", "TemplateParser"], path: "Tests/ParserTests/TitleTests"),
    ]

    let templateTargets = [
        templateModelsTarget,
        templateParserTarget,
        templateParserTestsTarget,
        templateGeneratorTarget,
        templateGeneratorTestsTarget,
        Target.executableTarget(
            name: "TemplateScannerAudit",
            dependencies: [
                "TemplateParser",
            ]
        ),
    ] + parserFieldTestTargets

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
