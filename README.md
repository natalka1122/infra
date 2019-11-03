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

WHAT DO I WANT:
Packer - with parametrized username
0) variables.json - external packer variables
1) ubuntu16.json - only mongodb and ruby == DONE
2) immutable.json - all-included image == DONE
3) reddit-db.json - only mongodb included == DONE
4) reddit-app-ready.json - ruby included == TODO==TEST - creating
5) reddit-app.json - app and ruby included == TODO==TEST

terraform
1) one server from ubuntu16 with app provisioned
2) two servers from reddit-db and reddit-app-ready with app provisioned