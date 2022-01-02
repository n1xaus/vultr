#!/bin/bash
# Setup Ubuntu with Apache and secure SSH login

echo "Installing Stuff"
apt install apache2
apt install net-tools

echo "Change SSH port to something else"
echo "WARNING: Choose an unused port!"
echo "What do you want the port to be? Just type numbers."
read newport
echo "Port $newport" >> /etc/ssh/sshd_config

echo "Changing Firewall"
ufw deny 22
ufw allow $newport
ufw allow in "Apache"
ufw status

echo "Restarting SSH"
systemctl restart sshd
netstat -tulpn | grep ssh

echo "Cleaning index.html"
cd /var/www/html
echo "<!DOCTYPE html><html><head><title>...</title></head><body><h1>Good Morning!</h1></body></html>" > index.html

echo "We're done here... Visit the server IP and it should say Good Morning"
