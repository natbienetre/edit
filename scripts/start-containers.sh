#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"

# echo "Creating containers..."

# podman-compose --project-name "$project_name" up --build --pull --force-recreate --always-recreate-deps --remove-orphans --no-start

echo "Starting containers..."

podman-compose --project-name "$project_name" up --build --pull --force-recreate --always-recreate-deps --remove-orphans wordpress cloudflare-tunnel
