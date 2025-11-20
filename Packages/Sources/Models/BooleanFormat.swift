//
//  BooleanFormat.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

extension Template.Model {
    /// Boolean format used in property lists.
    ///
    /// Xcode templates use two different boolean serialization formats:
    /// - **Objective-C format**: String-based "YES" and "NO" (legacy Objective-C convention)
    /// - **Swift format**: XML boolean `<true/>` and `<false/>` (modern property list standard)
    ///
    /// ## Usage in Templates
    ///
    /// **Objective-C format** is used by:
    /// - `HiddenFromChooser` and `HiddenFromLibrary` (legacy template visibility flags)
    /// - All Xcode build settings in Options/Definitions dictionaries (e.g., ENABLE_TESTABILITY)
    ///
    /// **Swift format** is used by:
    /// - Modern template metadata fields: `Concrete`, `LocalizedByDefault`, `ProjectOnly`,
    ///   `SupportsSwiftPackage`, `SuppressTopLevelGroup`, `TargetOnly`
    ///
    /// ## Template Creation
    ///
    /// When writing templates, you must use the correct format:
    /// ```xml
    /// <!-- Objective-C format -->
    /// <key>HiddenFromChooser</key>
    /// <string>YES</string>
    ///
    /// <!-- Swift format -->
    /// <key>Concrete</key>
    /// <true/>
    /// ```
    ///
    /// See `BooleanPropertyFormats.md` for complete documentation.
    public enum BooleanFormat: Hashable, Sendable {
        /// Objective-C boolean format using YES/NO strings.
        ///
        /// Used for legacy template properties and all Xcode build settings.
        /// Serializes as `<string>YES</string>` or `<string>NO</string>`.
        case objectiveCBoolean(Bool)

        /// Swift boolean format using true/false XML booleans.
        ///
        /// Used for modern template metadata properties.
        /// Serializes as `<true/>` or `<false/>`.
        case swiftBoolean(Bool)

        /// The underlying boolean value.
        public var boolValue: Bool {
            switch self {
            case .objectiveCBoolean(let value), .swiftBoolean(let value):
                return value
            }
        }

        /// Create from a string value (YES/NO).
        ///
        /// - Parameter string: "YES" or "NO" string
        /// - Returns: `.objectiveCBoolean` if valid, nil otherwise
        public static func fromObjectiveCString(_ string: String) -> BooleanFormat? {
            switch string {
            case "YES": return .objectiveCBoolean(true)
            case "NO": return .objectiveCBoolean(false)
            default: return nil
            }
        }

        /// Create from a Swift Bool value.
        ///
        /// - Parameter value: Boolean value
        /// - Returns: `.swiftBoolean` wrapping the value
        public static func fromSwiftBool(_ value: Bool) -> BooleanFormat {
            .swiftBoolean(value)
        }

        /// Serialize to Objective-C string representation (YES/NO).
        ///
        /// Use this when writing HiddenFromChooser, HiddenFromLibrary, or build settings to plists.
        ///
        /// - Returns: "YES"/"NO" for Objective-C format, nil for Swift format
        public func toObjectiveCString() -> String? {
            guard case .objectiveCBoolean(let value) = self else { return nil }
            return value ? "YES" : "NO"
        }

        /// Serialize to property list value for PropertyListSerialization.
        ///
        /// Use this when writing boolean values to plist dictionaries before serialization.
        ///
        /// - Returns: String ("YES"/"NO") for Objective-C format, Bool (true/false) for Swift format
        ///
        /// ## Example
        /// ```swift
        /// var plist: [String: Any] = [:]
        ///
        /// // Objective-C boolean
        /// let hidden = BooleanFormat.objectiveCBoolean(true)
        /// plist["HiddenFromChooser"] = hidden.toPropertyListValue()  // "YES"
        ///
        /// // Swift boolean
        /// let concrete = BooleanFormat.swiftBoolean(true)
        /// plist["Concrete"] = concrete.toPropertyListValue()  // true
        /// ```
        public func toPropertyListValue() -> Any {
            switch self {
            case .objectiveCBoolean(let value):
                return value ? "YES" : "NO"
            case .swiftBoolean(let value):
                return value
            }
        }
    }
}
