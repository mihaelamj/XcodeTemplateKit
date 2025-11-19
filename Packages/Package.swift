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

    let templateGeneratorTarget = Target.target(
        name: "TemplateGenerator",
        dependencies: [
            "TemplateParser",
        ]
    )

    let templateGeneratorTestsTarget = Target.testTarget(
        name: "TemplateGeneratorTests",
        dependencies: [
            "TemplateGenerator",
            "TemplateParser",
        ]
    )

    // ---------- Field-specific test targets ----------
    let fieldTestTargets: [Target] = [
        Target.testTarget(name: "AllowedTypesTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/AllowedTypesTests"),
        Target.testTarget(name: "AncestorsTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/AncestorsTests"),
        Target.testTarget(name: "AssociatedTargetSpecificationTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/AssociatedTargetSpecificationTests"),
        Target.testTarget(name: "BuildableTypeTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/BuildableTypeTests"),
        Target.testTarget(name: "ComponentsTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/ComponentsTests"),
        Target.testTarget(name: "ConcreteTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/ConcreteTests"),
        Target.testTarget(name: "DefaultCompletionNameTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/DefaultCompletionNameTests"),
        Target.testTarget(name: "DefinitionsTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/DefinitionsTests"),
        Target.testTarget(name: "DescriptionTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/DescriptionTests"),
        Target.testTarget(name: "HiddenFromChooserTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/HiddenFromChooserTests"),
        Target.testTarget(name: "HiddenFromLibraryTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/HiddenFromLibraryTests"),
        Target.testTarget(name: "IconTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/IconTests"),
        Target.testTarget(name: "IdentifierTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/IdentifierTests"),
        Target.testTarget(name: "ImageTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/ImageTests"),
        Target.testTarget(name: "KindTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/KindTests"),
        Target.testTarget(name: "LocalizedByDefaultTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/LocalizedByDefaultTests"),
        Target.testTarget(name: "MainTemplateFileTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/MainTemplateFileTests"),
        Target.testTarget(name: "NameOfInitialFileForEditorTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/NameOfInitialFileForEditorTests"),
        Target.testTarget(name: "NameTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/NameTests"),
        Target.testTarget(name: "NodesTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/NodesTests"),
        Target.testTarget(name: "OptionConstraintsTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/OptionConstraintsTests"),
        Target.testTarget(name: "OptionsTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/OptionsTests"),
        Target.testTarget(name: "PackageTypeTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/PackageTypeTests"),
        Target.testTarget(name: "PlatformsTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/PlatformsTests"),
        Target.testTarget(name: "ProjectOnlyTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/ProjectOnlyTests"),
        Target.testTarget(name: "ProjectTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/ProjectTests"),
        Target.testTarget(name: "SortOrderTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/SortOrderTests"),
        Target.testTarget(name: "SummaryTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/SummaryTests"),
        Target.testTarget(name: "SupportsSwiftPackageTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/SupportsSwiftPackageTests"),
        Target.testTarget(name: "SuppressTopLevelGroupTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/SuppressTopLevelGroupTests"),
        Target.testTarget(name: "TargetOnlyTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/TargetOnlyTests"),
        Target.testTarget(name: "TargetsTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/TargetsTests"),
        Target.testTarget(name: "TitleTests", dependencies: ["TemplateParser"], path: "Tests/FieldTests/TitleTests"),
    ]

    let templateTargets = [
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
