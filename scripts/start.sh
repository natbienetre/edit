#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"

echo "Checking secrets..."

if ! "${CONTAINER_CLI}" secret exists "external_${project_name}_cloudflare_token"; then
    echo "Cloudflare token not found. Please create a token with the following command:" >&2
    echo "  $PWD/cloudflared/create-secret.sh" >&2
    echo "and try again." >&2
else
    echo "Cloudflare token found"
fi

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
        wordpress cloudflare-tunnel
