#!/bin/bash

# this script is only tested on CentOS 7

# install docker
sudo yum update
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum update
sudo yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker
usermod -aG docker isurupathum

# run jenkins
# NOTE - If you want to change to jenkins expose port change the 8080 port to <YOUR-PORT>

mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/
docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins/jenkins:lts

# show endpoint
echo 'Jenkins installed - script by Isuru Pathum Herath : https://github.com/isurupathumherath'
echo 'You are able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'