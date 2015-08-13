# FIXME: remove reliance on sudo

set -o errexit
set -o nounset

# get salt
# FIXME: make this platform independent or change script name
sudo apt-get update
sudo apt-get -y install python-git git python-software-properties software-properties-common
sudo add-apt-repository -y ppa:saltstack/salt
sudo apt-get update
sudo apt-get -y install salt-minion
sudo service salt-minion stop

# Place my brood files in srv... TODO: determine if this dir is right for masterless
# FIXME: add interaction to determine which repo
sudo mkdir -p /srv/salt
sudo rm -rf /srv/salt/my-brood
sudo git clone https://github.com/hatchery/my-brood /srv/salt/my-brood

cd /srv/salt/my-brood
sudo salt-call --local --config-dir=./ state.highstate
