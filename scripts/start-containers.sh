#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"

# echo "Creating containers..."

# podman-compose --project-name "$project_name" up --build --pull --force-recreate --always-recreate-deps --remove-orphans --no-start

echo "Starting containers..."

"${CONTAINER_CLI}-compose" --project-name "$project_name" up --build --pull --quiet-pull --force-recreate --abort-on-container-failure --always-recreate-deps --remove-orphans wordpress cloudflare-tunnel
