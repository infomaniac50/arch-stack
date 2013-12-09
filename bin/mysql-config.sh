#!/bin/bash

echo "I am going to setup MySQL for you."
echo "The script may pause for a moment while it is running."
echo "This is normal and no keys need to be pressed."
echo "Press [ENTER] to continue..."
read ANSWER

/usr/bin/expect << SECUREMYSQL

spawn mysql_secure_installation
set password [lindex $argv 0]

expect "Enter current password for root (enter for none):"   
send "\r"
expect "Change the root password?"                           
send "Y\r"
expect "New password:"
send "$password\r"
expect "Re-enter new password:"
send "$password\r"
expect "Remove anonymous users?"                             
send "Y\r"
expect "Disallow root login remotely?"                      
send "Y\r"
expect "Remove test database and access to it?"              
send "Y\r"
expect "Reload privilege tables now?"                        
send "Y\r"

SECUREMYSQL

echo ""