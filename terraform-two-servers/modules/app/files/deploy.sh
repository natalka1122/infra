#!/usr/bin/env bash
set -e
HOMEDIR=$(grep $(whoami) /etc/passwd  | cut -d ":" -f6)
source "$HOMEDIR/.rvm/scripts/rvm"
git clone https://github.com/natalka1122/reddit
if [ -n $1 ]; then
    sed -i "s/127.0.0.1/$1/g" reddit/app.rb ## this is a workaround. I've tried "export DATABASE_URL" but it does not work
fi
cd reddit && bundle install
sed -i s/appuser/$(whoami)/g /tmp/puma.service
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl daemon-reload
sudo systemctl enable puma.service
sudo systemctl start puma.service