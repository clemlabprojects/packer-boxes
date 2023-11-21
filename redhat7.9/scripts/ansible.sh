#!/bin/bash -eux

# Install Python.
subscription-manager register --username lucasbak --password hynsah-hepQek-hyrpo0 --auto-attach
echo "yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# echo 'subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"'
# subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
echo 'yum update -y'
yum update -y
echo 'yum install -y ansible'
yum install -y ansible
ansible --version