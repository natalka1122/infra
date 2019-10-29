
curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/install_mongodb.sh | bash
curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/install_ruby.sh | sudo -u appuser -H bash
curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/deploy.sh | sudo -u appuser -H bash