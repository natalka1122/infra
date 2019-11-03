#!/usr/bin/env bash
set -e
HOMEDIR=$(grep $(whoami) /etc/passwd  | cut -d ":" -f6)
source "$HOMEDIR/.rvm/scripts/rvm"
git clone https://github.com/natalka1122/reddit
cd reddit && bundle install
sed -i s/appuser/$(whoami)/g /tmp/puma.service
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl daemon-reload
sudo systemctl enable puma.service
sudo systemctl start puma.service