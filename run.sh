
ansible --version

if [ $? -ne 0 ]; then
    sudo apt-get update
    sudo apt-get install -qqy python-pip libdev-ssl
    sudo pip install cryptography ansible
    sudo ansible-galaxy install -r requirements.yml
fi

group=docker

if [ $(id -gn) != $group ]; then
  if ! grep -q $group /etc/group; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
    exec sg $group "$0 $*"
  fi
fi

ansible-playbook -i hosts ./playbook.yml
