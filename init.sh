#!/bin/bash

cd terraform
terraform init
terraform plan -var-file="dev.tfvars"