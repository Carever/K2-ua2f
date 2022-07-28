# Modify default IP
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# Modify default THEME
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# 修改ua2f的内核
target=$(grep "^CONFIG_TARGET" .config --max-count=1 | awk -F "=" '{print $1}' | awk -F "_" '{print $3}')
for configFile in $(ls target/linux/$target/config*)
do
    echo -e "\nCONFIG_NETFILTER_NETLINK_GLUE_CT=y" >> $configFile
done
