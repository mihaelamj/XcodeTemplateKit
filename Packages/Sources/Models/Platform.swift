import Foundation

extension Template.Model {
    /// Represents an Apple platform that a template supports.
    ///
    /// Platform identifiers use reverse DNS notation (e.g., "com.apple.platform.iphoneos").
    /// Templates can specify which platforms they support via the `platforms` field.
    ///
    /// ## Examples
    /// ```swift
    /// // Single platform
    /// let platforms: [Template.Platform] = [.iOS]
    ///
    /// // Multiple platforms
    /// let platforms: [Template.Platform] = [.iOS, .macOS, .catalyst]
    ///
    /// // Parse from string
    /// let platform = Template.Platform(rawValue: "com.apple.platform.iphoneos") // .iOS
    /// ```
    public enum Platform: Codable, Hashable, Sendable {
        case iOS
        case macOS
        case tvOS
        case watchOS
        case visionOS
        case catalyst
        case unknown(String)

        /// The reverse DNS platform identifier used in Xcode templates.
        public var rawValue: String {
            switch self {
            case .iOS: return "com.apple.platform.iphoneos"
            case .macOS: return "com.apple.platform.macosx"
            case .tvOS: return "com.apple.platform.appletvos"
            case .watchOS: return "com.apple.platform.watchos"
            case .visionOS: return "com.apple.platform.xros"
            case .catalyst: return "com.apple.platform.maccatalyst"
            case .unknown(let value): return value
            }
        }

        /// Human-readable platform name for UI display.
        public var displayName: String {
            switch self {
            case .iOS: return "iOS"
            case .macOS: return "macOS"
            case .tvOS: return "tvOS"
            case .watchOS: return "watchOS"
            case .visionOS: return "visionOS"
            case .catalyst: return "Mac Catalyst"
            case .unknown(let value): return "Unknown (\(value))"
            }
        }

        /// Initialize from a raw platform identifier string.
        public init(rawValue: String) {
            switch rawValue {
            case "com.apple.platform.iphoneos":
                self = .iOS
            case "com.apple.platform.macosx":
                self = .macOS
            case "com.apple.platform.appletvos":
                self = .tvOS
            case "com.apple.platform.watchos":
                self = .watchOS
            case "com.apple.platform.xros":
                self = .visionOS
            case "com.apple.platform.maccatalyst":
                self = .catalyst
            default:
                self = .unknown(rawValue)
            }
        }

        // MARK: - Codable

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self.init(rawValue: rawValue)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }

        // MARK: - Hashable

        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue)
        }

        public static func ==(lhs: Platform, rhs: Platform) -> Bool {
            lhs.rawValue == rhs.rawValue
        }
    }
}

extension Template.Model.Platform: CaseIterable {
    /// All known Apple platforms (excludes `.unknown`).
    public static var allCases: [Template.Model.Platform] {
        [.iOS, .macOS, .tvOS, .watchOS, .visionOS, .catalyst]
    }
}

extension Template.Model.Platform: CustomStringConvertible {
    public var description: String {
        displayName
    }
}
