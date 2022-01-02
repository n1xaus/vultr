#!/bin/bash

# nano /etc/apt/sources.list

# Editing Source List
echo "deb http://http.us.debian.org/debian/ jessie main" > /etc/apt/sources.list
echo "deb-src http://http.us.debian.org/debian/ jessie main" >> /etc/apt/sources.list
echo "deb http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list
echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list

# Upgrade System
apt update; apt upgrade -y --fix-missing

# Install Modules
apt install apache2 -y; apt install mysql-server -y

wget https://www.dotdeb.org/dotdeb.gpg --no-check-certificate
apt-key add dotdeb.gpg

apt-get update
apt-get install -y mysql-server apache2 libapache2-mod-php7.0 php7.0-cli php7.0-apcu php7.0-mcrypt php7.0-intl php7.0-mysql php7.0-curl php7.0-gd php7.0-soap php7.0-xml php7.0-zip

service apache2 restart
a2enmod rewrite

# Create Dummy pages
cd /var/www/html
echo '<!DOCTYPE html><html><head><title>:P</title><meta name="viewport" content="width=device-width, initial-scale=1.0"><style>h1{font-family: Times, serif;color: #2f2d2d;text-align: default;}p{font-family: Times, serif;font-size: 14px;text-align: default;color: #2f2d2d;}</style></head><body><h1>Hello,</h1><p>Check this out! <a href="https://n1xaus.substack.com/p/350-per-month-debian-system">This tutorial</a> will show you how I deployed this server. <br/><br/>- n1xaus</p></body></html>' > index.html
echo "<?php phpinfo(); ?>" > nix.php
cd ~

apt upgrade -y --fix-missing
apt install ufw -y; ufw enable; ufw allow in "WWW"; ufw allow in "SSH"

echo "What do you want the username to be?"
read newuser
adduser $newuser

apt-get autoremove -y

echo "YOU SHOULD REBOOT THE MACHINE NOW AND EVERYTHING SHOULD BE ALL GOOD TO START BUILDING UP."

