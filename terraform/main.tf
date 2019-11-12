terraform {
  backend "gcs" {
    bucket = "terra-bucket-1234"
    prefix = "terraform/state"
  }
}
provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}