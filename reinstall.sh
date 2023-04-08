#!/bin/bash

VPN_DIR="./vpn"

rm -rf "$VPN_DIR" || true

if [ ! $# -eq 5 ]; then
  echo 'INVALID PARAMETERS'
  exit 1
fi

curl -s "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/install.sh" | bash -s $1 $2 $3 $4 $5
