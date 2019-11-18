# Infrastructure repo to deploy this application: <https://github.com/natalka1122/reddit>

## GCloud straightaway commands

Create instance from clean ubuntu and auto-install everything:

```bash
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app --metadata startup-script="curl https://raw.githubusercontent.com/natalka1122/infra/master/config-scripts/main.sh ^| bash"
```

Create firewall rule:

```bash
gcloud compute firewall-rules create allow-tcp-9292-for-puma-server --allow=tcp:9292 --source-ranges=0.0.0.0/0 --direction=ingress --target-tags=puma-server
```

## Packer - creates images - files lie in the packer folder

Check if config is good

```bash
packer validate -var-file=variables.json ubuntu16.json
```

Create an image

```bash
packer build -var-file=variables.json ubuntu16.json
```

One can create an instance from image using gcloud command (note that --image-project is not defined due to {<https://cloud.google.com/sdk/gcloud/reference/compute/instances/create#--image-project>)

```bash
gcloud compute instances create --boot-disk-size=10GB --image=CHANGEME  --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-base
```

### Description of packer files included

+ variables.json.sample = rename it to variables.json and change values
+ reddit-db.json = Image with mongodb installed
+ reddit-app-ready.json = Image with ruby installed. Needs mongodb connection. Ready to deploy the app
+ reddit-app.json = Image with ruby installed and app deployed. Needs mongodb connection.
+ ubuntu16.json = Image with mongodband ruby installed. Ready to deploy the app
+ immutable.json = Image with everything installed. Production ready

## Terraform - commands to create infrastructure

Terraform start command

```bash
terraform init
```

Terraform dry-run

```bash
terraform plan
```

Terraform run

```bash
terraform apply
```

Terraform kill all

```bash
terraform destroy
```

Terraform beautify

```bash
terraform fmt
```

## Created infrastructure

1) one server from ubuntu16 with app provisioned
2) two servers from reddit-db and reddit-app-ready with app provisioned

## In ansible folder created files for images creation isinf ansible provisioner
### Image name agreement

|  | mongod | mongod-only | ruby | app |
|--------------------|--------|-------------|------|-----|
| reddit-db-only | + | + |  |  |
| reddit-ruby |  |  | + |  |
| reddit-db-ruby | + |  | + |  |
| reddit-ruby-app |  |  | + | + |
| reddit-db-ruby-app | + |  | + | + |
