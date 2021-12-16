#!/bin/bash

# create shared folder for ssh keys
mkdir -p ssh


# Build image
# docker build -t ansible:ubuntu18.04 .

# run linux+ansible container:
#   - mount ssh shared folder to store ssh keys in (outside of the image)
#   - mount ansible working directory 
#   - override CMD with bash so that the container keeps running
docker run -v `pwd`/ssh/:/ssh -v `pwd`/ansible:/ansible -w /ansible -dit --name ansible williamyeh/ansible:ubuntu18.04 /bin/bash


# generate ssh keys: save them to a shared folder instead of the image, that's why the command is not part of the image RUN
# https://stackoverflow.com/a/27504514/2969332
docker exec -it ansible ssh-keygen -q -t rsa -N '' -f /ssh/id_rsa


# set access rights needed by ssh
docker exec -it ansible chmod 600 /ssh/id_rsa
docker exec -it ansible chmod 600 /ssh/id_rsa.pub


# copy public ssh key to all managed hosts
for h in `awk '{print $1}' ansible/inventory.ini`
do
    echo "Copying keys to vagrant@$h..."
    docker exec -it ansible ssh-copy-id -i /ssh/id_rsa.pub vagrant@$h
done


# ping: this will send the private key to identify the controller host
docker exec -it ansible ansible -i inventory.ini all -m ping

