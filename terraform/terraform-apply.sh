#!/bin/bash

# Decrypt Ansible Vault and export variables
eval $(ansible-vault view secrets.yml | sed 's/: /=/')

# Run Terraform with variables
terraform apply -var="yc_token=$yc_token" \
                -var="yc_cloud_id=$yc_cloud_id" \
                -var="yc_folder_id=$yc_folder_id"