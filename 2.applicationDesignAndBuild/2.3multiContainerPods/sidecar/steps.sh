#!/bin/bash

##------------------Section 1-------------------------------------
## create sidecar container

# create a sidecar-test.yml file

# create a container using the yaml file in kubernetes

kubectl apply -f sidecar-test.yml

# verify the pod is created successfully

kubectl get pobs

# check the logs of the sidecar container from the pod

kubectl logs sidecar-test -c sidecar

##------------------Section 1 End---------------------------------

