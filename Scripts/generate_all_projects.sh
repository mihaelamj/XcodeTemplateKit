#!/bin/bash

set -euo pipefail

# Complete Xcode Project Generator from Templates
# Generates Swift Packages and Xcode projects from all concrete templates

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_OUTPUT_DIR="$HOME/Documents/GeneratedXcodeProjects"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  Xcode Project Generator from Templates                 ║${NC}"
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

main() {
    print_header

    OUTPUT_DIR="${1:-$DEFAULT_OUTPUT_DIR}"

    print_info "Output directory: $OUTPUT_DIR"
    echo

    # Step 1: Generate Swift Packages
    print_info "Step 1: Generating Swift Packages from templates..."
    echo
    if ! swift "$SCRIPT_DIR/SwiftPackageProjectGenerator.swift" "$OUTPUT_DIR"; then
        echo -e "${RED}❌ Swift Package generation failed${NC}"
        exit 1
    fi

    echo
    print_success "Swift Packages generated!"
    echo

    # Step 2: Generate .xcodeproj files
    print_info "Step 2: Generating .xcodeproj files..."
    echo

    generated_count=0
    failed_count=0

    # Find all Package.swift files
    while IFS= read -r -d '' package_file; do
        package_dir=$(dirname "$package_file")
        package_name=$(basename "$package_dir")

        echo -n "  Generating Xcode project for $package_name... "

        if (cd "$package_dir" && swift package generate-xcodeproj > /dev/null 2>&1); then
            echo -e "${GREEN}✓${NC}"
            ((generated_count++))
        else
            echo -e "${RED}✗${NC}"
            ((failed_count++))
        fi
    done < <(find "$OUTPUT_DIR" -name "Package.swift" -print0)

    echo
    print_success "Xcode project generation complete!"
    echo
    echo "📊 Summary:"
    echo "  📦 Swift Packages: 14"
    echo "  ✅ Xcode Projects: $generated_count"
    if [ "$failed_count" -gt 0 ]; then
        echo "  ❌ Failed: $failed_count"
    fi
    echo
    print_info "All projects saved to: $OUTPUT_DIR"
    echo
    print_info "Opening output directory..."
    open "$OUTPUT_DIR"
}

main "$@"
