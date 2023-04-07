#!/bin/bash

VPN_DIR="./vpn"

# 判断目录是否存在
if [ ! -d "$VPN_DIR" ]; then
  # 下载zip文件
  curl -O "https://raw.githubusercontent.com/ChenZaichuang/shell_vpn/main/vpn.zip"
  # 提示用户输入密码并解压缩zip文件
  while true; do
    echo "Enter VPN password: "
    read VPN_PASSWORD </dev/tty
    echo
    unzip -P "$VPN_PASSWORD" vpn.zip -d .
    if [ $? -eq 0 ]; then
      # 解压缩成功
      break
    else
      # 解压缩失败，提示用户重新输入密码
      echo "Incorrect password. Please try again."
    fi
  done
  # 修改文件权限
  chmod +x vpn/start.sh
fi

# 执行VPN脚本
bash vpn/start.sh
