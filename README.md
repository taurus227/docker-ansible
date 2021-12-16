# docker-ansible

**Copied from https://github.com/TitusTech/docker-ansible**

## Setup
Run `./setup.sh` and anwer all questions:
1. enter `y`
1. enter `yes`
1. enter `vagrant` password

This will:
- Run a linux with ansible installed
- Generate ssh keys
- Copy the public key to managed host
- ping the host

### References:
- https://hub.docker.com/r/williamyeh/ansible/
  - https://github.com/William-Yeh/docker-ansible/tree/master/master-ubuntu18.04
  - https://www.slideshare.net/williamyeh/ansible-docker-65362893
- https://stackoverflow.com/a/27504514/2969332
- https://stackoverflow.com/a/44734246/2969332

## Run
Run `./run.sh`
- It will run the ansible playbook
