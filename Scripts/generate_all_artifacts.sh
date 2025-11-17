#!/bin/bash

set -euo pipefail

# Xcode Template Artifact Generator
# This script generates all possible artifacts from Xcode templates

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_OUTPUT_DIR="$HOME/Documents/XcodeTemplateArtifacts"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  Xcode Template Artifact Generator                      ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
    echo
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

check_xcode() {
    if [ ! -d "/Applications/Xcode.app" ]; then
        print_error "Xcode not found at /Applications/Xcode.app"
        exit 1
    fi
    print_success "Xcode found"
}

# Main script
main() {
    print_header

    # Parse arguments
    OUTPUT_DIR="${1:-$DEFAULT_OUTPUT_DIR}"

    print_info "Output directory: $OUTPUT_DIR"
    echo

    # Check prerequisites
    print_info "Checking prerequisites..."
    check_xcode

    # Run Swift generator
    print_info "Running template generator..."
    echo

    if ! swift "$SCRIPT_DIR/TemplateGenerator.swift" "$OUTPUT_DIR"; then
        print_error "Template generation failed"
        exit 1
    fi

    echo
    print_success "All artifacts generated successfully!"
    print_info "Output location: $OUTPUT_DIR"
    echo
    print_info "Next steps:"
    echo "  1. Review file template artifacts in: $OUTPUT_DIR/File Templates/"
    echo "  2. Review project template metadata in: $OUTPUT_DIR/Project Templates/"
    echo "  3. Use Xcode to create actual projects from project templates"
    echo
    print_info "Opening output directory..."
    open "$OUTPUT_DIR"
}

# Run main
main "$@"
