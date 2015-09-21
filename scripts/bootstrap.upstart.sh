# FIXME: remove reliance on sudo

set -o errexit
set -o nounset

# get salt
# FIXME: make this platform independent or change script name
# FIXME: remove all the sudo -E by passing the environment through in sudoers
sudo -E apt-get update
sudo -E apt-get -y install python-git git python-software-properties software-properties-common
sudo -E add-apt-repository -y ppa:saltstack/salt
sudo -E apt-get update
sudo -E apt-get -y install salt-minion
sudo service salt-minion stop

# Place my brood files in srv... TODO: determine if this dir is right for masterless
# FIXME: add interaction to determine which repo
sudo mkdir -p /srv/salt
sudo rm -rf /srv/salt/my-brood
cd /srv/salt/
sudo -E git clone https://github.com/hatchery/my-brood /srv/salt/my-brood

cd /srv/salt/my-brood
sudo -E salt-call --local --config-dir=./ state.highstate
