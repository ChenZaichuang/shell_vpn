#!/bin/bash

if [ $# -eq 2 ]; then
  PROXY_NODE_INDEX=$1
  VPN_PASSWORD=$2
fi


VPN_DIR="./vpn"

# 判断目录是否存在
if [ ! -d "$VPN_DIR" ]; then
  # 下载zip文件
  curl -O "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/vpn.zip"
  # 提示用户输入密码并解压缩zip文件

  if [ -z ${VPN_PASSWORD} ]; then
    echo "Enter VPN password: "
    read -s VPN_PASSWORD </dev/tty
    echo
  fi

  unzip -q -P "$VPN_PASSWORD" vpn.zip -d .

  if [ ! $? -eq 0 ]; then
    # 解压缩失败，提示用户重新输入密码
    echo "Incorrect password."
    echo ''
    rm -rf ${PWD}/vpn
    exit 1
  fi

  if [ -z ${PROXY_NODE_INDEX} ]; then
    echo "Enter proxy node index: "
    read -s PROXY_NODE_INDEX </dev/tty
    echo
  fi

  sed -i "s/{{ PROXY_NODE_INDEX }}/$PROXY_NODE_INDEX/g" vpn/frp/frpc.ini

  # 修改文件权限
  chmod +x vpn/start.sh
fi

# 执行VPN脚本
bash vpn/start.sh
