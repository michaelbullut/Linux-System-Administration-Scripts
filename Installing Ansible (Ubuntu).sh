#!/bin/bash 
apt update -y # Refreshing the system repository 
apt install software-properties-common -y # Install the tool to manage software repositories 
add-apt-repository --yes --update ppa:ansible/ansible -y # Add Official Ansible P.P.A. Repository 
apt update -y # Refreshing the system repository again 
apt install -y ansible yamllint ansible-lint # Install Ansible & YAML Debugging Tools 
ansible --version # Verify the Ansible installation 
# end of script 