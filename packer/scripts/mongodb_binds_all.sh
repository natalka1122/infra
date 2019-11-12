sudo sed -i 's/bindIp: 127.0.0.1/bindIpAll: true/' /etc/mongod.conf
sudo systemctl restart mongod