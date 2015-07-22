# FIXME: remove reliance on sudo

set -o errexit
set -o nounset

# get salt
# FIXME: security vulnerability
curl -L https://bootstrap.saltstack.com | sudo sh -s -- -P git develop
sudo systemctl stop salt-minion
sudo systemctl disable salt-minion

# FIXME: make this platform independent
sudo apt-get -y install python-git git

# Place my brood files in srv... TODO: determine if this dir is right for masterless
# FIXME: add interaction to determine which repo
sudo mkdir -p /srv/salt
sudo git clone https://github.com/hatchery/my-brood /srv/salt/my-brood

cd /srv/salt/my-brood
sudo salt-call --local --config-dir=./ state.highstate
