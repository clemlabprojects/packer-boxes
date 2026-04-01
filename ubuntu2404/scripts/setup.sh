#!/bin/bash -eux

# Add vagrant user to sudoers.
install -d -m 0755 /etc/sudoers.d
echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' > /etc/apt/apt.conf.d/10periodic
