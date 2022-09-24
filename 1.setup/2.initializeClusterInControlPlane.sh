#!/bin/bash

##------------------Section 1-------------------------------------
## initialize cluster on control plane

# setup network cidr for networking plugin

sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.24.0


# generate kubeconfig 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# check if able to access cluster 

kubectl get nodes

# apply the networking plugin

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

##------------------Section 1 End---------------------------------
##------------------Section 2-------------------------------------
## join the worker nodes to the control plane

# get the join command with all the tokens needed

kubeadm token create --print-join-command

# execute the output of the previous command as sudo on the worker nodes so that they can join the cluster

# check the nodes on the cluster after worker nodes joined successfully
kubectl get pods

##------------------Section 2 End---------------------------------
