#!/bin/bash
echo ""
echo "### Web Stack Installer for Arch Linux ###"

echo ""

password1="notequal"
password2="equal"
echo "Enter a root password for MySQL"
while [[ ! $password2 == $password1 ]]; do
read -s -p "Password: " password1
echo
read -s -p "Again: " password2
echo

if [[ ! $password2 == $password1 ]]; then
    echo "Passwords don't match try again."
fi

done

password=$password1

echo "Installing Nginx MySQL PHP Stack"

pacman -S nginx mariadb php-fpm --noconfirm

cp -R ${HOME}/conf/* /

systemctl enable mysqld
systemctl start mysqld

source mysql-config.sh
source nginx-config.sh

systemctl enable php-fpm
systemctl start php-fpm

systemctl enable nginx
systemctl start nginx