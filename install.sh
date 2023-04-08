#!/bin/bash

if [ $# -eq 5 ]; then
  VPN_PASSWORD=$1
  NODE_NAME=$2
  SINGLE_PORT=$3
  GROUP_PORT=$4
  NODE_GROUP=$5
else
  echo 'INVALID PARAMETERS'
fi

su_prefix='sudo '
if [ $(whoami) == "root" ]; then
  su_prefix=''
fi

${su_prefix}apt update -y && ${su_prefix}apt install -y curl unzip screen

VPN_DIR="./vpn"

# 判断目录是否存在
if [ ! -d "$VPN_DIR" ]; then
  # 下载zip文件
  curl -O "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/vpn.zip"
  curl -O "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/start.sh"
  curl -O "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/uninstall.sh"
  # 提示用户输入密码并解压缩zip文件

  unzip -q -P "$VPN_PASSWORD" vpn.zip -d .

  if [ ! $? -eq 0 ]; then
    # 解压缩失败，提示用户重新输入密码
    echo "Incorrect password."
    rm -rf ${PWD}/vpn
    exit 1
  fi

  sed -i "s/{{ NODE_NAME }}/${NODE_NAME}/g" vpn/frp/frpc.ini
  sed -i "s/{{ SINGLE_PORT }}/${SINGLE_PORT}/g" vpn/frp/frpc.ini
  sed -i "s/{{ GROUP_PORT }}/${GROUP_PORT}/g" vpn/frp/frpc.ini
  sed -i "s/{{ NODE_GROUP }}/${NODE_GROUP}/g" vpn/frp/frpc.ini

  # 修改文件权限
  chmod +x ${PWD}/vpn/start.sh ${PWD}/vpn/frp/frpc ${PWD}/vpn/v2ray/v2ray ${PWD}/start.sh ${PWD}/vpn/stop.sh ${PWD}/vpn/uninstall.sh
fi

# 执行VPN脚本
bash vpn/start.sh
