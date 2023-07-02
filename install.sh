#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Prompt for username
read -p "Enter the username: " username

# Create the user
useradd $username

# Prompt for password
read -s -p "Enter the password: " password

# Set the password for the user
echo "$password" | passwd --stdin $username

# Grant root privileges to the user
usermod -aG wheel $username

echo "User '$username' has been created with root privileges."
