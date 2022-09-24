#!/bin/bash

##------------------Section 1-------------------------------------
## build, run and save image

# build image with tag

docker build -t my-website:0.0.1 .

# list the images

docker images

# start a container in docker using the image

docker run --rm --name my-website -d -p 8080:80 my-website:0.0.1

# validate the container is active by accessing the application

curl localhost:8080

# stop the container

docker stop my-website

# save the image to an external archive file

docker save -o /home/cloud_user/my-website/my-website_0.0.1.tar my-website:0.0.1


##------------------Section 1 End---------------------------------
