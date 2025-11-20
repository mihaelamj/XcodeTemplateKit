//
//  ImageSourceType.swift
//  TemplateModels
//
//  Created on November 19, 2025.
//

import Foundation

extension Template.Model {
    /// Image source type indicating how template icon should be resolved.
    ///
    /// Specifies whether the image comes from a file, system symbol, bundle, etc.
    /// Appears in 59 templates.
    public enum ImageSourceType: String, Codable, Hashable, Sendable {
        case fileTypeIcon = "FileTypeIcon"
        case systemSymbol = "SystemSymbolName"
        case bundleImage = "BundleImageName"
        case bundleIdentifier = "BundleIdentifier"
    }
}
