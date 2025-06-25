#!/usr/bin/env bash

set -euo pipefail

CLOUDFLARE_ACCOUNT_ID=553da3ac29b7069f507de4b3d5052050

cat <<EOF
This script will create a secret for the cloudflare tunnel token.

You can get the token from https://one.dash.cloudflare.com/$CLOUDFLARE_ACCOUNT_ID/networks/tunnels/

EOF

SECRET_NAME=external_natbienetre_cloudflare_token

if podman secret exists "$SECRET_NAME"; then
    echo "Secret $SECRET_NAME already exists. Please remove it before running this script again."
    exit 1
else
    read -rp "Enter your Cloudflare token: " TOKEN

    TUNNEL_ID=$(echo "$TOKEN" | base64 --decode | jq -r '.t')

    test -n "$TUNNEL_ID" || {
        echo "Failed to extract tunnel ID from token. Please check the token and try again." >&2
        exit 1
    }

    echo -n "Creating secret $SECRET_NAME for https://one.dash.cloudflare.com/$CLOUDFLARE_ACCOUNT_ID/networks/tunnels/cfd_tunnel/$TUNNEL_ID/edit ... "
    echo -n "$TOKEN" | podman secret create "$SECRET_NAME" - > /dev/null
    echo "done"
fi
