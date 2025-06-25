#!/usr/bin/env bash

set -euo pipefail

# Generate the config
jq '{
    "a": .AccountTag,
    "s": .TunnelSecret,
    "t": .TunnelID,
}' "$1" | base64 -w 0
