#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"

echo "Creating certificates..."

export CAROOT="./wordpress/ca"

mkcert -cert-file "./wordpress/cert.pem" -key-file "./wordpress/key.pem" "${2:-edit.natbienetre.fr}"

echo "Creating secrets..."

podman secret create --replace "external_${project_name}_wordpress_certificate" "./wordpress/cert.pem"
podman secret create --replace "external_${project_name}_wordpress_key" "./wordpress/key.pem"
podman secret create --replace "external_${project_name}_wordpress_ca" "./wordpress/ca/rootCA.pem"
