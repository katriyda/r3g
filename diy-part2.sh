#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#修改默认主机名
sed -i "s/hostname='.*'/hostname='XiaoMi'/g" ./package/base-files/files/bin/config_generate

# argon
# 删除自定义源默认的 argon 主题
find ./ -name luci-theme-argon | xargs rm -rf;
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# 替换默认主题为 luci-theme-argon
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
