#!/bin/bash

##------------------Section 1-------------------------------------
## create and test an ambassador container setup

# create a nginx server and a service configuration as a setup

vi ambassador-test-setup.yml

# apply the configurations and start the pod

kubectl apply -f ambassador-test-setup.yml

# create a ambassador busybox container curling on localhost:8080 with a haproxy ambassador container with it routing traffic localhost:8081 to the previously created nginx server through the service

vi ambassador-test.yml

# apply the configurations and start the pod

kubectl apply -f ambassador-test.yml

# check the logs of the main container in the ambassador pod to verify that it is able to reach the nginx server

kubectl logs ambassador-test -c main

##------------------Section 1 End---------------------------------

