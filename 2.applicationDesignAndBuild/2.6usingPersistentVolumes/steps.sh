#!/bin/bash

##------------------Section 1-------------------------------------
## create and verify a hostPath Persistent Volume

# create a folder named hostPath on each workerNode under /etc

sudo mkdir /etc/hostPath

# create a hostPath Persistent Volume configuration on the control plane

vi hostpath-pv.yml

# apply the configurations and create the PV

kubectl apply -f hostpath-pv.yml

# check the PV status, it should in status AVAILABLE

kubectl get pv

##------------------Section 1 End---------------------------------
##------------------Section 2-------------------------------------
## create and verify a hostPath Persistent Volume Claim

# create a hostPath Persistent Volume Claim configuration on the control plane

vi hostpath-pvc.yml

# apply the configurations and create the PV

kubectl apply -f hostpath-pvc.yml

# check the PVC status, it should in status BOUND

kubectl get pvc

##------------------Section 2 End---------------------------------
##------------------Section 3-------------------------------------
## test a hostPath Persistent Volume in a container

# create a pod yaml using the persistent volume created above in control plane

vi pv-pod-test.yml

# apply the configurations and create the pod

kubectl apply -f pv-pod-test.yml

# check the Pod status, it should in status Completed

kubectl get pod pv-pod-test

# check the Pod logs, it should say which data file it read the data from, worker1/worker2

kubectl logs pv-pod-test

##------------------Section 3 End---------------------------------
