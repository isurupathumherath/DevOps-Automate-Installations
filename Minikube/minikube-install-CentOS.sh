#!/bin/bash

# this script is only tested on CentOS 7

#Install Minikube
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# sudo install minikube-linux-amd64 /usr/local/bin/minikube

# echo 'Minikube installed - script by Isuru Pathum Herath : https://github.com/isurupathumherath'
# echo 'Use this command to start minikube - minikube start'

#Start Minikube
echo -n 'Do you want to start Minikube Now? (Y/N)'
read VAR

while [[ $VAR != 'Y' ]] || [[ $VAR != 'y' ]] || [[ $VAR = 'N' ]] || [[ $VAR = 'n' ]]
do
    echo -n 'Do you want to start Minikube Now? (Y/N)'
    read VAR
done
    
if [[ $VAR = 'Y' ]] || [[ $VAR = 'y' ]]
then
    minikube start
else [[ $VAR = 'N' ]] || [[ $VAR = 'n' ]]
    echo 'Use minikube start command to run minikube manually'
fi


# #Add minikube kubectl to alias
# echo -n 'Do you want to add minikube kubectl to run easiar with only kubectl command? (Y/N)'
# read VARR

# while [[ $VARR != 'Y' ]] || [[ $VARR != 'y' ]] || [[ $VARR = 'N' ]] || [[ $VARR = 'n' ]]
# do
#     if [[ $VARR = 'Y' ]] || [[ $VARR = 'y' ]]
#     then
#         alias kubectl="minikube kubectl --"
#         echo 'You can run minikube kubectl using only - kubectl ...'
#     elif [[ $VARR = 'N' ]] || [[ $VARR = 'n' ]]
#     then
#         echo 'You have to run kubectl using this command - minikube kubectl ...'
#     else 
#         echo -n 'Do you want to add minikube kubectl to run easiar with only kubectl command? (Y/N)'
#         read VARR
#     fi
# done
