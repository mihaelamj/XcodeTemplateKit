import Foundation

extension Template.Model {
    /// Represents a Uniform Type Identifier (UTI) used to restrict template availability.
    ///
    /// UTIs define file types and data formats in Apple's ecosystem. Templates use the
    /// `allowedTypes` field to specify which file types they can be used with.
    ///
    /// ## Examples
    /// ```swift
    /// // Swift source files only
    /// let allowedTypes: [Template.UniformTypeIdentifier] = [.swiftSource]
    ///
    /// // C-family source files
    /// let allowedTypes: [Template.UniformTypeIdentifier] = [.cSource, .cPlusPlusSource, .objectiveCSource]
    ///
    /// // Parse from string
    /// let uti = Template.UniformTypeIdentifier(rawValue: "public.swift-source") // .swiftSource
    /// ```
    public enum UniformTypeIdentifier: Codable, Hashable, Sendable {
        // MARK: - Source Code

        case swiftSource
        case objectiveCSource
        case objectiveCPlusPlusSource
        case cSource
        case cPlusPlusSource
        case cHeader
        case metalSource

        // MARK: - Assets

        case image
        case png
        case jpeg
        case heic
        case audio
        case movie
        case pdf

        // MARK: - Data Formats

        case json
        case xml
        case plist
        case yaml
        case text
        case utf8PlainText

        // MARK: - Archive Formats

        case archive
        case zip
        case gzip

        // MARK: - Xcode Specific

        case xcodeProject
        case xcodeWorkspace
        case xcassets
        case storyboard
        case xib
        case xcframework
        case framework
        case bundle
        case application

        // MARK: - Other

        case data
        case directory
        case symbolicLink
        case unknown(String)

        /// The UTI string used in Xcode templates.
        public var rawValue: String {
            switch self {
            // Source Code
            case .swiftSource: return "public.swift-source"
            case .objectiveCSource: return "public.objective-c-source"
            case .objectiveCPlusPlusSource: return "public.objective-c-plus-plus-source"
            case .cSource: return "public.c-source"
            case .cPlusPlusSource: return "public.c-plus-plus-source"
            case .cHeader: return "public.c-header"
            case .metalSource: return "public.metal-source"
            // Assets
            case .image: return "public.image"
            case .png: return "public.png"
            case .jpeg: return "public.jpeg"
            case .heic: return "public.heic"
            case .audio: return "public.audio"
            case .movie: return "public.movie"
            case .pdf: return "com.adobe.pdf"
            // Data Formats
            case .json: return "public.json"
            case .xml: return "public.xml"
            case .plist: return "com.apple.property-list"
            case .yaml: return "public.yaml"
            case .text: return "public.text"
            case .utf8PlainText: return "public.utf8-plain-text"
            // Archive Formats
            case .archive: return "public.archive"
            case .zip: return "public.zip-archive"
            case .gzip: return "org.gnu.gnu-zip-archive"
            // Xcode Specific
            case .xcodeProject: return "com.apple.xcode.project"
            case .xcodeWorkspace: return "com.apple.xcode.workspace"
            case .xcassets: return "com.apple.xcode.xcassets"
            case .storyboard: return "com.apple.interface-builder.storyboard"
            case .xib: return "com.apple.interface-builder.xib"
            case .xcframework: return "com.apple.xcode.xcframework"
            case .framework: return "com.apple.framework"
            case .bundle: return "com.apple.bundle"
            case .application: return "com.apple.application"
            // Other
            case .data: return "public.data"
            case .directory: return "public.folder"
            case .symbolicLink: return "public.symlink"
            case .unknown(let value): return value
            }
        }

        /// Human-readable type name for UI display.
        public var displayName: String {
            switch self {
            // Source Code
            case .swiftSource: return "Swift Source"
            case .objectiveCSource: return "Objective-C Source"
            case .objectiveCPlusPlusSource: return "Objective-C++ Source"
            case .cSource: return "C Source"
            case .cPlusPlusSource: return "C++ Source"
            case .cHeader: return "C Header"
            case .metalSource: return "Metal Source"
            // Assets
            case .image: return "Image"
            case .png: return "PNG Image"
            case .jpeg: return "JPEG Image"
            case .heic: return "HEIC Image"
            case .audio: return "Audio"
            case .movie: return "Video"
            case .pdf: return "PDF Document"
            // Data Formats
            case .json: return "JSON"
            case .xml: return "XML"
            case .plist: return "Property List"
            case .yaml: return "YAML"
            case .text: return "Text"
            case .utf8PlainText: return "UTF-8 Plain Text"
            // Archive Formats
            case .archive: return "Archive"
            case .zip: return "ZIP Archive"
            case .gzip: return "GZIP Archive"
            // Xcode Specific
            case .xcodeProject: return "Xcode Project"
            case .xcodeWorkspace: return "Xcode Workspace"
            case .xcassets: return "Asset Catalog"
            case .storyboard: return "Storyboard"
            case .xib: return "XIB"
            case .xcframework: return "XCFramework"
            case .framework: return "Framework"
            case .bundle: return "Bundle"
            case .application: return "Application"
            // Other
            case .data: return "Data"
            case .directory: return "Directory"
            case .symbolicLink: return "Symbolic Link"
            case .unknown(let value): return "Unknown (\(value))"
            }
        }

