#/bin/sh
set -xe
packer build -var-file=variables.json $1
