sudo wget -O /etc/systemd/system/puma.service https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/puma.service
sudo systemctl daemon-reload
sudo systemctl enable puma.service
sudo systemctl start puma.service