#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"

"$CONTAINER_CLI" secret rm "external_${project_name}_wordpress_certificate"
"$CONTAINER_CLI" secret rm "external_${project_name}_wordpress_key"
"$CONTAINER_CLI" secret rm "external_${project_name}_wordpress_ca"
