#####################################################################
# cd /opt/rt-n56u/trunk 执行在这个目录下
#
# 修改默认参数（不同设备拷贝到相应 *.sh)          by: TurBoTse
#####################################################################
user_name="asus"                                   # 用户名
user_password="mayi5147"                               # 登录密码
lan_ip="192.168.101.10"                          # LAN 地址
dhcp_beg="192.168.101.2"                        # LAN DHCP开始地址
dhcp_end="192.168.101.254"                       # LAN DHCP结束地址
wlan_2g_ssid="lt0418_2G"                              # 2G 无线名称
wlan_5g_ssid="lt0418"                           # 5G 无线名称
wlan_2g_psk="mayi5147"                            # 2G WIFI密码最少8位 空白为不设置
wlan_5g_psk="mayi5147"                            # 5G WIFI密码最少8位 空白为不设置
default_path="./user/shared"                        # 默认配置路径
config="./configs/templates/RT-AC1200GU.config"     # 默认配置文件
default_file="./user/shared/defaults.h"             # 默认配置文件
version_time=$(date +%Y%m%d)                        # 更新时版本号时间: 20210101

echo "修改用户名"
sed -i 's/SYS_USER_ROOT		"admin"/SYS_USER_ROOT		"'$user_name'"/g' $default_file

echo "修改登陆密码"
sed -i 's/DEF_ROOT_PASSWORD	"admin"/DEF_ROOT_PASSWORD	"'$user_password'"/g' $default_file

echo "修改 LAN IP 地址"
sed -i "s/192.168.101.1/$lan_ip/g" $default_path/defaults.h

echo "修改 LAN DHCP 地址"
sed -i "s/192.168.101.2/$dhcp_beg/g" $default_path/defaults.h
sed -i "s/192.168.101.254/$dhcp_end/g" $default_path/defaults.h

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

#echo "设置为中继模式"
#echo "#define BOARD_ROLE_REPEATER	1" >> ./configs/boards/RT-AC1200GU/board.h
