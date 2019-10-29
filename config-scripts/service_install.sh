sudo wget -O /etc/systemd/system/puma.service https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/puma.service
sudo systemctl daemon-reload

# Enable so it starts on boot
sudo systemctl enable puma.service

# Initial start up.
sudo systemctl start puma.service

# Check status
sudo systemctl status puma.service