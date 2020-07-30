#!/bin/bash

sudo setenforce 0
sudo cp config /etc/selinux/
sudo dnf module enable php:remi-7.4 -y
sudo dnf install php php-cli php-common php-json php-xml php-mbstring php-mysqli php-zip php-intl -y
sudo dnf install -y autoconf make automake libtool pcre-devel  zlib-devel bzip2-devel git
cd ~
sudo git clone https://git.lighttpd.net/lighttpd/lighttpd1.4.git
cd lighttpd1.4/
sudo ./autogen.sh && ./configure --disable-dependency-tracking
sudo ./configure
sudo make 
sudo make install
cd ~/openstack-pihole-automated-install
sudo cp lighttpd.service /etc/systemd/system/lighttpd.service
sudo systemctl daemon-reload
sudo systemctl enable lighttpd
sudo mkdir -p /srv/www
sudo mkdir -p /etc/lighttpd/conf.d
sudo mkdir /etc/lighttpd/vhosts.d
cd ~/lighttpd1.4/
sudo cp doc/config/*.conf /etc/lighttpd/
sudo cp doc/config/conf.d/*.conf /etc/lighttpd/conf.d
sudo groupadd lighttpd
sudo useradd -r -M -g lighttpd lighttpd
sudo mkdir /var/log/lighttpd
sudo chown lighttpd: /var/log/lighttpd
sudo systemctl start lighttpd
sudo systemctl status lighttpd
cd ~
sudo git clone https://github.com/pi-hole/pi-hole.git
sudo cd ~/pi-hole/automated\ install/
sudo sed -i "s/lighttpd\slighttpd-fastcgi//" basic-install.sh
sudo chmod +x basic-install.sh
sudo ./basic-install.sh

