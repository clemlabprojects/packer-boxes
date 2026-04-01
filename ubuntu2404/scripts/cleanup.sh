#!/bin/bash -eux

export DEBIAN_FRONTEND=noninteractive

# Uninstall Ansible.
apt-get remove -y --purge ansible-core

# Apt cleanup.
apt-get autoremove -y
apt-get clean
apt-get update

# Remove cloud-init state from the autoinstall seed.
if command -v cloud-init >/dev/null 2>&1; then
  cloud-init clean --logs --seed
fi

#  Blank netplan machine-id (DUID) so machines get unique ID generated on boot.
truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
