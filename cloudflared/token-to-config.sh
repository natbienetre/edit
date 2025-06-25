#!/usr/bin/env bash

set -euo pipefail

# Generate the config
echo -n "$1" | base64 -d | jq '{
    "AccountTag": .a,
    "TunnelSecret": .s,
    "TunnelID": .t,
}'
