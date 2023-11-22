#!/bin/bash

# This script is used to test the project.

set -e


# Check the script is being run from the root of the project
if [ ! -f "./scripts/test.sh" ]; then
    echo "Please run this script from the root of the project"
    echo "Example: bash $0"
    exit 1
fi

# ====
# Main function
# ====
main() {
    act -e .github/workflows/tag.json --artifact-server-path dist "$@"
}

main "$@"
