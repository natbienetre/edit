#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"
PODMAN_COMPOSE_PROVIDER="${PODMAN_COMPOSE_PROVIDER:-${CONTAINER_CLI}-compose}"

echo "Starting containers..."

"${PODMAN_COMPOSE_PROVIDER}" \
    --project-name "$project_name" \
    up \
        --build \
        --pull \
        --quiet-pull \
        --force-recreate \
        `# --abort-on-container-failure` \
        `# --remove-orphans` \
        sauvegarde
