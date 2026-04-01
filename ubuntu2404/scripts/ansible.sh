#!/bin/bash -eux

export DEBIAN_FRONTEND=noninteractive

# Install Ansible from the Ubuntu archive.
apt-get update
apt-get -y upgrade
apt-get install -y ansible-core
