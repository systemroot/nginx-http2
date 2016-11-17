#!/bin/bash
# X Ubuntu 14.04.
if [ "`lsb_release -is`" == 'Ubuntu' ]; then
sudo apt-get purge --remove nginx
echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list.d/nginx.http2.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list.d/nginx.http2.list
wget -q -O- http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo apt-get update; apt-get upgrade -y
apt-get install nginx -y
service nginx stop; service apache2 stop
apt-get install build-essential libssl-dev openssl nano git wget curl -y
echo "Wrote Domain Name example.com For SSL CRT! (And Hit Enter)"
read domain
cd ~/
git clone https://github.com/letsencrypt/letsencrypt
cd ~/letsencrypt
./letsencrypt-auto --help
./letsencrypt-auto certonly --standalone -d $domain
sudo openssl dhparam -out /etc/letsencrypt/live/$domain/dhparam-2048.pem 2048
echo "**********************************************"
echo "**********************************************"
echo "**********************************************"
echo "CRT INTO /etc/letsencrypt/live/$domain/ DIR"
else 
   This Script is only for ubuntu 14.04. 
   For problems or different distro create a issue!
fi
