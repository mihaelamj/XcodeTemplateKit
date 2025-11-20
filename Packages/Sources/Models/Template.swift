import Foundation

/// Root namespace for all template-related types across all modules
public enum Template {
    /// Model types for template metadata and structure
    public enum Model {}

    /// Parser types for processing templates
    public enum Parser {
        /// Model types for parsing (tokens, transformations, etc.)
        public enum Model {}

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

    /// Generator types for writing templates
    public enum Generator {}
}
