#!/usr/bin/env bash

set -euo pipefail

project_name="${1:-natbienetre}"
CONTAINER_CLI="${CONTAINER_CLI:-podman}"

echo "Creating certificates..."

TMPDIR="$(mktemp -d)"

export CAROOT="$TMPDIR/ca"

mkdir -p "$CAROOT"

mkcert -cert-file "$TMPDIR/cert.pem" -key-file "$TMPDIR/key.pem" "${2:-edit.natbienetre.fr}"

echo "Creating secrets..."

"${CONTAINER_CLI}" secret create --replace "external_${project_name}_wordpress_certificate" "$TMPDIR/cert.pem"
"${CONTAINER_CLI}" secret create --replace "external_${project_name}_wordpress_key" "$TMPDIR/key.pem"
"${CONTAINER_CLI}" secret create --replace "external_${project_name}_wordpress_ca" "$TMPDIR/ca/rootCA.pem"

rm -rf "$TMPDIR"
