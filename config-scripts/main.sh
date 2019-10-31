#!/bin/bash
USERNAME=appuser
for i in "$@"
do
case $i in
    -U=*|--username=*)
    USERNAME="${i#*=}"
    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done
getent passwd "${USERNAME}" > /dev/null
if [ $? -eq 0 ]; then
    echo "Using username  ${USERNAME}"
else
    echo "Specified user ${USERNAME} does not exist"
fi
curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/install_mongodb.sh | bash
curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/install_ruby_deploy.sh | sudo -u "${USERNAME}" -H bash
curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/service_install.sh | bash