        /// File extension commonly associated with this UTI (if applicable).
        public var fileExtension: String? {
            switch self {
            case .swiftSource: return "swift"
            case .objectiveCSource: return "m"
            case .objectiveCPlusPlusSource: return "mm"
            case .cSource: return "c"
            case .cPlusPlusSource: return "cpp"
            case .cHeader: return "h"
            case .metalSource: return "metal"
            case .png: return "png"
            case .jpeg: return "jpg"
            case .heic: return "heic"
            case .pdf: return "pdf"
            case .json: return "json"
            case .xml: return "xml"
            case .plist: return "plist"
            case .yaml: return "yaml"
            case .text, .utf8PlainText: return "txt"
            case .zip: return "zip"
            case .gzip: return "gz"
            case .xcodeProject: return "xcodeproj"
            case .xcodeWorkspace: return "xcworkspace"
            case .xcassets: return "xcassets"
            case .storyboard: return "storyboard"
            case .xib: return "xib"
            case .xcframework: return "xcframework"
            case .framework: return "framework"
            case .bundle: return "bundle"
            case .application: return "app"
            default: return nil
            }
        }

        /// Initialize from a UTI string.
        public init(rawValue: String) {
            switch rawValue {
            // Source Code
            case "public.swift-source":
                self = .swiftSource
            case "public.objective-c-source":
                self = .objectiveCSource
            case "public.objective-c-plus-plus-source":
                self = .objectiveCPlusPlusSource
            case "public.c-source":
                self = .cSource
            case "public.c-plus-plus-source":
                self = .cPlusPlusSource
            case "public.c-header":
                self = .cHeader
            case "public.metal-source":
                self = .metalSource
            // Assets
            case "public.image":
                self = .image
            case "public.png":
                self = .png
            case "public.jpeg":
                self = .jpeg
            case "public.heic":
                self = .heic
            case "public.audio":
                self = .audio
            case "public.movie":
                self = .movie
            case "com.adobe.pdf":
                self = .pdf
            // Data Formats
            case "public.json":
                self = .json
            case "public.xml":
                self = .xml
            case "com.apple.property-list":
                self = .plist
            case "public.yaml":
                self = .yaml
            case "public.text":
                self = .text
            case "public.utf8-plain-text":
                self = .utf8PlainText
            // Archive Formats
            case "public.archive":
                self = .archive
            case "public.zip-archive":
                self = .zip
            case "org.gnu.gnu-zip-archive":
                self = .gzip
            // Xcode Specific
            case "com.apple.xcode.project":
                self = .xcodeProject
            case "com.apple.xcode.workspace":
                self = .xcodeWorkspace
            case "com.apple.xcode.xcassets":
                self = .xcassets
            case "com.apple.interface-builder.storyboard":
                self = .storyboard
            case "com.apple.interface-builder.xib":
                self = .xib
            case "com.apple.xcode.xcframework":
                self = .xcframework
            case "com.apple.framework":
                self = .framework
            case "com.apple.bundle":
                self = .bundle
            case "com.apple.application":
                self = .application
            // Other
            case "public.data":
                self = .data
            case "public.folder":
                self = .directory
            case "public.symlink":
                self = .symbolicLink
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

        public static func ==(lhs: UniformTypeIdentifier, rhs: UniformTypeIdentifier) -> Bool {
            lhs.rawValue == rhs.rawValue
        }
    }
}

extension Template.Model.UniformTypeIdentifier: CaseIterable {
    /// All known UTI types (excludes `.unknown`).
    public static var allCases: [Template.Model.UniformTypeIdentifier] {
        [
            // Source Code
            .swiftSource, .objectiveCSource, .objectiveCPlusPlusSource,
            .cSource, .cPlusPlusSource, .cHeader, .metalSource,
            // Assets
            .image, .png, .jpeg, .heic, .audio, .movie, .pdf,
            // Data Formats
            .json, .xml, .plist, .yaml, .text, .utf8PlainText,
            // Archive Formats
            .archive, .zip, .gzip,
            // Xcode Specific
            .xcodeProject, .xcodeWorkspace, .xcassets, .storyboard, .xib,
            .xcframework, .framework, .bundle, .application,
            // Other
            .data, .directory, .symbolicLink,
        ]
    }
}

extension Template.Model.UniformTypeIdentifier: CustomStringConvertible {
    public var description: String {
        displayName
    }
}
