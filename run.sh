#!/bin/bash

docker exec -it ansible ansible-playbook "$@" -i inventory.ini playbook.yml

