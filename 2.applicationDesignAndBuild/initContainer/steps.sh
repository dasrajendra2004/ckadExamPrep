#!/bin/bash

##------------------Section 1-------------------------------------
## create and test an init container setup

# create a nginx server which is dependendant on a init container busubox which is waiting for 60 secods

vi init-test.yml

# apply the configurations and start the pod

kubectl apply -f init-test.yml

# verify that the pod status is stuck in Init for 60 seconds

kubectl get pods

##------------------Section 1 End---------------------------------

