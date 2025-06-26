#!/usr/bin/env bash

set -euo pipefail

project_name=natbienetre

echo "Deleting containers..."

podman-compose --project-name "$project_name" down --rmi all --remove-orphans

echo "Deleting secrets..."

podman secret rm "external_${project_name}_wordpress_certificate"
podman secret rm "external_${project_name}_wordpress_key"
podman secret rm "external_${project_name}_wordpress_ca"
