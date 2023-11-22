#!/bin/bash

# Requires the zip command
# zip usage: zip -r {filename.zip} {foldername}
# Script usage: bash scripts/pack.sh {foldername}

set -e

# Check the script is being run from the root of the project
if [ ! -f "./scripts/pack.sh" ]; then
    echo "Please run this script from the root of the project"
    echo "Example: bash scripts/pack.sh"
    exit 1
fi

# ====
# Create dist folder
# ====
create_dist_folder() {
    if [ -d "./dist" ]; then
        echo "Removing old dist folder"
        rm -r ./dist
    fi

    echo "Creating dist folder"
    mkdir -p ./dist
}

# Pack archive
# ====
pack() {
    echo "Packing archive"
    zip -r ./dist/"${zip_name}" ./src README.md VERSION
}


# ====
# Main function
# ====
main() {
    pwd
    version=$(cat ./VERSION)
    zip_name="fh2_reshade_presets_$version.zip"

    create_dist_folder
    pack

    echo "Complete! Results written to dist/${zip_name}"
}

main "@"
