#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"

echo "Checking secrets..."

if ! podman secret exists "external_${project_name}_cloudflare_token"; then
    echo "Cloudflare token not found. Please create a token with the following command:" >&2
    echo "  $PWD/cloudflared/create-secret.sh" >&2
    echo "and try again." >&2
else
    echo "Cloudflare token found"
fi

# echo "Creating containers..."

# podman-compose --project-name "$project_name" up --build --pull --force-recreate --always-recreate-deps --remove-orphans --no-start

echo "Starting containers..."

podman-compose --project-name "$project_name" up --build --pull --force-recreate --always-recreate-deps --remove-orphans wordpress cloudflare-tunnel
