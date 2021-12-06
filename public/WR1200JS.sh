#####################################################################
# cd /opt/rt-n56u/trunk 执行在这个目录下
#
# 修改默认参数（不同设备拷贝到相应 *.sh)          by: TurBoTse
#####################################################################
lan_ip="192.168.101"                          # LAN 地址 别写后面的 .1
wlan_2g_ssid="lt0418"                              # 2G 无线名称
wlan_5g_ssid="lt0418_5G"                           # 5G 无线名称
wlan_2g_psk="mayi5147"                            # 2G WIFI密码最少8位 空白为不设置
wlan_5g_psk="mayi5147"                            # 5G WIFI密码最少8位 空白为不设置
default_path="./user/shared"                        # 默认配置路径
config="./configs/templates/WR1200JS.config"        # 默认配置文件
default_file="./user/shared/defaults.h"             # 默认配置文件
version_time=$(date +%Y%m%d)                        # 更新时版本号时间: 20210101

echo "修改 LAN IP 地址"
sed -i "s/192.168.2/$lan_ip/g" $default_path/defaults.h

echo "修改 2G 无线名称"
sed -i 's/DEF_WLAN_2G_SSID	BOARD_PID "_%s"/DEF_WLAN_2G_SSID	"'$wlan_2g_ssid'"/g' $default_file

echo "修改 5G 无线名称"
sed -i 's/DEF_WLAN_5G_SSID	BOARD_PID "_5G_%s"/DEF_WLAN_5G_SSID	"'$wlan_5g_ssid'"/g' $default_file

echo "修改 2.4GHz WIFI 密码"
sed -i 's/DEF_WLAN_2G_PSK		"1234567890"/DEF_WLAN_2G_PSK		"'$wlan_2g_psk'"/g' $default_file

echo "修改 5GHz WIFI 密码"
sed -i 's/DEF_WLAN_5G_PSK		"1234567890"/DEF_WLAN_5G_PSK		"'$wlan_5g_psk'"/g' $default_file

echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=.*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc
