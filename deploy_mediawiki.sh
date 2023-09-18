#!/bin/bash

./init.sh

cd terraform
terraform apply -var-file="dev.tfvars" -auto-approve

cd ../ansible
ansible-playbook mediawiki.yml

