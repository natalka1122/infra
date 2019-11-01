wget -O /etc/systemd/system/puma.service https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/puma.service
systemctl daemon-reload
systemctl enable puma.service
systemctl start puma.service