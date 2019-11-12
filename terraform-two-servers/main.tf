terraform {
  backend "gcs" {
    bucket = "terra-bucket-1234"
    prefix = "terraform-two-servers/state"
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
  net_tag_app     = "${var.net_tag_app}"
  db_address      = "${module.db.db_internal_ip}"
}
module "db" {
  source          = "./modules/db"
  key_path_public = "${var.key_path_public}"
  disk_image_db   = "${var.disk_image_db}"
  username        = "${var.username}"
  net_tag_db      = "${var.net_tag_db}"
}
module "vpc" {
  source       = "./modules/vpc"
  ssh_source_range = "${var.ssh_source_address}"
  net_tag_db      = "${var.net_tag_db}"
  net_tag_app     = "${var.net_tag_app}"
}
