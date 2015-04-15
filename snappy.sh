date --set="Tue Feb 24 12:28:32 CST 2015"
echo "nameserver 8.8.8.8" > /etc/resolv.conf
snappy update-versions
snappy update
snappy install apt-get
