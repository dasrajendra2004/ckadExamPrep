#!/bin/bash

##------------------Section 1-------------------------------------
## create job

# create a my-job.yml file

# create a job using the yaml file in kubernetes

kubectl apply -f my-job.yml

# verify the job is created successfully

kubectl get jobs

# verify that the job created a pod

kubectl get pods

# verify that the task is completed successfully by checking logs from the pod

kubectl logs <my-job-pod-id>

##------------------Section 1 End---------------------------------
##------------------Section 2-------------------------------------
## create cron job

# create a my-cronjob.yml file

# create a cronjob using the yaml file in kubernetes

kubectl apply -f my-cronjob.yml

# verify the cron job is created successfully

kubectl get cronjob

# verify the jobs are automatically added by kubernetes based on the cron schedule

kubectl get jobs

# verify that the jobs are created pod

kubectl get pods

# verify that the task is completed successfully by checking logs from the pod

kubectl logs <my-cronjob-pod-id>

##------------------Section 2 End---------------------------------

