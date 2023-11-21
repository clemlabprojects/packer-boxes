#!/bin/bash -eux

# Install Python.
subscription-manager register --username lucasbak --password hynsah-hepQek-hyrpo0 --auto-attach
yum -y install python3 python3-pip
alternatives --set python /usr/bin/python3

# Upgrade Pip.
python -m pip install -U pip

# Install Ansible.
pip3 install ansible
