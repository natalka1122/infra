This is an infrastructure repo
Initialize command :
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app --metadata startup-script="curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/main.sh ^| bash"
Firewall command :
gcloud compute firewall-rules create allow-tcp-9292-for-puma-server --allow=tcp:9292 --source-ranges=0.0.0.0/0 --direction=ingress --target-tags=puma-server

TODO: make username as a parameter, not hardcode

Packer
Check if config is good
packer validate -var-file=variables.json ubuntu16.json

Create image
packer build -var-file=variables.json ubuntu16.json

Create an instance from image (notice that --image-project is not defined https://cloud.google.com/sdk/gcloud/reference/compute/instances/create#--image-project)
gcloud compute instances create --boot-disk-size=10GB --image=reddit-base-1572592917  --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-base

Immutable image == with installed app
packer build -var-file=variables.json immutable.json

===From terraform folder===
Terraform start command
terraform init

Terraform dry-run
terraform plan

Terraform run
terraform apply

Terraform kill all command
terraform destroy

Terraform beautify
terraform fmt