//
//  BaseTemplateKind.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation

extension Template.Model {
    // MARK: - BaseTemplateKind (Newtype Wrapper)

    /// A strongly-typed wrapper guaranteeing this is a *base* template kind.
    ///
    /// This enforces that only base templates (where `isBaseTemplate == true`) can be
    /// used as ancestors. The wrapper validates at construction time and during decoding.
    ///
    /// ## Example
    /// ```swift
    /// // Type-safe ancestors - only base templates allowed
    /// let ancestors: [Template.BaseTemplateKind] = [
    ///     .applicationBase,
    ///     .crossPlatformBase,
    ///     .languageChoice
    /// ]
    ///
    /// // Invalid - caught at runtime with clear error
    /// let invalid = Template.BaseTemplateKind(.app)  // 💥 Precondition failure
    /// ```
    ///
    /// ## JSON Encoding
    /// The wrapper is transparent during encoding/decoding - it encodes as the underlying
    /// `Kind` rawValue, so JSON remains unchanged.
    ///
    /// ```json
    /// {
    ///   "ancestors": ["com.apple.dt.unit.applicationBase", "com.apple.dt.unit.base"]
    /// }
    /// ```
    public struct BaseTemplateKind: Codable, Sendable, Hashable {
        /// The underlying template kind.
        public let kind: Kind

        /// Creates a base template kind with validation.
        ///
        /// - Parameter kind: The template kind to wrap.
        /// - Precondition: `kind.isBaseTemplate` must be `true`.
        public init(_ kind: Kind) {
            precondition(
                kind.isBaseTemplate,
                "Invalid BaseTemplateKind: \(kind.rawValue) is NOT a base template."
            )
            self.kind = kind
        }

        /// Failable initializer for safe construction.
        ///
        /// Returns `nil` if the template kind is not a base template.
        ///
        /// ## Example
        /// ```swift
        /// if let baseKind = Template.BaseTemplateKind(safe: .applicationBase) {
        ///     // Use baseKind
        /// }
        /// ```
        public init?(safe kind: Kind) {
            guard kind.isBaseTemplate else { return nil }
            self.kind = kind
        }

        /// Convenience accessor for the underlying template kind.
        public var templateKind: Kind { kind }

        /// Raw value of the underlying template kind.
        public var rawValue: String { kind.rawValue }

        /// Display name of the underlying template kind.
        public var displayName: String { kind.displayName }
    }
}

// MARK: - Codable Conformance

extension Template.Model.BaseTemplateKind {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decoded = try container.decode(Template.Model.Kind.self)

        guard decoded.isBaseTemplate else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Expected a base template kind, got: \(decoded.rawValue)"
            )
        }

        kind = decoded
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(kind)
    }
}

// MARK: - Static Base Template Accessors

extension Template.Model.BaseTemplateKind {
    // Core Base Templates
    public static let base = Template.Model.BaseTemplateKind(.base)
    public static let baseOptions = Template.Model.BaseTemplateKind(.baseOptions)
    public static let baseDefinitionsLanguage = Template.Model.BaseTemplateKind(.baseDefinitionsLanguage)
    public static let baseStorageType = Template.Model.BaseTemplateKind(.baseStorageType)
    public static let baseProjectSettings = Template.Model.BaseTemplateKind(.baseProjectSettings)
    public static let baseAppLifecycle = Template.Model.BaseTemplateKind(.baseAppLifecycle)
    public static let baseTestingSystem = Template.Model.BaseTemplateKind(.baseTestingSystem)
    public static let baseDefinitionsInfoPlist = Template.Model.BaseTemplateKind(.baseDefinitionsInfoPlist)
    public static let securityCriticalBase = Template.Model.BaseTemplateKind(.securityCriticalBase)

    // Platform Base Templates
    public static let crossPlatformBase = Template.Model.BaseTemplateKind(.crossPlatformBase)
    public static let iosAppBase = Template.Model.BaseTemplateKind(.iosAppBase)
    public static let macosAppBase = Template.Model.BaseTemplateKind(.macosAppBase)
    public static let tvosAppBase = Template.Model.BaseTemplateKind(.tvosAppBase)
    public static let multiplatformBase = Template.Model.BaseTemplateKind(.multiplatformBase)

    // Application Base Templates
    public static let applicationBase = Template.Model.BaseTemplateKind(.applicationBase)
    public static let swiftUIAppBase = Template.Model.BaseTemplateKind(.swiftUIAppBase)
    public static let swiftUIDocumentAppBase = Template.Model.BaseTemplateKind(.swiftUIDocumentAppBase)

    // Extension Base Templates
    public static let appExtensionBase = Template.Model.BaseTemplateKind(.appExtensionBase)
    public static let extensionKitExtensionBase = Template.Model.BaseTemplateKind(.extensionKitExtensionBase)
    public static let multiplatformExtensionKitExtensionBase = Template.Model.BaseTemplateKind(.multiplatformExtensionKitExtensionBase)
    public static let multiplatformAppExtensionBase = Template.Model.BaseTemplateKind(.multiplatformAppExtensionBase)

    // Test Bundle Base Templates
    public static let unitTestBundleBase = Template.Model.BaseTemplateKind(.unitTestBundleBase)
    public static let uiTestBundleBase = Template.Model.BaseTemplateKind(.uiTestBundleBase)
    public static let multiplatformUnitTestBundleBase = Template.Model.BaseTemplateKind(.multiplatformUnitTestBundleBase)
    public static let multiplatformUITestBundleBase = Template.Model.BaseTemplateKind(.multiplatformUITestBundleBase)
    public static let swiftUIAppUnitTestBundleBase = Template.Model.BaseTemplateKind(.swiftUIAppUnitTestBundleBase)
    public static let swiftUIAppUITestBundleBase = Template.Model.BaseTemplateKind(.swiftUIAppUITestBundleBase)

    // Other Base Templates
    public static let frameworkBase = Template.Model.BaseTemplateKind(.frameworkBase)
    public static let bundleBase = Template.Model.BaseTemplateKind(.bundleBase)
    public static let metalLibraryBase = Template.Model.BaseTemplateKind(.metalLibraryBase)
    public static let xpcServiceBase = Template.Model.BaseTemplateKind(.xpcServiceBase)

    // Utility Templates
    public static let storageType = Template.Model.BaseTemplateKind(.storageType)
    public static let storageTypeDocumentApp = Template.Model.BaseTemplateKind(.storageTypeDocumentApp)
    public static let languageChoice = Template.Model.BaseTemplateKind(.languageChoice)
    public static let testingSystem = Template.Model.BaseTemplateKind(.testingSystem)
}
