import Foundation

/// Root namespace for all template-related types
public enum Template {
    /// Parser types for processing templates
    public enum Parser {
        /// Metadata parsing types
        public enum Metadata {}

        /// Resolution and variable context types
        public enum Resolution {}

        /// Scanning and template discovery types
        public enum Scanning {}

        /// Tree building and hierarchy types
        public enum Tree {}

        /// Content and variable parsing types
        public enum Content {}
    }
}
