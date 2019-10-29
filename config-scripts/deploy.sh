cd 
git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
wget -O /etc/systemd/system/puma.service https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/puma.service
systemctl daemon-reload

# Enable so it starts on boot
systemctl enable puma.service

# Initial start up.
systemctl start puma.service

# Check status
systemctl status puma.service