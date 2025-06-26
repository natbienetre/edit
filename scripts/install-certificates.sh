#!/usr/bin/env bash

set -euo pipefail

echo "Creating certificates..."

export CAROOT="./wordpress/ca"

mkcert -cert-file "./wordpress/cert.pem" -key-file "./wordpress/key.pem" "${1:-edit.natbienetre.fr}"

echo "Creating secrets..."

project_name="natbienetre"

podman secret create --replace "external_${project_name}_wordpress_certificate" "./wordpress/cert.pem"
podman secret create --replace "external_${project_name}_wordpress_key" "./wordpress/key.pem"
podman secret create --replace "external_${project_name}_wordpress_ca" "./wordpress/ca/rootCA.pem"
