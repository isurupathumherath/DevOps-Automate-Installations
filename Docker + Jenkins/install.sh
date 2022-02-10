#!/bin/bash

# this script is only tested on Ubuntu

# NOTE - If you want to change to jenkins expose port change the 8080 port to <YOUR-PORT>
# NOTE - Replace current username with isurupathum in the above script

# install Docker
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

# Install Jenkins
sudo docker build -t jenkins-docker .
sudo docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:var/run/docker.sock --name jenkins -d jenkins

# show endpoint
echo
echo 'Docker - Jenkins installed - script by Isuru Pathum Herath : https://github.com/isurupathumherath'
echo