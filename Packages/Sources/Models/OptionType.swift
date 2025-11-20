//
//  OptionType.swift
//  XcodeTemplateKit
//
//  Created on November 17, 2025.
//

import Foundation

extension Template.Model {
    /// Template option types.
    ///
    /// Defines the UI control type for template options in Xcode's template selection dialog.
    ///
    /// ## Example
    /// ```swift
    /// // Popup menu for interface choice
    /// let interfaceOption = Template.OptionType.popup
    /// print(interfaceOption.displayName)  // "Popup"
    ///
    /// // Checkbox for "Include Tests"
    /// let testsOption = Template.OptionType.checkbox
    /// print(testsOption.displayName)  // "Checkbox"
    ///
    /// // Static value (computed, not user-selectable)
    /// let bundleIdOption = Template.OptionType.staticValue
    /// print(bundleIdOption.rawValue)  // "static"
    /// ```
    ///
    /// ## Real-world Examples
    /// - `.popup`: Interface (SwiftUI/UIKit), Storage (None/Core Data/SwiftData), Testing System
    /// - `.checkbox`: Include Tests, Include UI Tests, Use Core Data, Host in CloudKit
    /// - `.text`: Product Name, Organization Name, Build Tool Path, Subtype Code
    /// - `.staticValue`: Bundle Identifier (computed from other values)
    public enum OptionType: String, Hashable, Codable {
        case popup
        case checkbox
        case radio
        case text
        case staticValue = "static"

        public var displayName: String {
            switch self {
            case .popup: return "Popup"
            case .checkbox: return "Checkbox"
            case .radio: return "Radio"
            case .text: return "Text"
            case .staticValue: return "Static"
            }
        }
    }
}
