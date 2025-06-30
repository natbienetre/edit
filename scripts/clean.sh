#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"

"${CONTAINER_CLI}-compose" --project-name "$project_name" down --rmi all --remove-orphans
