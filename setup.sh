#!/bin/bash

# run linux+ansible container:
#   - mount ssh shared folder to store ssh keys in (outside of the image)
#   - mount ansible working directory 
#   - override CMD with bash so that the container keeps running
docker run -v `pwd`/ssh/:/ssh -v `pwd`/ansible:/ansible -w /ansible -dit --name ansible williamyeh/ansible:ubuntu18.04 /bin/bash

# install docker collection
# https://galaxy.ansible.com/darkwizard242/docker
docker exec -it ansible ansible-galaxy install darkwizard242.docker

# install dockercompose collection
# https://galaxy.ansible.com/darkwizard242/dockercompose
docker exec -it ansible ansible-galaxy install darkwizard242.dockercompose
