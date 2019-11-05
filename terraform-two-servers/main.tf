terraform {
  backend "gcs" {
    bucket = "terra-bucket-1234"
    prefix = "terraform-one-server/state"
  }
}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "./modules/app"
  key_path_public = "${var.key_path_public}"
  key_private     = "${file(var.key_path_private)}"
  use_ssh_agent   = "${var.use_ssh_agent}"
  disk_image_app  = "${var.disk_image_app}"
  username        = "${var.username}"
}
module "vpc" {
  source       = "./modules/vpc"
  source_range = "${var.ssh_source_address}"
}
