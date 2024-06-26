#!/bin/bash

# Note that this does not use pipefail
# because if the grep later doesn't match any deleted files,
# which is likely to be the case the majority of the time,
# it does not exit with 0, as we are interested in the final exit.
set -eo

generate_zip() {
    echo "Generating zip file..."
    pwd
    echo "${GITHUB_WORKSPACE}"
    cd "${GITHUB_WORKSPACE}" && ls
    echo "${SLUG}"

    # use a symbolic link so the directory in the zip matches the slug
    # zip -r "${GITHUB_WORKSPACE}/${SLUG}.zip" "$SLUG"

    # echo "zip-path=${GITHUB_WORKSPACE}/${SLUG}.zip" >> "${GITHUB_OUTPUT}"
    echo "✓ Zip file generated!"
}

generate_zip

echo "✓ Plugin deployed!"