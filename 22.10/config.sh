#!/bin/bash

# Script to clone, configure, build and install OpenSSH

# Clone the OpenSSH portable repository
git clone https://github.com/openssh/openssh-portable.git
cd openssh-portable

# Copy the configuration files
cp ../sshd_config ./
cp ../version.h ./
echo " "
echo "Files copied."

# Run autoreconf and configure scripts
autoreconf
./configure
make
make install
/usr/local/sbin/sshd

# Copy the sshd_config to the required locations
cp ./sshd_config /etc/ssh/
cp ./sshd_config /usr/local/etc/

echo " "
echo "OpenSSH setup and configuration complete."