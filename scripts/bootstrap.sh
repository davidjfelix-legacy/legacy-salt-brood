# get salt
# get these files
# run salt
curl -L https://bootstrap.saltstack.com | sudo sh
sudo salt-call --local --config-dir=./ state.highstate
