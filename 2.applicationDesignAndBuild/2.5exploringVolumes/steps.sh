#!/bin/bash

##------------------Section 1-------------------------------------
## create and test a hostPath volumeType

# create a folder named hostPath on each workerNode under /etc

sudo mkdir /etc/hostPath

# create a file with some data in the hostPath folder under each workerNode

echo "This is worker 1!" | sudo tee /etc/hostPath/data.txt
echo "This is worker 2!" | sudo tee /etc/hostPath/data.txt

# create a hostPath Volume pod configuration on the control plane

vi hostpath-volume-test.yml

# apply the configurations and start the pod

kubectl apply -f hostpath-volume-test.yml

# check the pod status, it should have executed and exited successfully

kubectl get pods hostpath-volume-test

# check the pod logs to see which node it was created on

kubectl logs hostpath-volume-test
#This is worker 2!

##------------------Section 1 End---------------------------------

##------------------Section 2-------------------------------------
## create and test a emptyDir volumeType

# create a emptyDir Volume pod configuration on the control plane

vi emptydir-volume-test.yml

# apply the configurations and start the pod

kubectl apply -f emptydir-volume-test.yml

# check the pod status, it should have executed and exited successfully

kubectl get pods emptydir-volume-test

# check the pod logs to see what was written to the logs

kubectl logs emptydir-volume-test
#Writing to the empty dir...
##------------------Section 2 End---------------------------------
