# docker-ansible

**Copied from https://github.com/TitusTech/docker-ansible**

## Setup docker container with Ansible
Run `./setup.sh` to
- run a container with linux and ansible installed
- install Galaxy collections

### References:
- https://hub.docker.com/r/williamyeh/ansible/
  - https://github.com/William-Yeh/docker-ansible/tree/master/master-ubuntu18.04
  - https://www.slideshare.net/williamyeh/ansible-docker-65362893
- https://galaxy.ansible.com/darkwizard242/docker
- https://galaxy.ansible.com/darkwizard242/dockercompose

## Run Ansible playbook
- Test servers: `./run.sh`
- Prod servers: `./run.sh -e "variable_host=prod"`
- Verbose: `./run.sh -vvv`, or even `./run.sh -vvvv` for very verbose
