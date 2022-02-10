#!/bin/bash

# this script is only tested on Ubuntu

# NOTE - If you want to change to jenkins expose port change the 8080 port to <YOUR-PORT>
# NOTE - Replace current username with isurupathum in the above script

# install Docker
sudo apt-get update
sudo apt-get install -y yum-utils
sudo yum install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker
usermod -aG docker isurupathum  # NOTE - Change isurupathum to the name of your Linux Account Name


# Install Jenkins
sudo docker pull jenkins
sudo docker build -t jenkins-docker .
sudo docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:var/run/docker.sock --name jenkins -d jenkins

# show endpoint
echo
echo 'Docker - Jenkins installed - script by Isuru Pathum Herath : https://github.com/isurupathumherath'
echo