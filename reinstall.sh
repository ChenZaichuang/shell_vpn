#!/bin/bash

VPN_DIR="./vpn"

rm -rf "$VPN_DIR" || true

if [ ! $# -eq 5 ]; then
  echo 'INVALID PARAMETERS'
  exit 1
fi

curl -s "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/install.sh" \
| VPN_PASSWORD="${VPN_PASSWORD}" \
| NODE_NAME="${NODE_NAME}" \
| SINGLE_PORT="${SINGLE_PORT}" \
| GROUP_PORT="${GROUP_PORT}" \
| NODE_GROUP="${NODE_GROUP}" \
| SSH_PORT="${SSH_PORT}" \
bash
