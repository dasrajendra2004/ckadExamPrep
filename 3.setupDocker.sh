#!/bin/bash

##------------------Section 1-------------------------------------
## setup docker

# create a group docker to give users the permissions to use docker

sudo groupadd docker

# install set of required packages

sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# install docker package repository

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# add the docker package repository

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docket.list > /dev/null

# install the docker packages

sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli

# check installation is successful

sudo docker version

# add the user to the group

sudo usermod -aG docker cloud_user


##------------------Section 1 End---------------------------------


