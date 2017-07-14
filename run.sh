#!/bin/bash

ansible --version

if [ $? -ne 0 ]; then
    sudo apt-get update
    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt-get update
    sudo apt-get install ansible
fi


if ! sudo ansible-galaxy list | grep -q 'nginx'; then
    sudo ansible-galaxy install -r requirements.yml
    sudo chown -R $USER ~/.ansible
fi

group=docker
cmd="ansible-playbook -i hosts ./playbook.yml"

if [ $(id -gn) != $group ]; then
  if ! grep -q $group /etc/group; then
    sudo groupadd docker
  fi

  if ! groups | grep -q $group; then
    sudo usermod -aG docker $USER
    exec sg $group "$cmd --extra-vars \"$1\""
    return
  fi
fi

echo $cmd
$cmd --extra-vars "$1"

