#!/bin/bash

VPN_DIR="./vpn"

rm -rf "$VPN_DIR" || true

if [ $# -eq 2 ]; then
  curl -s "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/install.sh" | bash -s $1 $2
else
  curl -s "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/install.sh" | bash -
fi

