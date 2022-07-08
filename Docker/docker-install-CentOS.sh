#!/bin/bash

# this script is only tested on CentOS 7

# install docker
sudo yum update
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum update
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker
usermod -aG docker opc

# NOTE - Replace current username with isurupathum in the above script

sudo systemctl start docker


# show endpoint
echo
echo 'Docker installed - script by Isuru Pathum Herath : https://github.com/isurupathumherath'
echo