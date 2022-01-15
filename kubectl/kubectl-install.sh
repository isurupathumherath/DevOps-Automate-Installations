#!/bin/bash

# this script is only tested on CentOS 7

# Download the latest release
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Note:
# To download a specific version, replace the $(curl -L -s https://dl.k8s.io/release/stable.txt) portion of the command with the specific version.
# For example, to download version v1.23.0 on Linux, type:
# curl -LO https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl

# Validate the binary
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Test to ensure the version you installed is up-to-date
kubectl version --client

#Success Message
echo -e 'kubectl is ready to use!'
echo 'Good Luck!'
echo 'Author - Isuru Pathum Herath : https://github.com/isurupathumherath'
