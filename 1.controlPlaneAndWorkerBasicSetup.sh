#!/bin/bash

##------------------Section 1-------------------------------------
## required containerd configurations

# enable some kernel modules needed by containerd whenver it starts

cat << EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

# enables the above modules immediately

sudo modprobe overlay
sudo modprobe br_netfilter

##------------------Section 1 End---------------------------------
##------------------Section 2-------------------------------------
## required system level networking configurations for kubernetes


# set some system params needed by kubernetes

cat << EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# apply above immediately

sudo sysctl --system

##------------------Section 2 End---------------------------------
##------------------Section 3-------------------------------------
## install and configure containerd

# install containerd package

sudo apt-get update && sudo apt-get install -y containerd

# create directory for containerd configuration

sudo mkdir -p /etc/containerd

# generate the configuration files for containerd

sudo containerd config default | sudo tee /etc/containerd/config.toml

# restart containerd to use above configuration immediately

sudo systemctl restart containerd

##------------------Section 3 End---------------------------------
##------------------Section 4-------------------------------------

## setup pre-requisites, install and configure kubernetes

# disable swap

sudo swapoff -a 

# install pre-requisite packages required for installation process

sudo apt-get update && sudo apt-get install -y apt-transport-https curl

# setup package repository for kubernetes packages

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# configure the above created package repository

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# update package listing from the repository

sudo apt-get update

# install kubernetes packages

sudo apt-get install -y kubelet=1.24.0-00 kubeadm=1.24.0-00 kubectl=1.24.0-00

# disable auto-upgrade of the kubernetes packages by marking them as hold

sudo apt-mark hold kubelet kubeadm kubectl


##------------------Section 4 End---------------------------------
