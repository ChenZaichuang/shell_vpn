#!/bin/bash

VPN_DIR="./vpn"

rm -rf "$VPN_DIR" || true

curl -s "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/install.sh" | bash -
