
ansible --version

if [ $? -ne 0 ]; then
    sudo apt-get update
    sudo apt-get install -qqy python-pip libssl-dev
    sudo pip install cryptography ansible
    sudo ansible-galaxy install -r requirements.yml
fi

group=docker
cmd="ansible-playbook -i hosts ./playbook.yml"

if [ $(id -gn) != $group ]; then
  if ! grep -q $group /etc/group; then
    sudo groupadd docker
  fi

  if ! groups | grep -q $group; then
    sudo usermod -aG docker $USER
    #exec sg $group "$0 $*"
    exec sg $group "$cmd --extra-vars \"$1\""
    return
  fi
fi

echo $cmd
$cmd --extra-vars "$1"

