#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"
PODMAN_COMPOSE_PROVIDER="${PODMAN_COMPOSE_PROVIDER:-${CONTAINER_CLI}-compose}"

"${PODMAN_COMPOSE_PROVIDER}" \
    --project-name "$project_name" \
    down \
        --rmi all \
        --remove-orphans
