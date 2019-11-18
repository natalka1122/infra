#/bash/sh
set -xe
#./packer_one.sh reddit-db-only.json
#./packer_one.sh reddit-db-ruby.json
#./packer_one.sh reddit-ruby.json
./packer_one.sh reddit-db-ruby-app.json
./packer_one.sh reddit-ruby-app.json
