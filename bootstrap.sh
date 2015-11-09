#!/bin/bash

PLAYBOOK=$1
HOSTS=$2

echo "Installing Ansible"
apt-get install software-properties-common -y --force-yes >/dev/null
apt-add-repository -y ppa:ansible/ansible >/dev/null
apt-get update >/dev/null
apt-get install ansible -y --force-yes >/dev/null

echo "Installing roles..."
ansible-galaxy install angstwad.docker_ubuntu

echo "Running Ansible..."
# Copy hosts files to /tmp to workaround executable problem
cp ${HOSTS} /tmp/ && chmod -x /tmp/hosts
ansible-playbook ${PLAYBOOK} --inventory-file=/tmp/hosts --connection=local
