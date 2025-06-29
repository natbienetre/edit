#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"

echo "Starting containers..."

"${CONTAINER_CLI}-compose" \
    --project-name "$project_name" \
    up \
        --build \
        --pull \
        --quiet-pull \
        --force-recreate \
        --abort-on-container-failure \
        --always-recreate-deps \
        `# --remove-orphans` \
        sauvegarde
