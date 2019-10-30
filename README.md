This is an infrastructure repo
Initialize command :
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app --metadata startup-script="curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/main.sh ^| bash"

TODO: make username as a parameter, not hardcode